//
//  ListMovieCell.swift
//  MovieApp
//
//  Created by Dian Noery on 31/01/23.
//

import UIKit

class ListMovieCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var date: UILabel!
    
    static let identifier = String(describing: ListMovieCell.self)
    static let nib = {
        return UINib(nibName: identifier, bundle: nil)
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var posterImg: UIImageView!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension ListMovieCell {
    func setupData() {
        
    }
}
