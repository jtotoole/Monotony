require 'sequel'
require 'pg'
require 'rest'
require_relative "./init"

desc 'Get Artsy.net HTML content size'
task :daily_measure do 
  response = REST.head('https://www.artsy.net')
  content_length = response.headers['content-length']
  measurements_table = DB[:measurements]
  measurements_table.insert(:size => content_length, :created_at => Time.now, :updated_at => Time.now)
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