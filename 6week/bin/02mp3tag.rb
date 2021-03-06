#!/usr/bin/env ruby
#
require './lib/mp3file'
require './lib/mp3info'

def usage
  unless ARGV.length == 1 && File.exist?(ARGV[0])
  puts <<LIST_INSTRUCTIONS

Shows ID3 TAG information from mp3 files

Usage: 02mp3tag FILE

       FILE       mp3 file

example:   02mp3tag.rb song.mp3

LIST_INSTRUCTIONS
  exit(1)
  end
end
#
usage
#
tag_from_file = Mp3File.get_tag(ARGV[0])
tag_info = Mp3Info.new(tag_from_file)
mp3info = tag_info.song
if tag_info.valid?
  puts <<MP3INFO
 The Title is   : #{ mp3info[:title] }
 The Artist is  : #{ mp3info[:artist] }
 The Album is   : #{ mp3info[:album] }
 The Year is    : #{ mp3info[:year] }
 The Comment is : #{ mp3info[:comment] }
 The Track No is: #{ mp3info[:track] }
MP3INFO
else
  puts "Sorry #{ ARGV[0] } Does not have a valid mp3 TAG."
end
