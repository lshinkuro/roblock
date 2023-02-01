// 
//  ListMovieRouter.swift
//  MovieApp
//
//  Created by Dian Noery on 31/01/23.
//

import UIKit

class ListMovieRouter {
    
    func showView() -> ListMovieView {
        let interactor = ListMovieInteractor()
        let presenter = ListMoviePresenter(interactor: interactor)
        let view = ListMovieView(nibName: String(describing: ListMovieView.self), bundle: nil)
        view.presenter = presenter
        return view
    }
    
    //Navigate to other xib-based router
    /*
    func navigateToOtherView(from navigation: UINavigationController, with data: Any) {
        let otherView = OtherViewRouter().showView(with: data)
        navigation.pushViewController(otherView, animated: true)
    }
    */
    
    //Navigate to other storyboard-based router
    /*
    func navigateToOtherView(from navigation: UINavigationController, with data: Any) {
        let otherView = OtherViewRouter().showView(with: data)
        navigation.pushViewController(otherView, animated: true)
    }
     */
    
}
