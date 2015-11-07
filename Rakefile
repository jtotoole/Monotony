require 'sequel'
require 'pg'
require 'rest'
require 'dotenv'
Dotenv.load

require 'logger'
DB = Sequel.connect(ENV['DATABASE_URL'], logger: Logger.new(STDOUT))
DB.timezone = :utc
Sequel.extension :core_extensions, :migration

desc 'Get Artsy.net HTML content size'
task :daily_measure do 
  response = REST.head('https://www.artsy.net')
  content_length = response.headers['content-length']
  measurements_table = DB[:measurements]
  measurements_table.insert(:size => content_length, :created_at => Time.now, :updated_at => Time.now)
  puts content_length
end

desc 'Create DB'
task :create do
 sh "createdb -h localhost monotony_development -E UTF8"
end

desc 'Migrate that shit'
task :migrate do
  Sequel::Migrator.run(
    DB,
    'migrations',
    table: 'schema_info',
    version: Dir['migrations/*'].count { |file| File.file?(file) }
  )
end