#!/usr/bin/env ruby
require File.expand_path('../prompt', __FILE__)

name = prompt 'What is your name?'

puts "Hello, #{ name }, thanks for using the prompt."

