# frozen_string_literal: true
require 'newrelic_rpm'
require 'mongo'
require 'sinatra'
require 'europeana/fashion_redirects'

module Europeana
  module FashionRedirects
    ##
    # Sinatra app to handle redirects for Europeana Fashion URLs
    class App < Sinatra::Base
      configure do
        db = Mongo::Client.new(ENV['MONGO_URI'])
        set :mongo_db, db[:redirects]
      end

      get '/' do
        redirect to('http://www.europeana.eu/portal/collections/fashion'), 301
      end

      get '/record/a/:hash' do
        result = settings.mongo_db.find({ fashion_hash: params['hash'] })

        if result.count == 1
          id = result.first[:europeana_id]
          redirect to("http://www.europeana.eu/portal/record#{id}.html"), 301
        else
          headers({ 'Content-Type' => 'text/plain;charset=utf-8' })
          status 404
          body 'Not Found'
        end
      end
    end
  end
end
