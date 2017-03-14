# frozen_string_literal: true
require 'newrelic_rpm'
require 'pg'
require 'sinatra'
require 'europeana/fashion_redirects'

module Europeana
  module FashionRedirects
    ##
    # Sinatra app to handle redirects for Europeana Fashion URLs
    class App < Sinatra::Base
      configure do
        set :pg_db, PG.connect(ENV['DATABASE_URL'])
        set :sites, {
          portal: ENV['SITE_PORTAL_URL'] || 'http://www.europeana.eu',
          pro: ENV['SITE_PRO_URL'] || 'http://pro.europeana.eu'
        }
      end

      get '/' do
        redirect to(settings.sites[:portal] + '/collections/fashion'), 301
      end

      get '*' do
        path = params['splat'].first
        result = settings.pg_db.exec_params('SELECT * FROM redirects WHERE src=$1', [path])

        if result.count == 1
          rule = result.first
          if settings.sites.key?(rule['site'].to_sym)
            redirect to(settings.sites[rule['site'].to_sym] + rule['dst']), 301
          else
            # Unrecognised site
            headers({ 'Content-Type' => 'text/plain;charset=utf-8' })
            status 500
            body 'Internal Server Error'
          end
        else
          headers({ 'Content-Type' => 'text/plain;charset=utf-8' })
          status 404
          body 'Not Found'
        end
      end
    end
  end
end
