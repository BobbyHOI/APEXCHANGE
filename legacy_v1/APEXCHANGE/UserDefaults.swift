//
//  UserDefaults.swift
//  APEXCHANGE
//
//  Created by Bobby Laleye on 14/12/2017.
//  Copyright © 2017 APEXCHANGE. All rights reserved.
//

import Foundation

enum UserDefaultsKeys : String {
    case isNewUser
    case isLoggedIn
    case userDetails
    case dealsControllerPageRetainer
}

extension UserDefaults {
    
    func setIsLoggedIn(value : Bool) {
        set(value, forKey: UserDefaultsKeys.isLoggedIn.rawValue)
        synchronize()
    }
    
    func isLoggedIn() -> Bool {
        return bool(forKey: UserDefaultsKeys.isLoggedIn.rawValue)
    }
    
    func setIsNewUser(value : Bool) {
        set(value, forKey: UserDefaultsKeys.isNewUser.rawValue)
        synchronize()
    }
    
    func isNewUser() -> Bool {
        return bool(forKey: UserDefaultsKeys.isNewUser.rawValue)
    }
    
    func setUserDetails(value : UserModel) {
        let encodedData = NSKeyedArchiver.archivedData(withRootObject: value)
        set(encodedData, forKey: UserDefaultsKeys.userDetails.rawValue)
        synchronize()
    }
    
    func getUserDetails() -> UserModel {
        var decodedDetails = UserModel()
        
        if let decoded = UserDefaults.standard.object(forKey: UserDefaultsKeys.userDetails.rawValue) {
            decodedDetails = NSKeyedUnarchiver.unarchiveObject(with: decoded as! Data) as! UserModel
            return decodedDetails
        }
        
        return decodedDetails
    }
    
    func setDealsControllerRetainer(value : Int) {
        set(value, forKey: UserDefaultsKeys.dealsControllerPageRetainer.rawValue)
        synchronize()
    }
    
    func getDealsControllerRetainer() -> Int {
        return integer(forKey: UserDefaultsKeys.dealsControllerPageRetainer.rawValue)
    }
}
