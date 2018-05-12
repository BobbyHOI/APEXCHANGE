//
//  SignUpController.swift
//  APEXCHANGE
//
//  Created by Bobby Laleye on 22/09/2017.
//  Copyright © 2017 APEXCHANGE. All rights reserved.
//

import UIKit

class SignUpController: UIViewController, UIScrollViewDelegate ,UITextFieldDelegate, UIPickerViewDataSource , UIPickerViewDelegate , CountryPhoneCodePickerDelegate {
    
    lazy var countryPhoneCodePicker: CountryPicker = {
        let pv = CountryPicker()
        return pv
    }()
    
    let scrollView : UIScrollView = {
        let sv = UIScrollView()
        sv.backgroundColor = .white
        sv.isScrollEnabled = true
        sv.bounces = false
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    let contentView : UIView = {
        let cv = UIView()
        cv.backgroundColor = .white
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    lazy var firstnameTextField : APEXCHANGETextField = {
        let tf = APEXCHANGETextField()
        tf.attributedPlaceholder = NSAttributedString(string: "First Name", attributes: [NSForegroundColorAttributeName : UIColor.black])
        tf.delegate = self
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    lazy var lastnameTextField : APEXCHANGETextField = {
        let tf = APEXCHANGETextField()
        tf.attributedPlaceholder = NSAttributedString(string: "Last Name", attributes: [NSForegroundColorAttributeName : UIColor.black])
        tf.delegate = self
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    lazy var dobTextField : APEXCHANGETextField = {
        let tf = APEXCHANGETextField()
        tf.attributedPlaceholder = NSAttributedString(string: "Date Of Birth", attributes: [NSForegroundColorAttributeName : UIColor.black])
        tf.delegate = self
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let dobDatePicker : UIDatePicker = {
        let dp = UIDatePicker()
        dp.timeZone = NSTimeZone.local
        dp.backgroundColor = UIColor.white
        dp.datePickerMode = UIDatePickerMode.date
        return dp
    }()
    
    let dateFormatter = DateFormatter()
    
    lazy var genderTextField : APEXCHANGETextField = {
        let tf = APEXCHANGETextField()
        tf.attributedPlaceholder = NSAttributedString(string: "Gender", attributes: [NSForegroundColorAttributeName : UIColor.black])
        tf.delegate = self
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    lazy var genderPickerView : UIPickerView = {
        let pv = UIPickerView()
        pv.backgroundColor = .white
        pv.tag = 0
        pv.delegate = self
        pv.dataSource = self
        return pv
    }()
    
    lazy var countryTextField : APEXCHANGETextField = {
        let tf = APEXCHANGETextField()
        tf.attributedPlaceholder = NSAttributedString(string: "Country", attributes: [NSForegroundColorAttributeName : UIColor.black])
        tf.delegate = self
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    lazy var countryPickerView : UIPickerView = {
        let pv = UIPickerView()
        pv.backgroundColor = .white
        pv.tag = 1
        pv.delegate = self
        pv.dataSource = self
        return pv
    }()
    
    lazy var phoneNumberTextField : APEXCHANGETextField = {
        let tf = APEXCHANGETextField()
        tf.attributedPlaceholder = NSAttributedString(string: "Phone Number", attributes: [NSForegroundColorAttributeName : UIColor.black])
        tf.keyboardType = .phonePad
        tf.delegate = self
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    lazy var emailAddressTextField : APEXCHANGETextField = {
        let tf = APEXCHANGETextField()
        tf.attributedPlaceholder = NSAttributedString(string: "Email Address", attributes: [NSForegroundColorAttributeName : UIColor.black])
        tf.keyboardType = .emailAddress
        tf.delegate = self
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    lazy var usernameTextField : APEXCHANGETextField = {
        let tf = APEXCHANGETextField()
        tf.attributedPlaceholder = NSAttributedString(string: "Username", attributes: [NSForegroundColorAttributeName : UIColor.black])
        tf.delegate = self
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    lazy var passwordTextField : APEXCHANGETextField = {
        let tf = APEXCHANGETextField()
        tf.isSecureTextEntry = true
        tf.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSForegroundColorAttributeName : UIColor.black])
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.delegate = self
        return tf
    }()
    
    let registerButton : UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .APEXCHANGEGreenD()
        button.setTitle("Register", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont(name: "Lato-SemiBold", size: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    let signInButton : UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .clear
        button.setTitle("Already a member? Sign-In", for: .normal)
        button.setTitleColor(.APEXCHANGEGreenD(), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight : UIFontWeightLight)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var genders = ["Male","Female"]
    var countries = ["USA","ENG","NGN","FRA"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
        setupTargets()
        
        setupTextFieldInputViews()
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(self.adjustForKeyboard), name: Notification.Name.UIKeyboardWillHide, object: nil)
        notificationCenter.addObserver(self, selector: #selector(self.adjustForKeyboard), name: Notification.Name.UIKeyboardWillChangeFrame, object: nil)
        
        let tap : UITapGestureRecognizer = UITapGestureRecognizer(target: self,action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        setupNavBar()
    }
    
    func setupNavBar() {
        // NavigationBar Background Gradient
        
        self.gradientNavBar()
        
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
        navigationItem.title = "New Account"
        navigationController?.navigationBar.backItem?.title = ""
        
    }
    
    func setupTextFieldInputViews(){
        dobTextField.inputView = dobDatePicker
        countryTextField.inputView = countryPhoneCodePicker//countryPickerView
        genderTextField.inputView = genderPickerView
        
        let locale = Locale.current
        let code = (locale as NSLocale).object(forKey: NSLocale.Key.countryCode) as! String
        
        countryPhoneCodePicker.countryPhoneCodeDelegate = self
        countryPhoneCodePicker.setCountry(code)
    }
    
    func dismissKeyboard(){
        self.view.endEditing(true)
    }
    
    func setupViews(){
        
        contentView.addSubview(firstnameTextField)
        contentView.addSubview(lastnameTextField)
        contentView.addSubview(dobTextField)
        contentView.addSubview(genderTextField)
        contentView.addSubview(countryTextField)
        contentView.addSubview(phoneNumberTextField)
        contentView.addSubview(emailAddressTextField)
        contentView.addSubview(usernameTextField)
        contentView.addSubview(passwordTextField)
        contentView.addSubview(registerButton)
        contentView.addSubview(signInButton)
        
        scrollView.addSubview(contentView)
        
        view.addSubview(scrollView)
    }
    
    let textFieldHeight : CGFloat = 45
    
    func setupConstraints(){
        
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        
        firstnameTextField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        firstnameTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40).isActive = true
        firstnameTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40).isActive = true
        firstnameTextField.heightAnchor.constraint(equalToConstant: textFieldHeight).isActive = true
        firstnameTextField.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        lastnameTextField.topAnchor.constraint(equalTo: firstnameTextField.bottomAnchor, constant: 20).isActive = true
        lastnameTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40).isActive = true
        lastnameTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40).isActive = true
        lastnameTextField.heightAnchor.constraint(equalToConstant: textFieldHeight).isActive = true
        lastnameTextField.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        dobTextField.topAnchor.constraint(equalTo: lastnameTextField.bottomAnchor, constant: 20).isActive = true
        dobTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40).isActive = true
        dobTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40).isActive = true
        dobTextField.heightAnchor.constraint(equalToConstant: textFieldHeight).isActive = true
        dobTextField.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        genderTextField.topAnchor.constraint(equalTo: dobTextField.bottomAnchor, constant: 20).isActive = true
        genderTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40).isActive = true
        genderTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40).isActive = true
        genderTextField.heightAnchor.constraint(equalToConstant: textFieldHeight).isActive = true
        genderTextField.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        countryTextField.topAnchor.constraint(equalTo: genderTextField.bottomAnchor, constant: 20).isActive = true
        countryTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40).isActive = true
        countryTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40).isActive = true
        countryTextField.heightAnchor.constraint(equalToConstant: textFieldHeight).isActive = true
        countryTextField.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        phoneNumberTextField.topAnchor.constraint(equalTo: countryTextField.bottomAnchor, constant: 20).isActive = true
        phoneNumberTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40).isActive = true
        phoneNumberTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40).isActive = true
        phoneNumberTextField.heightAnchor.constraint(equalToConstant: textFieldHeight).isActive = true
        phoneNumberTextField.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        emailAddressTextField.topAnchor.constraint(equalTo: phoneNumberTextField.bottomAnchor, constant: 20).isActive = true
        emailAddressTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40).isActive = true
        emailAddressTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40).isActive = true
        emailAddressTextField.heightAnchor.constraint(equalToConstant: textFieldHeight).isActive = true
        emailAddressTextField.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        usernameTextField.topAnchor.constraint(equalTo: emailAddressTextField.bottomAnchor, constant: 20).isActive = true
        usernameTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40).isActive = true
        usernameTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40).isActive = true
        usernameTextField.heightAnchor.constraint(equalToConstant: textFieldHeight).isActive = true
        usernameTextField.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 20).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: textFieldHeight).isActive = true
        passwordTextField.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        registerButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30).isActive = true
        registerButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: textFieldHeight).isActive = true
        registerButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        signInButton.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 25).isActive = true
        signInButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40).isActive = true
        signInButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40).isActive = true
        signInButton.heightAnchor.constraint(equalToConstant: textFieldHeight).isActive = true
        signInButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        signInButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        
        
    }
    
    func setupTargets(){
        
        dobDatePicker.addTarget(self, action: #selector(self.datePickerValueChanged(_:)), for: .valueChanged)
        
        registerButton.addTarget(self, action: #selector(handleRegister), for: .touchUpInside)
        signInButton.addTarget(self, action: #selector(handleSignIn), for: .touchUpInside)
        
    }
    
    func handleRegister(){
        
                if (firstnameTextField.text?.isEmpty)! || (lastnameTextField.text?.isEmpty)! || (dobTextField.text?.isEmpty)! || (genderTextField.text?.isEmpty)! || (countryTextField.text?.isEmpty)! || (phoneNumberTextField.text?.isEmpty)! || (emailAddressTextField.text?.isEmpty)! || (usernameTextField.text?.isEmpty)! || (passwordTextField.text?.isEmpty)! {
        
                    Alert.shared.showAlert()
                    Alert.shared.alertText = "Fields Are Empty"
                    return
                } else if !isValidEmailAddress(emailAddressString: emailAddressTextField.text!){
        
                    Alert.shared.showAlert()
                    Alert.shared.alertText = "Invalid Email Address"
        
                    return
                }
        
                ApiServices.sharedInstance.signUp(fName: firstnameTextField.text!, sName: lastnameTextField.text!, uName: usernameTextField.text!, phNo: phoneNumberTextField.text!, email: emailAddressTextField.text!, uPwd: passwordTextField.text!, dob: dobTextField.text!, completion: { userModel in
            DispatchQueue.main.async {
                let vc = AccountVerificationController()
                vc.userModel = userModel
                self.navigationController?.pushViewController(vc, animated: true)
            }
        })
    }
    
    func handleSignIn(){
        
        let vc = SignInController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func adjustForKeyboard(notification: Notification) {
        let userInfo = notification.userInfo!
        
        let keyboardScreenEndFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)
        
        if notification.name == Notification.Name.UIKeyboardWillHide {
            scrollView.contentInset = UIEdgeInsets.zero
            
        } else {
            scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardViewEndFrame.height + 20, right: 0)
        }
        
        scrollView.scrollIndicatorInsets = scrollView.contentInset
        
    }
    
    func datePickerValueChanged(_ sender: UIDatePicker){
        
        dateFormatter.dateFormat = "dd-MM-yyyy"
        
        // Apply date format
        let selectedDate: String = dateFormatter.string(from: sender.date)
        dobTextField.text = selectedDate
        
        //print("Selected value \(selectedDate) ddmmyyy")
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField == genderTextField {
            pickerViewFirstSelection(pickerView: genderPickerView)
        }
        if textField == countryTextField {
            pickerViewFirstSelection(pickerView: countryPickerView)
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == phoneNumberTextField {
            let characterSet = CharacterSet.decimalDigits
            if string.rangeOfCharacter(from: characterSet.inverted) != nil {
                return false
            }
        }else if textField == countryTextField || textField == genderTextField || textField == usernameTextField || textField == firstnameTextField || textField == lastnameTextField {
            let characterSet = CharacterSet.letters
            if string.rangeOfCharacter(from: characterSet.inverted) != nil {
                return false
            }
        }
        
        return true
    }
    
    func pickerViewFirstSelection(pickerView : UIPickerView){
        pickerView.selectRow(0, inComponent: 0, animated: true)
        self.pickerView(pickerView, didSelectRow: 0, inComponent: 0)
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        
        if pickerView.tag == 0  {
            return genders.count
        }
        else {
            return countries.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView.tag == 0  {
            return genders[row]
        }
        else{
            return countries[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView.tag == 0  {
            self.genderTextField.text = genders[row]
        }
        else {
            self.countryTextField.text = countries[row]
        }
    }
    
    
    func countryPhoneCodePicker(_ picker: CountryPicker, didSelectCountryCountryWithName name: String, countryCode: String, phoneCode: String) {
        countryTextField.text = name + " " + countryCode + " " + phoneCode
    }
    
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
    }
    
}
