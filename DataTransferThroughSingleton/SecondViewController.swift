//
//  SecondViewController.swift
//  DataTransferThroughSingleton
//
//  Created by Marni Anuradha on 11/21/19.
//  Copyright © 2019 Marni Anuradha. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var qualificationTF: UITextField!
    
    @IBOutlet weak var yearOfPassingTF: UITextField!
    
    @IBOutlet weak var totalMarksTF: UITextField!
    
    @IBOutlet weak var percentageTF: UITextField!
    
    var alertController:UIAlertController!
    var alertAction:UIAlertAction!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        qualificationTF.delegate = self
        yearOfPassingTF.delegate = self
        totalMarksTF.delegate = self
        percentageTF.delegate = self
        
        qualificationTF.keyboardType = UIKeyboardType.namePhonePad
        yearOfPassingTF.keyboardType = UIKeyboardType.namePhonePad
        totalMarksTF.keyboardType = UIKeyboardType.numberPad
        percentageTF.keyboardType = UIKeyboardType.numberPad
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSubmitBtnTap(_ sender: UIButton){
    if((qualificationTF.text?.isEmpty)! || (yearOfPassingTF.text?.isEmpty)! || (totalMarksTF.text?.isEmpty)! || (percentageTF.text?.isEmpty)!)
    {
    getAlert(titleName: "Warning", messageDetails: "Enter All Details")
    }
    else
    {
        DataTransfer.data.qualification = qualificationTF.text!
        DataTransfer.data.yearOfPassing = Int(yearOfPassingTF.text!)
        DataTransfer.data.totalMarks = Int(totalMarksTF.text!)
        DataTransfer.data.percentage = Float(percentageTF.text!)
        
        let thirdVC = storyboard?.instantiateViewController(withIdentifier: "ThirdVC") as! ThirdViewController
        
        present(thirdVC, animated: true, completion: nil)
    }
    }
    
    @IBAction func onBackBtnTap(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    // function for alert
    func getAlert(titleName:String,messageDetails:String){
        
        alertController = UIAlertController(title: titleName, message: messageDetails, preferredStyle: UIAlertController.Style.alert)
        alertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        alertController.addAction(alertAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    // function for nae Validations
    
    func isValidName(nameStr:String) -> Bool {
        let nameRegEx = "[A-Za-z ]{1,20}"
        
        let namePred = NSPredicate(format:"SELF MATCHES %@", nameRegEx)
        return namePred.evaluate(with: nameStr)
    }
    
    // function for age Validations
    func isValidNumbers(numbers:String) -> Bool {
        let ageRegEx = "[0-9]{2,4}"
        
        let agePred = NSPredicate(format:"SELF MATCHES %@", ageRegEx)
        return agePred.evaluate(with: numbers)
    }
    
    
    var returnValue = true
    
    
    
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if(textField == qualificationTF){
            if(isValidName(nameStr: textField.text!)){
                //                textField.textColor = UIColor.black
            }else
            {
                //                textField.textColor = UIColor.red
                getAlert(titleName: "OK", messageDetails: " Enter Alphabets Only")
            }
            
        }
        if(textField == yearOfPassingTF){
            if(isValidNumbers(numbers: textField.text!)){
                //                textField.textColor = UIColor.black
            }else
            {
                //                textField.textColor = UIColor.red
                getAlert(titleName: "OK", messageDetails: " Enter Valid Passed Out Year")
            }
        }
        
        if(textField == totalMarksTF){
            if(isValidNumbers(numbers: textField.text!)){
                //                textField.textColor = UIColor.black
            }else
            {
                //                textField.textColor = UIColor.red
                getAlert(titleName: "OK", messageDetails: " Enter Valid Mobile Number")
            }
        }
        if(textField == percentageTF){
            if(isValidNumbers(numbers: textField.text!)){
                //                textField.textColor = UIColor.black
            }else
            {
                //                textField.textColor = UIColor.red
                getAlert(titleName: "OK", messageDetails: " Enter Valid Email id")
            }
        }
        return returnValue
    }
    
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if(textField == qualificationTF){
            returnValue = true
        }
        if(textField == yearOfPassingTF){
            if(qualificationTF.text!.count >= 2){
                returnValue = true
            }else
            {
                returnValue = false
            }
        }
        if( textField == totalMarksTF){
            if(yearOfPassingTF.text!.count >= 2){
                returnValue = true
            }else
            {
                returnValue = false
            }
        }
        
        if( textField == percentageTF){
            if(totalMarksTF.text!.count <= 5000){
                returnValue = true
            }else{
                returnValue = false
            }
        }
        
        return returnValue
        
    }
    
}

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


