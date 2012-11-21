#!/usr/bin/env ruby
# Document Stats
#
def usage
  unless ARGV.length == 1 && File.exist?(ARGV[0])

  puts <<LIST_INSTRUCTIONS

Outputs Document statistics

Usage: analyzer FILE

       FILE       the file to analyze

example:
          analyzer.rb text.txt

LIST_INSTRUCTIONS
    exit 1
  end
end
#

def count_characters line
  line.strip.length
end

def count_characters_no_whitespace line
  line.strip.gsub(" ","").length
end

def count_words line
  line.split(" ").length
end

def count_sentences line
  line.scan(/\.|\!|\?/).length
    # the regex above took a while until I used this site, www.rubular.com
    # really helps in understanding regex.
end

def count_paragraphs line
  # TODO
  # how about the case where you have "...blah blah.\n\n\n"
  # it should only count as 1 paragraph in that case.
  #
  sanitize = line.gsub("\r","") #sometimes files have \r carrige returns
  return 1 if sanitize == "\n"
  0
end

def analize filename
  # TODO: fix this to hash
  # trying to hold values in an stats array but it is cumbersome to use and
  # remember which element is where. Could lead to wrong calculations
  # very easly.

  stats = [ 0, 0, 0, 0, 0, 0, 0, 0 ]
  #line_count = 0
  #character_count = 0
  #character_count_no_whitespace = 0
  #word_count = 0
  #sentence_count = 0
  #paragraph_count = 0
  #average_words_per_sentence = 0
  #average_sentences_per_paragarph = 0

  file_in = File.new(filename, "r")

  while line_in = file_in.gets
    # line_count += 1
    stats[0] += 1
    stats[1] += count_characters line_in
    stats[2] += count_characters_no_whitespace line_in
    stats[3] += count_words line_in
    stats[4] += count_sentences line_in
    stats[5] += count_paragraphs line_in
  end

  file_in.close

  unless stats[4] == 0

    stats[5] += 1 # last paragraph gets missed because there is no \n
    stats[6] = stats[3] / stats[4].to_f
    stats[7] = stats[4] / stats[5].to_f

  end

  stats
   #[ stats[0], character_count, character_count_no_whitespace, word_count,
   #sentence_count, paragraph_count, average_words_per_sentence,
   #average_sentences_per_paragarph ]
end

def display_analyisis stats

  puts <<DISPLAY_DATA

Total Line Count                     : #{ stats[0] }
Total Character Count                : #{ stats[1] }
Total Character Count (no whitespace): #{ stats[2] }
Total Word Count                     : #{ stats[3] }
Total Sentence Count                 : #{ stats[4] }
Total Paragraph Count                : #{ stats[5] }
Ave. Words per Sentence              : #{ "%.1f" % (stats[6]) }
Ave. Sentences per Paragraph         : #{ "%.1f" % (stats[7]) }
DISPLAY_DATA
end
# main
usage
filename = ARGV[0]
display_analyisis analize(filename)
