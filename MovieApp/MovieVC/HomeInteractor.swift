//
//  HomeInteractor.swift
//  MovieApp
//
//  Created by Dian Noery on 30/01/23.
//

import Foundation
import RxSwift

class HomeInteractor: BaseInteractor {
    let dataMovie = PublishSubject<MoviePopular>()
    let dataGenre = PublishSubject<GenreModel>()
    
    func getMoviePopular(language:String, page:Int){
        api.getApi(endpoint: .getMoviePopular(language, page))
            .subscribe { [weak self] (data: MoviePopular) in
                guard self != nil else { return }
                self?.dataMovie.onNext(data)
            } onError: { [weak self] error in
                guard self != nil else { return }
                self?.dataMovie.onError(error)
            }.disposed(by: bag)
    }
    
    func getGenre() {
        api.getApi(endpoint: .getGenre)
            .subscribe { [weak self] (data: GenreModel) in
                guard self != nil else { return }
                self?.dataGenre.onNext(data)
                
            } onError: { [weak self] error in
                guard self != nil else { return }
                self?.dataGenre.onError(error)
            }.disposed(by: bag)
    }
    
    
}
