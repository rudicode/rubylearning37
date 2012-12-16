class Mp3Info
  # Mp3Info will respond to the following dynamicaly generated methods
  # :track
  # :title
  # :artist
  # :album
  # :year
  # :comment
  # :genre

  attr_reader :song, :tag_info, :header

  def initialize tag_info
    @song = { }
    get_info tag_info
  end

  def get_info tag_info
    @tag_info = tag_info
    @header = tag_info.byteslice(0..2)
    if valid?
      @song[:track]   = 0
      @song[:title]   = tag_info.byteslice(3..32).partition("\x00").first
      @song[:artist]  = tag_info.byteslice(33..62).partition("\x00").first
      @song[:album]   = tag_info.byteslice(63..92).partition("\x00").first
      @song[:year]    = tag_info.byteslice(93..96).partition("\x00").first
      @song[:comment] = tag_info.byteslice(97..126).partition("\x00").first
      @song[:track]   = tag_info.getbyte(126) if (tag_info.getbyte(125) == 0)
      @song[:genre]   = tag_info.getbyte(127).ord
      return @song
    else
      @song.clear
    end
  end

  def valid?
    @header == 'TAG' && @tag_info.length == 128
  end

  def method_missing(method, *args, &blk)
    @song.has_key?(method) and @song[method] or super
  end

  def respond_to_missing?(name, private = false)
    @song.has_key?(name) or super
  end
end
