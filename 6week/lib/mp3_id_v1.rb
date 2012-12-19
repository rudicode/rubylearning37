module MP3IDv1
# define ranges of the MP3IDv1 tag 
TAG = {
  length:      128,
  header:      (0..2),
  title:       (3..32), 
  artist:      (33..62),
  album:       (63..92),
  year:        (93..96),
  comment:     (97..126),
  track_check: 125,
  track:       126,
  genre:       127,
}
end
