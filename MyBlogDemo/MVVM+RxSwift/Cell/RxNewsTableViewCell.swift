//
//  RxNewsTableViewCell.swift
//  MyBlogDemo
//
//  Created by Tianchi Wang on 2019/4/16.
//  Copyright © 2019 Tianchi Wang. All rights reserved.
//

import UIKit
import Kingfisher

class RxNewsTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with vm:NewsViewModel) {
        thumbnail.kf.setImage(with: URL(string: vm.urlToImage))
        newsTitle.text = vm.title
        contentLabel.text = vm.description
    }
}
