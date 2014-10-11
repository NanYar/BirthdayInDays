//
//  ViewController.swift
//  BirthdayInDays
//
//  Created by NanYar on 10.10.14.
//  Copyright (c) 2014 NanYar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var dayTextField: UITextField!
    @IBOutlet weak var monthTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var messageLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    @IBAction func daysButtonPressed(sender: UIButton) {
        
        var dateComponents = NSDateComponents()
        
        dateComponents.day = dayTextField.text.toInt()!
        dateComponents.month = monthTextField.text.toInt()!
        dateComponents.year = yearTextField.text.toInt()!        
        
        var calendar = NSCalendar(identifier: NSGregorianCalendar) // = NSCalender
        var birthDate = calendar.dateFromComponents(dateComponents) // = NSDate?
        var currentDate = NSDate.date() // = NSDate! in UTC
        var durationDateComponents = calendar.components(NSCalendarUnit.CalendarUnitDay, fromDate: birthDate!, toDate: currentDate, options: nil)
        var numberOfDaysAlive = durationDateComponents.day
        
        // Format day string
        var numberFormatter = NSNumberFormatter()
        numberFormatter.usesGroupingSeparator = true
        var numberOfDaysAliveFormatted = numberFormatter.stringFromNumber(numberOfDaysAlive)
        
//        println(birthDate)
//        println(currentDate)
//        println(numberOfDaysAlive)
//        println(numberOfDaysAliveFormatted)
        
        messageLabel.text = "Days alive: \(numberOfDaysAliveFormatted)"
        messageLabel.hidden = false
        dayTextField.text = ""
        monthTextField.text = ""
        yearTextField.text = ""
        dayTextField.resignFirstResponder()
        monthTextField.resignFirstResponder()
        yearTextField.resignFirstResponder()
        
    }
    
}
