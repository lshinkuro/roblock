//
//  HomeVC.swift
//  MovieApp
//
//  Created by Dian Noery on 30/01/23.
//

import UIKit
import RxSwift
import RxCocoa

class HomeVC: UIViewController {
   
    @IBOutlet weak var genreTabel: UITableView!
    @IBOutlet weak var trandingCollectionView: UICollectionView!
    
    var bag = DisposeBag()
    var presenter: HomePresenter?
    var dataResult: [ResultMovies] = []
    var dataGenre: [Genre] = []
    var genre = false
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.getMoviePopular(language: "en-US", page: 1).subscribe(onNext: { [weak self] data in
            guard let self = self else { return }
            self.dataResult.append(contentsOf: data.results)
            self.trandingCollectionView.reloadData()
        }).disposed(by: bag)
        
        presenter?.getGenre().subscribe(onNext: { [weak self] data in
            guard let self = self else { return }
            self.dataGenre.append(contentsOf: data.genres)
            self.genreTabel.reloadData()
        }).disposed(by: bag)
        setupCell()

    }


    func getMoviewPopular() {
        
    }
    
    func setupCell() {
        trandingCollectionView.register(TrandingCollectionViewCell.nib, forCellWithReuseIdentifier: TrandingCollectionViewCell.identifier)
        trandingCollectionView.delegate = self
        trandingCollectionView.dataSource = self
        
        genreTabel.register(GenreTableViewCell.nib, forCellReuseIdentifier: GenreTableViewCell.identifier)
        genreTabel.delegate = self
        genreTabel.dataSource  = self
        genreTabel.separatorStyle = UITableViewCell.SeparatorStyle.none

    }
    
    func navigate(id : Int)  {
        if genre {
            presenter?.navigateListMovie(from: self.navigationController!, id: id)
        } else {
            presenter?.navigateDetailMovie(from: self.navigationController!, id: "\(id)")
        }
    }
   

}

extension HomeVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataGenre.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = dataGenre[indexPath.item]
        guard let cell = genreTabel.dequeueReusableCell(
            withIdentifier: String(describing: GenreTableViewCell.self),
            for: indexPath) as? GenreTableViewCell
        else { return UITableViewCell() }
        
        cell.title.text = "\(data.name)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = dataGenre[indexPath.item]
        genre = true
        navigate(id: data.id)
    }
    
}

extension HomeVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataResult.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let data = dataResult[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TrandingCollectionViewCell.identifier, for: indexPath) as? TrandingCollectionViewCell
        cell?.setupData(data: data)
      
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let data = dataResult[indexPath.item]
        genre = false
        navigate(id: data.id)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 25, left: 15, bottom: 0, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
   
    
    
    
    
}
