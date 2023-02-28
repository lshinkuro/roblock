// 
//  ListMovieInteractor.swift
//  MovieApp
//
//  Created by Dian Noery on 31/01/23.
//

import Foundation
import RxSwift

class ListMovieInteractor: BaseInteractor {
    let dataMovie = PublishSubject<MoviePopular>()
    
    func getMovie(language:String, page:Int){
        api.getApi(endpoint: .getMoviePopular(language, page))
            .subscribe { [weak self] (data: MoviePopular) in
                guard self != nil else { return }
                self?.dataMovie.onNext(data)
            } onError: { [weak self] error in
                guard self != nil else { return }
                self?.dataMovie.onError(error)
            }.disposed(by: bag)
    }
}
