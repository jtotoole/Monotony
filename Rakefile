require 'sequel'
require 'pg'
require 'dotenv'
Dotenv.load

require 'logger'
DB = Sequel.connect(ENV['DATABASE_URL'], logger: Logger.new(STDOUT))
DB.timezone = :utc
Sequel.extension :core_extensions, :migration

task :daily_measure do 
  puts 'hello!'
end

desc 'Create DB'
task :create do
 sh "createdb -h localhost monotony_development -E UTF8"
end

task :migrate do
  Sequel::Migrator.run(
    DB,
    'migrations',
    table: 'schema_info',
    version: Dir['migrations/*'].count { |file| File.file?(file) }
  )
end