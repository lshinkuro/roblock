// 
//  ListMoviePresenter.swift
//  MovieApp
//
//  Created by Dian Noery on 31/01/23.
//

import Foundation
import RxSwift

class ListMoviePresenter {
    
    private let interactor: ListMovieInteractor
    private let router = ListMovieRouter()
    
    init(interactor: ListMovieInteractor) {
        self.interactor = interactor
    }
    
    func getMovie(language:String, page:Int) -> PublishSubject<MoviePopular> {
        interactor.getMovie(language: language, page: page)
        return interactor.dataMovie
    }
    
}
