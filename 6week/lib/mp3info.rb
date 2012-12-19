require './lib/mp3_id_v1'

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
    @header = get_tag_at :header
    if valid?
      @song[:track]   = 0
      @song[:title]   = get_tag_at :title
      @song[:artist]  = get_tag_at :artist
      @song[:album]   = get_tag_at :album
      @song[:year]    = get_tag_at :year
      @song[:comment] = get_tag_at :comment
      @song[:track]   = tag_info.getbyte(126) if (tag_info.getbyte(125) == 0)
        # @song[:track]   = get_tag_at(:track).ord if (get_tag_at(:track_check).ord == 0)
      @song[:genre]   = get_tag_at(:genre).ord
      return @song
    else
      @song.clear
    end
  end

  def get_tag_at tag_name
    range = MP3IDv1::TAG[tag_name]
    @tag_info.byteslice(range).partition("\x00").first
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
