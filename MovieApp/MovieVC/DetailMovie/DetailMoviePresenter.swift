// 
//  DetailMoviePresenter.swift
//  MovieApp
//
//  Created by Dian Noery on 31/01/23.
//

import Foundation
import RxSwift

class DetailMoviePresenter {
    
    private let interactor: DetailMovieInteractor
    private let router = DetailMovieRouter()
    
    init(interactor: DetailMovieInteractor) {
        self.interactor = interactor
    }
    
    func getDetailMovie(id: String) -> PublishSubject<DetailMovieModel> {
        interactor.getDetailMovie(id: id)
        return interactor.detail
    }
    
    
}
