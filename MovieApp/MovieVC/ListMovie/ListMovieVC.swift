//
//  ListMovieVC.swift
//  MovieApp
//
//  Created by Dian Noery on 31/01/23.
//

import UIKit
import RxSwift
import Kingfisher
import RxCocoa

class ListMovieVC: UIViewController {
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var search: UITextField!
    
    let bag = DisposeBag()
    var presenter: ListMoviePresenter?
    var dataResult: [ResultMovies] = []
    var dataSearch: [ResultMovies] = []
    var page = 2
    var idGenre = 0
    var isLoading = false
    var isSearch = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCell()
        loadMoreData()
        searchView.layer.cornerRadius = 20
        searchView.layer.borderWidth = 1
        searchView.layer.borderColor = UIColor.black.cgColor
        
//        search.rx.text.o
//                   .subscribe(onNext: { [weak self] query in
//                       self?.search(with: query ?? "")
//                   })
//                   .disposed(by: bag)
        search.rx.text.orEmpty
            .subscribe(onNext: { [weak self] query in
                self?.search(with: query )
            })
            .disposed(by: bag)
    }
    
    func registerCell() {
        table.register(ListMovieCell.nib, forCellReuseIdentifier: ListMovieCell.identifier)
        table.delegate = self
        table.dataSource  = self
        table.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
    
    func search(with query: String) {
        // Perform the search and update the data source
        print("data ", query)
       
        
        if !query.isEmpty {
            isSearch = true
            let nonSpaceNumber = query.trimmingCharacters(in: .whitespaces)
            let modelFiltered = dataResult.filter {
                return $0.title.range(of: query, options: .caseInsensitive) != nil || $0.originalTitle.range(of: nonSpaceNumber, options: .caseInsensitive) != nil
            }
            dataSearch = modelFiltered
            table.reloadData()
        } else {
            isSearch = false
            table.reloadData()
        }
            
       
        
    }
    
 
    
    func loadMoreData() {
            guard !isLoading else { return }
            isLoading = true
        self.presenter?.getMovie(language: "en-US", page: page).subscribe(onNext: { [weak self] data in
            guard let self = self else { return }
            self.dataResult.append(contentsOf: data.results)
            self.page += 1
            self.isLoading = false
            self.table.reloadData()
        }).disposed(by: bag)

        }

}

extension ListMovieVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearch {
            return dataSearch.count
        } else {
            return dataResult.count
        }
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = dataResult[indexPath.item]
        guard let cell = table.dequeueReusableCell(
            withIdentifier: String(describing: ListMovieCell.self),
            for: indexPath) as? ListMovieCell
        else { return UITableViewCell() }
        
        let imageUrl = URL(string: Constants.imageURL + data.posterPath)
        cell.title.text = data.title
        cell.date.text = data.releaseDate
        cell.posterImg.kf.setImage(with: imageUrl)
        if indexPath.row == dataResult.count - 1 {
            loadMoreData()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 144
    }
    
}
