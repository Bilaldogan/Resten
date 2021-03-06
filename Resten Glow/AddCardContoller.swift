//
//  AddCardContoller.swift
//  Resten Glow
//
//  Created by bilal on 25/11/2017.
//  Copyright © 2017 bilal. All rights reserved.
//

import UIKit
import Stripe
import CreditCardForm

class AddCardContoller: BaseController {
    
    @IBOutlet weak var customNavigation: CustomNavigationView!
    @IBOutlet weak var creditCardForm: CreditCardFormView!
    let paymentTextField = STPPaymentCardTextField()
    @IBOutlet weak var nameStackView: UIStackView!
    @IBOutlet weak var nameTextField: TextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCardView()
        addTextFieldImage()
        customNavigation.navDelegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        nameTextField.setBottomBorder()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    @IBAction func nameTextFieldChanged(_ sender: CustomTextField) {
        if let text = sender.text {
            creditCardForm.cardHolderString = text
        }
    }
   
    @IBAction func addCardButtonTapped(_ sender: UIButton) {
        self.back()
    }
    
    func addTextFieldImage(){
       nameTextField.leftViewMode = UITextFieldViewMode.always
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 57, height: 20))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "user")
        imageView.image = image
        nameTextField.leftView = imageView
    }

}
extension AddCardContoller : STPPaymentCardTextFieldDelegate {
    func configureCardView() {
        paymentTextField.delegate = self
       // creditCardForm.cardHolderPlaceholderString = "Adı Soyadı"
       // creditCardForm.expireDatePlaceholderText = "VALID THRU"
        paymentTextField.frame = CGRect(x: 15, y: 250, width: self.view.frame.size.width - 30, height: 44)
        paymentTextField.translatesAutoresizingMaskIntoConstraints = false
        paymentTextField.borderWidth = 0
        
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.darkGray.cgColor
        border.frame = CGRect(x: 0, y: paymentTextField.frame.size.height - width, width:  paymentTextField.frame.size.width, height: paymentTextField.frame.size.height)
        border.borderWidth = width
        paymentTextField.layer.addSublayer(border)
        paymentTextField.layer.masksToBounds = true
        
        view.addSubview(paymentTextField)
        
        NSLayoutConstraint.activate([
            paymentTextField.topAnchor.constraint(equalTo: nameStackView.bottomAnchor, constant: 20),
            paymentTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            paymentTextField.widthAnchor.constraint(equalToConstant: self.creditCardForm.frame.size.width),
            paymentTextField.heightAnchor.constraint(equalToConstant: 44)
            ])
    }

    func paymentCardTextFieldDidChange(_ textField: STPPaymentCardTextField) {
        creditCardForm.paymentCardTextFieldDidChange(cardNumber: textField.cardNumber, expirationYear: textField.expirationYear, expirationMonth: textField.expirationMonth, cvc: textField.cvc)
    }
    
    func paymentCardTextFieldDidEndEditingExpiration(_ textField: STPPaymentCardTextField) {
        creditCardForm.paymentCardTextFieldDidEndEditingExpiration(expirationYear: textField.expirationYear)
    }
    
    func paymentCardTextFieldDidBeginEditingCVC(_ textField: STPPaymentCardTextField) {
        creditCardForm.paymentCardTextFieldDidBeginEditingCVC()
    }
    
    func paymentCardTextFieldDidEndEditingCVC(_ textField: STPPaymentCardTextField) {
        creditCardForm.paymentCardTextFieldDidEndEditingCVC()
    }
}
extension AddCardContoller : CustomNavigationViewDelegate {
    internal func backButtonTapped() {
        self.back()
    }
}



