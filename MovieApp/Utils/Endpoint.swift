//
//  Endpoint.swift
//  MovieApp
//
//  Created by Dian Noery on 30/01/23.
//

import Foundation
import Alamofire
import RxAlamofire
import RxSwift

enum Endpoint {
case getMoviePopular(String, Int)
    case getGenre
    case detailMovie(String)
    
    func path() -> String {
        switch self {
        case .getMoviePopular:
            return "/movie/popular"
        case .getGenre:
            return "/genre/movie/list"
        case .detailMovie(let id):
            return "/movie/\(id)"
        }
    }
    // MARK: - HTTPMethod
    func method() -> HTTPMethod {
        switch self {
        case .getMoviePopular:
            return.post
        default:
            return .get
        }
    }
    // MARK: - Parameters
    var parameters: [String: Any]? {
        switch self {
        case .getMoviePopular(let language, let page):
            let params: [String: Any] = [
                "api_key": Constants.apiKey,
                "language": language,
                "page": page
            ]
            return params
        case .getGenre:
            let params: [String: Any] = [:]
            return params
        case .detailMovie:
            let params: [String: Any] = [
                "api_key": Constants.apiKey,
            ]
            return params
        }
    }
    
    // MARK: - Headers
    var headers: HTTPHeaders {
        switch self {
        case .getMoviePopular:
            let params: HTTPHeaders = [
                "Authorization": "Bearer \(Constants.token )",
                "Content-Type": "application/json"
            ]
            return params
        case .getGenre:
            let params: HTTPHeaders = [
                "Authorization": "Bearer \(Constants.token )",
                "Content-Type": "application/json"
            ]
            return params
        case .detailMovie:
            let params: HTTPHeaders = [
                "Authorization": "Bearer \(Constants.token )",
                "Content-Type": "application/json"
            ]
            return params
        }
        
    }
    
    func urlString() -> String {
        return Constants.baseURL + path()
    }
}
