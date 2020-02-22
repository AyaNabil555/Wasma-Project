//
//  GitHubTableViewCell.swift
//  WasmaCompanyProject
//
//  Created by mac on 2/20/20.
//  Copyright © 2020 iti. All rights reserved.
//

import UIKit

class GitHubTableViewCell: UITableViewCell {
   @IBOutlet weak var repodata: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
