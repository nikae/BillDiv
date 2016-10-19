//
//  ViewController.swift
//  BillDiv
//
//  Created by Nika on 10/19/16.
//  Copyright © 2016 Nika. All rights reserved.
//


import UIKit

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
    
    
    func calc(percent: Double) -> String {
        
        let bill = Double(totalBillText.text!)
        let person = Double(personText.text!)
        
        if bill != nil && person != nil {
            
            let totalTip = bill! * (percent / 100)
            let totalBill = bill! + totalTip
            
            keyboardDismiss()
            
            tottalBillLabel.font = UIFont(name: tottalBillLabel.font.fontName, size: 47)
            tottalBillLabel.text = "$ \(String(format: "%.2f", (totalBill / person!)))"
            perPersonLabel.text = "Per Person"
            infoLabel.text = "Bill - $ \(bill!)\nTip - \(percent)%\nTotal - $ \(totalBill)\nPerson - \(Int(person!))\nEquals - \(tottalBillLabel.text!) per person"
            
            print(tottalBillLabel.text)
        } else {
            
            refreshview()
            keyboardDismiss()
            
            tottalBillLabel.font = UIFont(name: tottalBillLabel.font.fontName, size: 12)
            tottalBillLabel.text = "FILL THE BOXES ABOVE!"
            print(tottalBillLabel.text)
        }
        return tottalBillLabel.text!
    }
    
    
    @IBAction func tenTipCalc(_ sender: AnyObject) {
        _ = calc(percent: 10)
    }
    
    @IBAction func fiftTipCalc(_ sender: AnyObject) {
        _ = calc(percent: 15)
    }
    
    @IBAction func twTipCalc(_ sender: AnyObject) {
        _ = calc(percent: 20)
    }
    
    @IBAction func noTipCalc(_ sender: AnyObject) {
        _ = calc(percent: 0)
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
    }
    
    
    @IBAction func refreshHit(_ sender: AnyObject) {
        refreshview()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        refreshview()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    
}
