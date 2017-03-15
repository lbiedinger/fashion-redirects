# frozen_string_literal: true
require File.expand_path('../config/boot', __FILE__)

require 'europeana/fashion_redirects/app'
run Europeana::FashionRedirects::App
