//
//  ThirdViewController.swift
//  DataTransferThroughSingleton
//
//  Created by Marni Anuradha on 11/21/19.
//  Copyright © 2019 Marni Anuradha. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var firstNameLbl: UILabel!
    
    @IBOutlet weak var lastNameLbl: UILabel!
    
    @IBOutlet weak var ageLabel: UILabel!
    
    @IBOutlet weak var emailLbl: UILabel!
    
    @IBOutlet weak var mobileNumberLbl: UILabel!
    
    @IBOutlet weak var qualificationLbl: UILabel!
    
    @IBOutlet weak var yearOfPassingLbl: UILabel!
    
    @IBOutlet weak var totalMarksLbl: UILabel!
    
    @IBOutlet weak var percentageLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstNameLbl.text = "First Name   :  \(DataTransfer.data.firstName!)"
        lastNameLbl.text = "Last Name  : \(DataTransfer.data.lastName!)"
        ageLabel.text = "Age  :  \(String(DataTransfer.data.age!))"
        emailLbl.text = "Email  :  \(DataTransfer.data.email!)"
        mobileNumberLbl.text = "Mobile Number  :  \(String(DataTransfer.data.mobileNumber!))"
        qualificationLbl.text = "Qualification  :  \(DataTransfer.data.qualification!)"
        yearOfPassingLbl.text = "Year Of Passing  :  \(String(DataTransfer.data.yearOfPassing!))"
        totalMarksLbl.text = "Total Marks  :  \(String(DataTransfer.data.totalMarks!))"
        percentageLbl.text = "Percentage  :  \(String(DataTransfer.data.percentage!))"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onBackButtonTap(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
