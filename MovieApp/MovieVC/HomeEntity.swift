//
//  HomeEntity.swift
//  MovieApp
//
//  Created by Dian Noery on 30/01/23.
//

import Foundation

struct MoviePopular: Codable {
    var page: Int
    var results: [ResultMovies]
    var totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page
        case results = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct ResultMovies: Codable {
    var adult: Bool
    var backdropPath: String
    var genreIDS: [Int]
    var id: Int
    var originalLanguage, originalTitle, overview: String
    var popularity: Double
    var posterPath, releaseDate, title: String
    var video: Bool
    var voteAverage: Double
    var voteCount: Int

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

struct GenreModel: Codable {
    var genres: [Genre]
}

// MARK: - Genre
struct Genre: Codable {
    var id: Int
    var name: String
}
