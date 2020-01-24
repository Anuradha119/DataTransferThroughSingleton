//
//  ViewController.swift
//  DataTransferThroughSingleton
//
//  Created by Marni Anuradha on 11/20/19.
//  Copyright © 2019 Marni Anuradha. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var firstNameTF: UITextField!
    
    
    @IBOutlet weak var lastNameTF: UITextField!
    
    
    @IBOutlet weak var ageTF: UITextField!
    
    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var mobileNumberTF: UITextField!
    
    var alertController:UIAlertController!
    var alertAction:UIAlertAction!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstNameTF.delegate=self
        lastNameTF.delegate=self
        ageTF.delegate=self
        mobileNumberTF.delegate=self
        emailTF.delegate=self
        
        
        firstNameTF.keyboardType = UIKeyboardType.namePhonePad
        lastNameTF.keyboardType = UIKeyboardType.namePhonePad
        ageTF.keyboardType = UIKeyboardType.numberPad
        mobileNumberTF.keyboardType = UIKeyboardType.phonePad
        emailTF.keyboardType = UIKeyboardType.emailAddress
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func onNextBtnTap(_ sender: UIButton)
    {
        if((firstNameTF.text?.isEmpty)! || (lastNameTF.text?.isEmpty)! || (ageTF.text?.isEmpty)! || (mobileNumberTF.text?.isEmpty)! || (emailTF.text?.isEmpty)!)
        {
            getAlert(titleName: "Warning", messageDetails: "Enter All Details")
        }
        
        DataTransfer.data.firstName = firstNameTF.text!
        DataTransfer.data.lastName = lastNameTF.text!
        DataTransfer.data.age = Int(ageTF.text!)
        DataTransfer.data.email = emailTF.text!
        DataTransfer.data.mobileNumber = Int(mobileNumberTF.text!)
        
        let secondVC = storyboard?.instantiateViewController(withIdentifier: "SecondVC") as! SecondViewController
        
        present(secondVC, animated: true, completion: nil)
    }
    // function for alert
    func getAlert(titleName:String,messageDetails:String){
        
        alertController = UIAlertController(title: titleName, message: messageDetails, preferredStyle: UIAlertController.Style.alert)
        alertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        alertController.addAction(alertAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    // functions for Delegates
    
    var returnValue = true
    
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if(textField == firstNameTF){
            returnValue = true
        }
        if(textField == lastNameTF){
            if(firstNameTF.text!.count >= 2){
                returnValue = true
            }else
            {
                returnValue = false
            }
        }
        if( textField == ageTF){
            if(lastNameTF.text!.count >= 2){
                returnValue = true
            }else
            {
                returnValue = false
            }
        }
        
        if( textField == emailTF){
            if(ageTF.text!.count <= 120){
                returnValue = true
            }else{
                returnValue = false
            }
        }
        if( textField == mobileNumberTF){
            if(emailTF.text!.count >= 9){
                returnValue = true
            }else{
                returnValue = false
            }
        }
        return returnValue
        
    }
    // function for name Validations
    
    func isValidName(nameStr:String) -> Bool {
        let nameRegEx = "[A-Za-z ]{1,20}"
        
        let namePred = NSPredicate(format:"SELF MATCHES %@", nameRegEx)
        return namePred.evaluate(with: nameStr)
    }
    
    // function for age Validations
    func isValidAge(age:String) -> Bool {
        let ageRegEx = "[0-9]{2,3}"
        
        let agePred = NSPredicate(format:"SELF MATCHES %@", ageRegEx)
        return agePred.evaluate(with: age)
    }
    
    
    // function for email Validation
    
    func isValidEmail(emailStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: emailStr)
    }
    // function for number Validation
    
    func isValidNumber(numberStr:String) -> Bool {
        let numberRegEx = "[7-9][0-9]{9}"
        
        let numberPred = NSPredicate(format:"SELF MATCHES %@", numberRegEx)
        return numberPred.evaluate(with: numberStr)
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if(textField == firstNameTF || textField == lastNameTF){
            if(isValidName(nameStr: textField.text!)){
                //                textField.textColor = UIColor.black
            }else
            {
                //                textField.textColor = UIColor.red
                getAlert(titleName: "OK", messageDetails: " Enter Alphabets Only")
            }
            
        }
        if(textField == ageTF){
            if(isValidAge(age: textField.text!)){
                //                textField.textColor = UIColor.black
            }else
            {
                //                textField.textColor = UIColor.red
                getAlert(titleName: "OK", messageDetails: " Enter Valid Age")
            }
        }
        
        if(textField == mobileNumberTF){
            if(isValidNumber(numberStr: textField.text!)){
                //                textField.textColor = UIColor.black
            }else
            {
                //                textField.textColor = UIColor.red
                getAlert(titleName: "OK", messageDetails: " Enter Valid Mobile Number")
            }
        }
        if(textField == emailTF){
            if(isValidEmail(emailStr: textField.text!)){
                //                textField.textColor = UIColor.black
            }else
            {
                //                textField.textColor = UIColor.red
                getAlert(titleName: "OK", messageDetails: " Enter Valid Email id")
            }
        }
        return returnValue
    }
    
}


