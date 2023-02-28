//
//  TrandingCollectionViewCell.swift
//  MovieApp
//
//  Created by Dian Noery on 30/01/23.
//

import UIKit
import Kingfisher

class TrandingCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var coverImg: UIImageView!
    
    static let identifier = String(describing: TrandingCollectionViewCell.self)
    static let nib = {
        return UINib(nibName: identifier, bundle: nil)
    }()
    var date = Date()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

extension TrandingCollectionViewCell {
    func setupData(data: ResultMovies) {
        let dateString = data.releaseDate
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateformat = dateFormatter.date(from: dateString)

        dateFormatter.dateFormat = "MMM dd, yyyy"
        let formattedDate = dateFormatter.string(from: dateformat ?? date)
        let imageUrl = URL(string: Constants.imageURL + data.posterPath)
        
        coverImg.kf.setImage(with: imageUrl)
    }
}
