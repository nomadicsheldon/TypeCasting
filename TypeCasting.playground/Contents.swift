import UIKit

// Defining a Class Hierarchy for Type Casting

class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}

let library = [
    Movie(name: "Run", director: "Himanshu"),
    Song(name: "La la", artist: "Shivanshu"),
    Movie(name: "Dhoom", director: "Aman"),
    Song(name: "3 idiot", artist: "Ayush"),
    Song(name: "kabir", artist: "Kartik")
]
// The type of "library" is inferred to be [MediaItem]

//------------------------------------------------------------------------------------------------//

// Checking Type

var movieCount = 0
var songCount = 0

for item in library {
    if item is Movie {
        movieCount += 1
    } else if item is Song {
        songCount += 1
    }
}

print("Media library contains \(movieCount) movies and \(songCount) songs")

//------------------------------------------------------------------------------------------------//

// Downcasting

for item in library {
    if let movie = item as? Movie {
        print("Movie:\(movie.name), dir: \(movie.director)")
    } else if let song = item as? Song {
        print("Song:\(song.name), by \(song.artist)")
    }
}

//------------------------------------------------------------------------------------------------//

// Type casting for Any and AnyObject
/*
 1. Any can represent an instance of any type at all, including function types.
 2. AnyObject can represent an instance of any class type.
 */

var things = [Any]()

things.append(0)
things.append(0.0)
things.append(42)
things.append(3.14159)
things.append("hello")
things.append((3.0, 5.0))
things.append(Movie(name: "hu ha", director: "hehe"))
things.append({ (name: String) -> String in "Hello, \(name)" })

for thing in things {
    switch thing {
    case 0 as Int:
        print("Zero as an int")
    case 0 as Double:
        print("Zero as Double")
    case let someInt as Int:
        print("an integer value of \(someInt)")
    case let someDouble as Double where someDouble > 0:
        print("a positive double value of \(someDouble)")
    case is Double:
        print("some other Double value that i don't want to print")
    case let someString as String:
        print("a string value of \(someString)")
    case let (x, y) as (Double, Double):
        print("an (x, y) point at \(x), \(y)")
    case let movie as Movie:
        print("a movie called \(movie.name), dir. \(movie.director)")
    case let stringConverter as (String) -> String:
        print(stringConverter("Himanshu"))
    default:
        print("Something else")
    }
}

let optionalNumber: Int? = 3
//things.append(optionalNumber)
things.append(optionalNumber as Any) // No warning
