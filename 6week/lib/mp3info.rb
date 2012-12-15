class Mp3Info
  attr_reader :all, :tag_info, :header

  def initialize tag_info
    @all = { }
    get_info tag_info
  end

  def get_info tag_info
    @header = tag_info.byteslice(0..2)
    if valid?
      @all[:track] = 0
      @all[:title]   , dummy_1, dummy_2 = tag_info.byteslice(3..32).partition("\x00")
      @all[:artist]  , dummy_1, dummy_2 = tag_info.byteslice(33..62).partition("\x00")
      @all[:album]   , dummy_1, dummy_2 = tag_info.byteslice(63..92).partition("\x00")
      @all[:year]    , dummy_1, dummy_2 = tag_info.byteslice(93..96).partition("\x00")
      @all[:comment] , dummy_1, dummy_2 = tag_info.byteslice(97..126).partition("\x00")
      (tag_info.getbyte(125) == 0) && (@all[:track] = tag_info.getbyte(126)) 
      @all[:genre]   = tag_info.getbyte(127).ord
    else
      @all.clear
    end
    @all
  end

  def valid?
    @header == 'TAG'
  end

  def title
    @all[:title]
  end

  def artist
    @all[:artist]
  end

  def album
    @all[:album]
  end

  def year
    @all[:year]
  end

  def comment
    @all[:comment]
  end

  def track
    @all[:track]
  end

  def genre
    @all[:genre]
  end
end
