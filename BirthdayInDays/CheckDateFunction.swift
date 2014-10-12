//
//  CheckDateFunction.swift
//  BirthdayInDays
//
//  Created by NanYar on 12.10.14.
//  Copyright (c) 2014 NanYar. All rights reserved.
//

//import Foundation

func checkDayMonthInput(day: Int, month: Int) -> Bool
{
    var dateIsValid = false
    
    switch month
        {
    case 1, 3, 5, 7, 8, 10, 12:
        if day > 0 && day < 32
        {
            dateIsValid = true
        }
    case 4, 6, 9, 11:
        if day > 0 && day < 31
        {
            dateIsValid = true
        }
    case 2:
        if day > 0 && day < 30 // Issue: Leap year is not checked!
        {
            dateIsValid = true
        }
    default: break
    }
    
    return dateIsValid
}
