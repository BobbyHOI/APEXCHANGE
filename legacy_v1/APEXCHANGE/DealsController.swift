//
//  DealsController.swift
//  APEXCHANGE
//
//  Created by Bobby Laleye on 25/09/2017.
//  Copyright © 2017 APEXCHANGE. All rights reserved.
//

import UIKit

class DealsController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var userModel: UserModel?
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupCollectionView()
    }
    
    func setupNavBar() {
        navigationItem.title = "APEXCHANGE"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let menuButton = UIBarButtonItem(image: UIImage(named: "menu"), style: .plain, target: self, action: #selector(handleMenu))
        navigationItem.leftBarButtonItem = menuButton
    }
    
    func setupCollectionView() {
        collectionView?.backgroundColor = .white
        collectionView?.register(AllDealsCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    @objc func handleMenu() {
        // Menu logic
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AllDealsCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
}
