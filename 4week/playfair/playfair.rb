require_relative 'roller'

class Playfair

  attr_reader :cipher_string, :cipher_square

  def initialize key_phrase = ""
    set_key_phrase key_phrase
  end

  def encrypt plain_message
    encode_message plain_message
  end

  def encode_message plain_message
    plain = format_message(sanitize(plain_message))
    encoded = ""
    count = 0

    until plain[count] == nil
      pair = encode_pair(plain[count],plain[count.next])
      encoded << pair[0] + pair[1]
      count += 2
    end
    encoded
  end
  
  def encode_pair a, b
    encode_decode_pair a, b, "encode"
  end
  def encode_decode_pair a, b, cypher 
    cypher == "encode" ? direction = 1 : direction = -1
    
    a_row, a_column = find_row_and_column a
    b_row, b_column = find_row_and_column b

    #do row logic
    if a_row == b_row
      x = letter_at(a_row, a_column + direction)
      y = letter_at(b_row, b_column + direction)
      return [x, y]
    end

    #do column logic
    if a_column == b_column
      x = letter_at(a_row + direction, a_column)
      y = letter_at(b_row + direction, b_column)
      return [x, y]
    end

    # else doing rectangle logic
    x = letter_at a_row, b_column
    y = letter_at b_row, a_column
    [x, y]
  end

  def letter_at row, column
    row = 1 if row > 5
    column = 1 if column > 5
    row = 5 if row < 1
    column = 5 if column < 1
      #puts "checking [#{row},#{column}]"
    index = (row-1) * 5 + column - 1
    @cipher_string[index]
  end

  def find_row_and_column letter
    row = (@cipher_string.index(letter) / 5) + 1
    column = @cipher_string.index(letter) % 5 + 1
    [row, column]
  end

  def decrypt coded_message
    decode_message coded_message
  end

  def decode_message coded_message
    plain = format_message(sanitize(coded_message))
    encoded = ""
    count = 0

    until plain[count] == nil
      pair = decode_pair(plain[count],plain[count.next])
        #puts "Encoded pair #{pair.to_s}"
      encoded << pair[0] + pair[1]
      count += 2
    end
    encoded
  end

  def decode_pair a, b
    encode_decode_pair a, b, "decode"
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
    sanitized_key = sanitize(@key_phrase).gsub("J","I")
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
      formated << "\n" if char_count % 5 == 0
      char_count += 1
    end
    formated.chomp
  end

  def square
    # needs to return array of 5 row arrays
    square = []
    temp = []
    char_count = 1

    @cipher_string.each_char do |char|
      temp << "#{ char }"
      if char_count % 5 == 0
        square << temp.dup
        temp.clear
      end
      char_count += 1
    end
    square
  end

  def format_message string
    message = sanitize string
    position = 0
    spacer = Roller.new(["X", "Z"])

    while message[position] != nil
      message.insert(position+1,spacer.next) if message[position] == message[position.next]
      position += 2
    end

    message << "X" if message.length.odd?
    message
  end
end
