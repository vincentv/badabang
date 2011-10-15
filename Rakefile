#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

DeadOrAlive::Application.load_tasks

desc "Update normalize.css"
task :update_normalize do
  require 'open-uri'
  res = open 'https://raw.github.com/necolas/normalize.css/master/normalize.css'
  File.open('app/assets/stylesheets/_normalize.css.scss', 'w') do |f|
    f << res.read
  end
end
