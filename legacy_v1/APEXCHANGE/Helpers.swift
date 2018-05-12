//
//  Helpers.swift
//  APEXCHANGE
//
//  Created by Bobby Laleye on 25/11/2017.
//  Copyright © 2017 APEXCHANGE. All rights reserved.
//

import UIKit

extension UIColor {
    
    static func apexchangeGreenL() -> UIColor {
        return UIColor(red: 25/255, green: 181/255, blue: 132/255, alpha: 1)
    }
    
    static func apexchangeGreenM() -> UIColor {
        return UIColor(red: 3/255, green: 153/255, blue: 114/255, alpha: 1)
    }
    
    static func apexchangeGreenD() -> UIColor {
        return UIColor(red: 0/255, green: 112/255, blue: 82/255, alpha: 1)
    }
    
    static func apexchangeBlue() -> UIColor {
        return UIColor(red: 45/255, green: 104/255, blue: 201/255, alpha: 1)
    }
}

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {}
    func setupConstraints() {}
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class APEXCHANGETextField: UITextField {
    
    let textFieldSeparator : UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews(){
        addSubview(textFieldSeparator)
        textFieldSeparator.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        textFieldSeparator.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        textFieldSeparator.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        textFieldSeparator.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class APEXCHANGEBottomButton : UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews(){
        backgroundColor = .apexchangeGreenD()
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UINavigationBar {
    func setGradientBackground(topColor: UIColor, bottomColor: UIColor) {
        let gradientLayer = CAGradientLayer()
        var updatedFrame = self.bounds
        updatedFrame.size.height += 20
        gradientLayer.frame = updatedFrame
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.setBackgroundImage(image, for: .default)
    }
}
