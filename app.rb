require 'sinatra'
require 'chronic'
require 'erb'
require 'tilt'
require_relative "./init"
measurements_table = DB[:measurements]

get '/' do
  dataset = measurements_table.where('created_at > ?', Date.today - 7)
  template = Tilt.new('views/index.html.erb')
  template.render(nil, :dataset => dataset)
end