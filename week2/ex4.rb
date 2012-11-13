#puts (expand = defined?( expand ) ? expand : true)



def what_is_expand
  if defined?( expand )
    expand
  else
    true
  end
end
expand = "a"
puts what_is_expand
expand = false
puts what_is_expand
