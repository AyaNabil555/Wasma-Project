//
//  GitHubData.swift
//  WasmaCompanyProject
//
//  Created by mac on 2/20/20.
//  Copyright © 2020 iti. All rights reserved.
//


import Foundation
struct GitHubData : Codable {
    var id : Int?
    var node_id : String?
    var name: String?
    var full_name: String?
    var owner: Owner
    var description: String?
    var html_url: String?
//    var private: Bool?
}

struct Owner : Codable{
    var login: String?
    var avatar_url : String?
//    var html_url: String?
}

