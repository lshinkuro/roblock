// 
//  DetailMovieInteractor.swift
//  MovieApp
//
//  Created by Dian Noery on 31/01/23.
//

import Foundation
import RxSwift

class DetailMovieInteractor: BaseInteractor {
    let detail = PublishSubject<DetailMovieModel>()
    
    func getDetailMovie(id: String) {
        api.getApi(endpoint:.detailMovie(id))
            .subscribe { [weak self] (data: DetailMovieModel) in
                guard self != nil else {return}
                self?.detail.onNext(data)
            } onError: { error in
                guard self != nil else {return}
                self.detail.onError(error)
            }.disposed(by: bag)

    }
}
