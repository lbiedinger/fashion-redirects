# frozen_string_literal: true
$LOAD_PATH.unshift(File.expand_path('../../lib', __FILE__))

require 'bundler/setup'
ENV['RACK_ENV'] ||= 'development'
Bundler.require(:default, ENV['RACK_ENV'])

require 'dotenv'
Dotenv.load

require 'europeana/fashion_redirects'
