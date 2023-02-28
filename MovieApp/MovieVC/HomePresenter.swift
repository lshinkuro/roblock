//
//  HomePresenter.swift
//  MovieApp
//
//  Created by Dian Noery on 30/01/23.
//

import Foundation
import RxSwift

class HomePresenter {
    private let interactor: HomeInteractor
    private let router = HomeRouter()
    
    init(interactor: HomeInteractor) {
        self.interactor = interactor
    }
    
    func navigateDetailMovie(from navigation: UINavigationController, id: String){
        router.navigateDetailMovie(from: navigation, id: id)
    }
    
    func navigateListMovie(from navigation: UINavigationController, id: Int){
        router.navigateListMovie(from: navigation, id: id)
    }
    
    func getMoviePopular(language:String, page:Int) -> PublishSubject<MoviePopular> {
        interactor.getMoviePopular(language: language, page: page)
        return interactor.dataMovie
    }
    
    func getGenre() -> PublishSubject<GenreModel> {
        interactor.getGenre()
        return interactor.dataGenre
    }
}
