# frozen_string_literal: true
$LOAD_PATH.unshift(File.expand_path('../lib', __FILE__))
require 'europeana/fashion_redirects/app'
run Europeana::FashionRedirects::App
