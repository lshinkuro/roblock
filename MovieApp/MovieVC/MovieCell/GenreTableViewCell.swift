//
//  GenreTableViewCell.swift
//  MovieApp
//
//  Created by Dian Noery on 31/01/23.
//

import UIKit

class GenreTableViewCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    
    static let identifier = String(describing: GenreTableViewCell.self)
    static let nib = {
        return UINib(nibName: identifier, bundle: nil)
    }()
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
