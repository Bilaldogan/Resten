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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCardView()
    }
    @IBAction func nameTextFieldChanged(_ sender: CustomTextField) {
        if let text = sender.text {
            creditCardForm.cardHolderString = text
        }
    }
   
    @IBAction func addCardButtonTapped(_ sender: UIButton) {
        self.back()
    }
    

}
extension AddCardContoller : STPPaymentCardTextFieldDelegate {
    func configureCardView() {
        paymentTextField.delegate = self
        creditCardForm.cardHolderPlaceholderString = "Adı Soyadı"
        creditCardForm.expireDatePlaceholderText = "VALID THRU"
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
            paymentTextField.topAnchor.constraint(equalTo: nameStackView.bottomAnchor, constant: 10),
            paymentTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            paymentTextField.widthAnchor.constraint(equalToConstant: self.view.frame.size.width-20),
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
