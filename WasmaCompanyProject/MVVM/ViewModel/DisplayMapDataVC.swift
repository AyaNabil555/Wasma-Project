//
//  DisplayMapDataVC.swift
//  WasmaCompanyProject
//
//  Created by mac on 2/22/20.
//  Copyright © 2020 iti. All rights reserved.
//

import UIKit

class DisplayMapDataVC: UIViewController {
   var selectedCity : Place!
    
    var cityname = ""
    var citysubtitle = ""
    

    
    @IBOutlet weak var cityname1: UILabel!
    @IBOutlet weak var citysubtitle1: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
      cityname1.text = cityname
      cityname1.text = Helper.getApiToken(key: "title1")
//     citysubtitle1.text = selectedCity.subtitle
        
    }
    

    

}
