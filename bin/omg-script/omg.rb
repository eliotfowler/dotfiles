#!/usr/bin/env ruby
require 'rubygems'
require 'bundler/setup'
require 'Imessage'

text = "🎈  omg"
text = "#{ARGV[0]} omg" if ARGV.count > 0

num_times = 1

num_times = ARGV[1].to_i if ARGV.count == 2

num_times.times do
  sender = Imessage::Sender.new
  sender.deliver({text: text, attachment: nil, contacts: [8179961341]})
end
