//
//  ViewController.swift
//  BirthdayInDays
//
//  Created by NanYar on 10.10.14.
//  Copyright (c) 2014 NanYar. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var dayTextField: UITextField!
    @IBOutlet weak var monthTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var resultMessageLabel: UILabel!
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }


    @IBAction func daysButtonPressed(sender: UIButton)
    {
        let dateComponents = NSDateComponents()
        let optionalDayInt = dayTextField.text.toInt()
        let optionalMonthInt = monthTextField.text.toInt()
        let optionalYearInt = yearTextField.text.toInt()
        
        
        // Check before unwrap
        if optionalDayInt != nil && optionalMonthInt != nil && optionalYearInt != nil
        {
            dateComponents.day = optionalDayInt!
            dateComponents.month = optionalMonthInt!
            dateComponents.year = optionalYearInt!
            
            // Check valid date
            if checkDayMonthInput(dateComponents.day, dateComponents.month)
            {
                let calendar = NSCalendar(identifier: NSGregorianCalendar) // = NSCalender
                let birthDate = calendar.dateFromComponents(dateComponents) // = NSDate?
                let currentDate = NSDate.date() // = NSDate! in UTC
                let durationDateComponents = calendar.components(NSCalendarUnit.CalendarUnitDay, fromDate: birthDate!, toDate: currentDate, options: nil)
                let numberOfDaysAlive = durationDateComponents.day
                
                // Check date is in the past
                if numberOfDaysAlive >= 0
                {
                    // Format day string
                    let numberFormatter = NSNumberFormatter()
                    numberFormatter.usesGroupingSeparator = true
                    let numberOfDaysAliveFormatted = numberFormatter.stringFromNumber(numberOfDaysAlive)
                    
                    resultMessageLabel.text = "Days alive: \(numberOfDaysAliveFormatted)"
                    resultMessageLabel.hidden = false
                    dayTextField.text = ""
                    monthTextField.text = ""
                    yearTextField.text = ""
                    dayTextField.resignFirstResponder()
                    monthTextField.resignFirstResponder()
                    yearTextField.resignFirstResponder()
                }
                else
                {
                    resultMessageLabel.text = ""
                }
            }
            else
            {
                resultMessageLabel.text = ""
            }
        }
        else
        {
            resultMessageLabel.text = ""
        }
        
    }
    
}
