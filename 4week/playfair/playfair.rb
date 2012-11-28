require_relative 'roller'

class Playfair

  attr_reader :cipher_string, :cipher_square

  def initialize key_phrase = ""
    set_key_phrase key_phrase
  end

  def encode_message plain_message
    plain = format_message(sanitize(plain_message))
    encoded = ""
    count = 0

    loop do
      break if plain[count] == nil
      pair = encode_pair(plain[count],plain[count.next])
        #puts "Encoded pair #{pair.to_s}"
      encoded << pair[0] + pair[1]
      count += 2
    end
    encoded
  end

  def encode_pair a, b
     #puts "Encoding pair: #{a}, #{b}"
    a_row, a_column = find_row_and_column a
    b_row, b_column = find_row_and_column b
     #puts a_row, a_column, b_row, b_column

    #do row logic
    if a_row == b_row

      #x = get_right a
      #y = get_right b

      x = letter_at(a_row, (a_column+1))
      y = letter_at(b_row, (b_column+1))
      return [x, y]
    end

    #do column logic
    if a_column == b_column
      #x = get_below a
      #y = get_below b

      x = letter_at((a_row+1), a_column)
      y = letter_at((b_row+1), b_column)
      return [x, y]
    end

    # else doing rectangle logic
    x = letter_at a_row, b_column
    y = letter_at b_row, a_column
    [x, y]
  end

  def letter_at row, column
    row =1 if row > 5
    column =1 if column > 5
      #puts "checking [#{row},#{column}]"
    index = (row-1) * 5 + column - 1
    @cipher_string[index]
  end

  #def get_below letter
  #  index = @cipher_string.index(letter)
  #  index += 5
  #  if index > 24
  #    index -= 25
  #  end
  #
  #   #puts index
  #  @cipher_string[index]
  #end
  #
  #def get_right letter
  #  index = @cipher_string.index(letter)
  #  index += 1
  #  if find_row_and_column(letter)[1] == 5
  #    index -= 5
  #  end
  #  @cipher_string[index]
  #end

  def find_row_and_column letter
    row = (@cipher_string.index(letter) / 5) + 1
    column = @cipher_string.index(letter) % 5 + 1
    [row, column]
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
    spacer = Roller.new(["X", "Z"])

    while message[position] != nil
      if message[position] == message[position.next]
        message.insert(position+1,spacer.next)
      end
      position += 2
    end

    if message.length.odd?
      message << "X"
    end
    message
  end
end
