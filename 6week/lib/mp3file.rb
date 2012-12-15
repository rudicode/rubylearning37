class Mp3File
  def self.get_tag filename
    return nil unless File.exist?(filename)

    mp3file = File.new(filename, "r")
    mp3file.seek(-128, IO::SEEK_END)
    data = mp3file.read
    mp3file.close
    data
  end
end
