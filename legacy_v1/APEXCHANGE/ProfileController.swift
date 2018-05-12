//
//  ProfileController.swift
//  APEXCHANGE
//
//  Created by Bobby Laleye on 01/10/2017.
//  Copyright © 2017 APEXCHANGE. All rights reserved.
//

import UIKit

class ProfileController: UIViewController {
    var userModel: UserModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Profile"
    }
}
