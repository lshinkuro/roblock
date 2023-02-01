// 
//  ListMoviePresenter.swift
//  MovieApp
//
//  Created by Dian Noery on 31/01/23.
//

import Foundation

class ListMoviePresenter {
    
    private let interactor: ListMovieInteractor
    private let router = ListMovieRouter()
    
    init(interactor: ListMovieInteractor) {
        self.interactor = interactor
    }
    
}
