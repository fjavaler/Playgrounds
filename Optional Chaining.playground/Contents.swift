import Foundation

enum Genre: String {
  case country, blues, folk
}

struct Artist {
  let name: String
  var primaryGenre: Genre?
}

struct Song {
  let title: String
  let released: Int
  var artist: Artist?
}

func getArtistGenre(song: Song) -> String {
  if let genre = song.artist?.primaryGenre {
    return genre.rawValue
  } else {
    return "No genre found."
  }
}

print(getArtistGenre(song: Song(title: "Enter Sandman", released: 1991, artist: nil)))
