//
//  GitHubDetailsVC.swift
//  WasmaCompanyProject
//
//  Created by mac on 2/20/20.
//  Copyright © 2020 iti. All rights reserved.
//

import UIKit

class GitHubDetailsVC: UIViewController {
    
    @IBOutlet weak var repoOwner: UILabel!
    @IBOutlet weak var fullnameLabel: UILabel!
    @IBOutlet weak var repoNameLabel: UILabel!
    
    
    
    var repoowner: String?
    var fullname: String?
    var reponame: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        repoOwner.text = repoowner
        fullnameLabel.text = fullname
        repoNameLabel.text = reponame
        
    }
    
    
    
}
