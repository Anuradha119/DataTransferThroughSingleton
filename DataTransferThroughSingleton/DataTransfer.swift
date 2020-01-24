//
//  DataTransfer.swift
//  DataTransferThroughSingleton
//
//  Created by Marni Anuradha on 11/21/19.
//  Copyright © 2019 Marni Anuradha. All rights reserved.
//

import UIKit

class DataTransfer: NSObject {
static var data:DataTransfer=DataTransfer()
    
    var firstName:String!
    var lastName:String!
    var age:Int!
    var email:String!
    var mobileNumber:Int!
    var qualification:String!
    var yearOfPassing:Int!
    var totalMarks:Int!
    var percentage:Float!
    
}
