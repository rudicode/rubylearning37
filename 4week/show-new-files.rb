#!/usr/bin/env ruby
#

begin
usage
current_list_of_files = Dir.glob('**/*')
puts current_list_of_files
end if __FILE__ == $0
