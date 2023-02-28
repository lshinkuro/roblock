//
//  ApiManager.swift
//  MovieApp
//
//  Created by Dian Noery on 30/01/23.
//

import Foundation
import RxSwift
import RxAlamofire
import Alamofire

enum ErrorHandler: Error {
    case invalidLink
    case failedParsing
    case unknownError
}

class ApiManage {
    func getApi<T: Codable>(endpoint: Endpoint) -> Observable<T> {
        
        print("ini parameter ", endpoint.parameters)
        print("ini url ", endpoint.urlString())
        print("ini header ", endpoint.headers)
        
        return Observable.create { observer in
            request(
                endpoint.method(),
                endpoint.urlString(),
                parameters: endpoint.parameters,
                headers: endpoint.headers,
                interceptor: nil
            ).flatMap {
                $0.rx.data()
               
            }
            .observe(on: MainScheduler.instance)
            .decode(type: T.self, decoder: JSONDecoder())
            .subscribe{ data in
                observer.onNext(data)
                observer.onCompleted()
            } onError: { error in
                print(error.localizedDescription)
                print("ini eror", error)
                observer.onError(ErrorHandler.failedParsing)
            }
        }
    }
}
