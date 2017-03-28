# frozen_string_literal: true
require File.expand_path('../config/boot', __FILE__)

require 'sinatra/activerecord/rake'
Dir.glob('lib/tasks/*.rake').each { |r| load r }

namespace :db do
  task :load_config do
    require 'europeana/fashion_redirects/app'
  end
end
