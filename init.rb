require 'dotenv'
require 'sequel'
require 'pg'
Dotenv.load

require 'logger'
DB = Sequel.connect(ENV['DATABASE_URL'], logger: Logger.new(STDOUT))
DB.timezone = :utc
Sequel.extension :core_extensions, :migration