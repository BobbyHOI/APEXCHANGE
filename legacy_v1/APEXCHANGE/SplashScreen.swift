//
//  SplashScreen.swift
//  APEXCHANGE
//
//  Created by Bobby Laleye on 08/10/2017.
//  Copyright © 2017 APEXCHANGE. All rights reserved.
//

import UIKit

class SplashScreen: UIViewController {
    
    let logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "Logo")
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { _ in
            let layout = UICollectionViewFlowLayout()
            let home = DealsController(collectionViewLayout: layout)
            self.navigationController?.pushViewController(home, animated: true)
        }
    }
    
    func setupViews() {
        view.backgroundColor = .apexchangeGreenL()
        view.addSubview(logoImageView)
        
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 150),
            logoImageView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
}
