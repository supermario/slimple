require 'rubygems'
require 'sinatra'
require 'slim'
require 'less'

Slim::Engine.set_default_options pretty: true, tabsize: 2

get '/' do
  @tpl = :page
  slim @tpl
end

get '/css/*.less' do
  filename = params[:splat].first
  # parse our output with less!
  less filename.to_sym
end

not_found do
  halt 404, 'Page not found'
end

helpers do
end
