#!/usr/bin/env ruby

if false
 x = pqr
end
puts x   #=> nil
puts pqr #=> undefined local variable

# seems like internaly ruby when ruby incounters the x = it sets it up as a
# variable = nil.
# This is strange because the flow of execution does not even
# go through the x = pqr. section since false is not true.
# try substituting x = pqr, with x = "some string" and it will still be nil.
# So just having a "variable =" in your code will create it but it will be nil.
# until something sets it.
