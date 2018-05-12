//
//  ApiServices.swift
//  APEXCHANGE
//
//  Created by Bobby Laleye on 08/10/2017.
//  Copyright © 2017 APEXCHANGE. All rights reserved.
//

import UIKit
import ObjectMapper

class ApiServices: NSObject {
    
    static let sharedInstance = ApiServices()
    let baseUrl = "https://api.apexchange.com/v1/"
    
    func fetchLoginDetails(id: String, password: String, completion: @escaping (UserModel) -> ()) {
        // Logic for login
    }
    
    func fetchAllDeals(subId: String, sTkn: String, completion: @escaping ([DealCellDetails]) -> ()) {
        // Logic for fetching deals
    }
    
    func fetchMyDeals(uId: String, completion: @escaping ([DealCellDetails]) -> ()) {
        // Logic for fetching user deals
    }
    
    func fetchExRate(subId: String, sTkn: String, fCur: String, tCur: String, completion: @escaping (Double) -> ()) {
        completion(365.0)
    }
    
    func startDeal(fCur: String, tCur: String, dAmt: Int, dRate: Double, sRate: Double, exp: String, subId: String, sTkn: String, completion: @escaping (DealCellDetails) -> ()) {
        // Logic for starting a deal
    }
    
    func fetchCurrencies(sTkn: String, completion: @escaping ([String]) -> ()) {
        completion(["USD", "NGN", "GBP", "EUR", "CAD"])
    }
}
