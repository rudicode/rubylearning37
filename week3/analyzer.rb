#!/usr/bin/env ruby
# Document Stats
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
  character_count = 0
  character_count_no_whitespace = 0
  line_count = 0
  word_count = 0
  sentence_count = 0
  paragraph_count = 0
  average_words_per_sentence = 0
  average_sentences_per_paragarph = 0

  file_in = File.new(filename, "r")

  while line_in = file_in.gets
    line_count += 1
    character_count += count_characters line_in
    character_count_no_whitespace += count_characters_no_whitespace line_in
    word_count += count_words line_in
    sentence_count += count_sentences line_in
    paragraph_count += count_paragraphs line_in
  end

  file_in.close

  if sentence_count != 0

    paragraph_count += 1 # last paragraph gets missed because there is no \n
    average_words_per_sentence = word_count / sentence_count.to_f
    average_sentences_per_paragarph = sentence_count / paragraph_count.to_f

  end

   [ line_count, character_count, character_count_no_whitespace, word_count,
   sentence_count, paragraph_count, average_words_per_sentence,
   average_sentences_per_paragarph ]
end

def display_analyisis data

  puts <<DISPLAY_DATA

Total Line Count                     : #{ data[0] }
Total Character Count                : #{ data[1] }
Total Character Count (no whitespace): #{ data[2] }
Total Word Count                     : #{ data[3] }
Total Sentence Count                 : #{ data[4] }
Total Paragraph Count                : #{ data[5] }
Ave. Words per Sentence              : #{ "%.1f" % (data[6]) }
Ave. Sentences per Paragraph         : #{ "%.1f" % (data[7]) }
DISPLAY_DATA
end
#
if ARGV.length != 1
  puts ARGV.length
  puts <<LIST_INSTRUCTIONS

Outputs Document Statistics

Usage: analyzer FILE

       FILE       the file to analyze

example:
          analyzer text.txt

LIST_INSTRUCTIONS
  exit 1
end

filename = ARGV[0]

if File.exist?(filename)
  display_analyisis analize(filename)
else
  puts "File: '#{ filename }' does not exist"
end
