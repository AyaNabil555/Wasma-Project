//
//  Helper.swift
//  WasmaCompanyProject
//
//  Created by mac on 2/20/20.
//  Copyright © 2020 iti. All rights reserved.
//


import Foundation
class Helper: NSObject{
    class func saveApiToken(value: String ,key: String){
        
        
        //save data to userdefaults
        let def = UserDefaults.standard
        def.setValue(value, forKey: key)
        def.synchronize()
    }
    
    
    
    //return api token
    
    class func getApiToken(key : String) -> String?{
        
        let def = UserDefaults.standard
        return def.object(forKey: key) as? String
        
    }
}
