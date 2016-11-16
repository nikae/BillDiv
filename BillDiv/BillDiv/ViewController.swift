//
//  ViewController.swift
//  BillDiv
//
//  Created by Nika on 10/19/16.
//  Copyright © 2016 Nika. All rights reserved.
//


import UIKit
import Foundation

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var totalBillText: UITextField!
    @IBOutlet weak var personText: UITextField!
    
    @IBOutlet weak var tottalBillLabel: UILabel!
    @IBOutlet weak var perPersonLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    @IBOutlet weak var tenTipBtn: UIButton!
    @IBOutlet weak var fifteenTipBtn: UIButton!
    @IBOutlet weak var twentyTipBtn: UIButton!
    @IBOutlet weak var noTipBtn: UIButton!
    
    let orangeColor = UIColor(red: 189/255.0, green: 85/255.0, blue: 59/255.0, alpha: 1.0)
    

    func calculateBill(percent: Double) -> String {
        
        let bill = Double(totalBillText.text!)
        var person: Double = 0
        if personText.text == "" {
        person = 1
        } else {
            person = Double(personText.text!)!

        }
    
        
        if bill != nil  {
            
            let totalTip = bill! * (percent / 100)
            let totalBill = bill! + totalTip
            
            keyboardDismiss()
            
            tottalBillLabel.font = UIFont(name: tottalBillLabel.font.fontName, size: 47)
            tottalBillLabel.text = "$ \(String(format: "%.2f", (totalBill / person)))"
            perPersonLabel.text = "Per Person"
            infoLabel.text = "Bill - $ \(bill!)\nTip - $\(totalTip)\nTotal - $ \(totalBill)\nPerson - \(Int(person))\nEquals - \(tottalBillLabel.text!) per person"
            
            print(tottalBillLabel.text ?? "0")
        } else {
            
            refreshview()
            keyboardDismiss()
            
            tottalBillLabel.font = UIFont(name: tottalBillLabel.font.fontName, size: 12)
            tottalBillLabel.text = "FILL THE BOXES ABOVE!"
            print(tottalBillLabel.text ?? "0")
        }
        return tottalBillLabel.text!
    }
    
    
    @IBAction func tenTipCalc(_ sender: AnyObject) {
        _ = calculateBill(percent: 10)
      
        tenTipBtn.backgroundColor = UIColor.darkGray
        fifteenTipBtn.backgroundColor = orangeColor
        twentyTipBtn.backgroundColor = orangeColor
        noTipBtn.backgroundColor = orangeColor
        
    }
    func fiftTipCalc(_ sender: AnyObject) {
        _ = calculateBill(percent: 15)
        
        tenTipBtn.backgroundColor = orangeColor
        fifteenTipBtn.backgroundColor = UIColor.darkGray
        twentyTipBtn.backgroundColor = orangeColor
        noTipBtn.backgroundColor = orangeColor
        
    }
    
    @IBAction func twTipCalc(_ sender: AnyObject) {
        _ = calculateBill(percent: 20)
        
        tenTipBtn.backgroundColor = orangeColor
        fifteenTipBtn.backgroundColor = orangeColor
        twentyTipBtn.backgroundColor = UIColor.darkGray
        noTipBtn.backgroundColor = orangeColor
    }
    
    @IBAction func noTipCalc(_ sender: AnyObject) {
        _ = calculateBill(percent: 0)
        
        
        tenTipBtn.backgroundColor = orangeColor
        fifteenTipBtn.backgroundColor = orangeColor
        twentyTipBtn.backgroundColor = orangeColor
        noTipBtn.backgroundColor = UIColor.darkGray
    }
    
    
    // dismiss keyboard
    
    func keyboardDismiss() {
        totalBillText.resignFirstResponder()
        personText.resignFirstResponder()
    }
    
    @IBAction func viewTapped(_ sender: AnyObject) {
        keyboardDismiss()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        keyboardDismiss()
        
        return true
    }
    
    
    
    //reload data
    func refreshview() {
        totalBillText.text = ""
        personText.text = ""
        tottalBillLabel.text = ""
        perPersonLabel.text = ""
        infoLabel.text = ""
        
        
        
        tenTipBtn.backgroundColor = orangeColor
        fifteenTipBtn.backgroundColor = orangeColor
        twentyTipBtn.backgroundColor = orangeColor
        noTipBtn.backgroundColor = orangeColor

    }
    
    
    @IBAction func refreshHit(_ sender: AnyObject) {
        refreshview()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshview()
        
        
    }
    
}
