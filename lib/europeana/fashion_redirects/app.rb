# frozen_string_literal: true
require 'newrelic_rpm'
require 'pg'
require 'sinatra'
require 'sinatra/activerecord'

module Europeana
  module FashionRedirects
    ##
    # Sinatra app to handle redirects for Europeana Fashion URLs
    class App < Sinatra::Base
      register Sinatra::ActiveRecordExtension

      configure do
        set :connection, ActiveRecord::Base.connection
        set :sites, {
          portal: ENV['SITE_PORTAL_URL'] || 'http://www.europeana.eu',
          pro: ENV['SITE_PRO_URL'] || 'http://pro.europeana.eu'
        }
      end

      get '*' do
        path = params['splat'].first
        redirect = Redirect.find_by_src(path)

        if redirect.present?
          redirect to(settings.sites[redirect.site.to_sym] + redirect.dst), 301
        else
          headers({ 'Content-Type' => 'text/plain;charset=utf-8' })
          status 404
          body 'Not Found'
        end
      end
    end
  end
end
