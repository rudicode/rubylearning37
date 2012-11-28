class Playfair

  attr_reader :cipher_string, :cipher_square

  def initialize key_phrase = ""
    @spacer = "Z"
    set_key_phrase key_phrase
  end

  def encode_message plain_message
    # currently a place holder method
    plain_message
  end

  def decode_message coded_message
    # currently a place holder method
    coded_message
  end

  def set_key_phrase key_phrase
    @key_phrase = key_phrase
    @cipher_string = create_cipher_string
    @cipher_square = create_cipher_square
  end

  def sanitize string
    # remove all characters not A-Z and upcase
    string.upcase.gsub(/[^A-Z]/, "")
  end

  def create_cipher_string
    sanitized_key = sanitize @key_phrase
    sanitized_key.gsub!("J","I")
    alpha_string  = "ABCDEFGHIKLMNOPQRSTUVWXYZ" # <== note missing J
    cipher_string = ""

    sanitized_key.each_char do |char|
      if alpha_string.include?(char)
        cipher_string << char
        alpha_string.gsub!(char,'')
      end
    end
    cipher_string + alpha_string
  end

  def create_cipher_square
    formated = ""
    char_count = 1
    @cipher_string.each_char do |char|
      formated << "#{ char } "
      if char_count % 5 == 0
        formated << "\n"
      end
      char_count += 1
    end
    formated.chomp
  end

  def format_message string
    message = sanitize string
    position = 0
    while message[position] != nil
      if message[position] == message[position.next]
        message.insert(position+1,spacer_next)
        
      end
      position += 2
    end
    if message.length.odd?
      message << "X"
    end
    message
  end
  
  def spacer_next
    @spacer == "X" ? @spacer = "Z" : @spacer = "X"
  end
end
