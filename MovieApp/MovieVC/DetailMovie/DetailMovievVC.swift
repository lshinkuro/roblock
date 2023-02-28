//
//  DetailMovievVC.swift
//  MovieApp
//
//  Created by Dian Noery on 31/01/23.
//

import UIKit
import RxSwift
import RxCocoa
import Kingfisher

class DetailMovievVC: UIViewController {
    @IBOutlet weak var imageCover: UIImageView!
    @IBOutlet weak var titleMovie: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var avarageView: UIView!
    @IBOutlet weak var avarge: UILabel!
    @IBOutlet weak var originalTitle: UILabel!
    @IBOutlet weak var overview: UILabel!
    
    
    var bag = DisposeBag()
    var presenter: DetailMoviePresenter?
    var idMoview = ""
    var dataResult: DetailMovieModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        presenter?.getDetailMovie(id: idMoview).subscribe(onNext: { [weak self] data in
            guard let self = self else { return }
            self.dataResult = data
            self.setupView()
        }).disposed(by: bag)
        
    }


    func setupView() {
        guard let data = dataResult else { return  }
        let imageUrl = URL(string: Constants.imageURL + data.posterPath)
        let formattedNumber = String(format: "%.2f", data.voteAverage)
        titleMovie.text = data.title
        originalTitle.text = data.originalTitle
        overview.text = data.overview
        avarageView.layer.cornerRadius = 20
        avarge.text = " \(formattedNumber)"
        imageCover.kf.setImage(with: imageUrl)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
