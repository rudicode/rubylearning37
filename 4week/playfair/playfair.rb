class Playfair

  def initialize key_phrase = ""
    @cipher_square = create_cipher_square key_phrase
  end

  def encode_message plain_message
    # currently a place holder method
    plain_message
  end

  def decode_message coded_message
    # currently a place holder method
    coded_message
  end

  def set_new_key key_phrase
    @key = key_phrase
    @cipher_square = create_cipher_square key_phrase
    @cipher_square_formated = format_cipher_square
  end

  def create_cipher_square key_phrase
    sanitized_key = sanitize key_phrase
    alpha_string = "ABCDEFGHIKLMNOPQRSTUVWXYZ" # <== note missing J
    cipher_square = ""

    sanitized_key.each_char do |char|
      if alpha_string.include?(char)
        cipher_square << char
        alpha_string.gsub!(char,'')
      end
    end
    #puts "Alpha String  is: #{ alpha_string } and length is #{ alpha_string.length }"
    #puts "Cipher Square is: #{ cipher_square } and length is #{ cipher_square.length }"
    #puts "Finished create_cipher_square"
    cipher_square + alpha_string
  end

  def sanitize string
    # remove all characters not A-Z and upcase
    string.upcase.gsub(/[^A-Z]/, "")
  end

  def format_cipher_square cipher_square
    formated = ""
    char_count = 1
    cipher_square.each_char do |char|
      formated << "#{ char } "
      if char_count % 5 == 0
        formated << "\n"
      end
      char_count += 1
    end
    formated.chomp
  end

end
