//
//  UserModel.swift
//  APEXCHANGE
//
//  Created by Bobby Laleye on 31/10/2017.
//  Copyright © 2017 APEXCHANGE. All rights reserved.
//

import UIKit

class UserModel : NSObject, NSCoding  {
    
    var fName : String?
    var lName : String?
    var token : String?
    var rCode : Int?
    var locInt : Int?
    var subId : Int?
    var rMsg : String?
    
    init(fName : String, lName : String, token : String, rCode : Int, locInt : Int, subId : Int, rMsg : String?) {
        self.fName = fName
        self.lName = lName
        self.token = token
        self.rCode = rCode
        self.locInt = locInt
        self.subId = subId
        self.rMsg = rMsg
    }
    
    convenience override init() {
        self.init(fName : "", lName : "", token : "", rCode : 0, locInt : 0, subId : 0, rMsg : "")
    }
    
    override func setValue(_ value: Any?, forKey key: String) {
        if (key == "locInt") {
            self.locInt = value as? Int
        }
        else if (key == "rCode") {
            self.rCode = value as? Int
        }
        else if (key == "subId") {
            self.subId = value as? Int
        }
        else {
            super.setValue(value, forKey: key)
        }
    }
    
    required init(coder decoder: NSCoder) {
        super.init()
        
        self.fName = decoder.decodeObject(forKey: "fName") as! String?
         self.lName = decoder.decodeObject(forKey: "lName") as! String?
         self.token = decoder.decodeObject(forKey: "token") as! String?
         self.rCode = decoder.decodeObject(forKey: "rCode") as! Int?
         self.locInt = decoder.decodeObject(forKey: "locInt") as! Int?
        self.subId = decoder.decodeObject(forKey: "subId") as! Int?
        self.rMsg = decoder.decodeObject(forKey: "rMsg") as! String?
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(fName, forKey: "fName")
        coder.encode(lName, forKey: "lName")
        coder.encode(token, forKey: "token")
        coder.encode(rCode, forKey: "rCode")
        coder.encode(locInt, forKey: "locInt")
        coder.encode(subId, forKey: "subId")
        coder.encode(rMsg, forKey: "rMsg")
    }
}


