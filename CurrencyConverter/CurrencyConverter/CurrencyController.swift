//
//  CurrencyController.swift
//  CurrencyConverter
//
//  Created by Aaron on 7/16/19.
//  Copyright © 2019 AlphaGrade, INC. All rights reserved.
//

import UIKit

class CurrencyController: UIViewController {
    
    @IBOutlet weak var usdText: UITextField?
    @IBOutlet weak var cadText: UITextField!
    @IBOutlet weak var currencyToggleButton: UISegmentedControl!
    @IBOutlet weak var cadLabel: UILabel!
    var toggle = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackgroundImage()
        
    }
    

    
    
    @IBAction func calculateButtonPressed(_ sender: Any) {
        if let realDollarAmount = usdText?.text {
            convertUSDAmount(to: Double(realDollarAmount))
        }
       
    }
    
    func convertUSDAmount(to foreignCurrency: Double?) {
        if let aRealDollarAmount = foreignCurrency {
            if toggle == 0 {
                let cadAmount = aRealDollarAmount * 1.30
                let amountInCAD = String(format: "$%.02f", cadAmount)
                 cadText.text = String(amountInCAD)
            } else {
                let jpyAmount = aRealDollarAmount * 107.92
                let amountInJPY = String(format: "¥%.02f", jpyAmount )
                cadText.text = String(amountInJPY)
            }
        } else {
            
        }
        
        
    }
    

    @IBAction func currencyTogglePressed(_ sender: Any) {
        let toggleArray = ["Currency (JPY)", "Currency (CAD)"]
        if toggle == 0 {
           cadLabel.text = toggleArray[toggle]
            cadText.placeholder = "JPY Amount"
            toggle += 1
        } else {
            cadLabel.text = toggleArray[toggle]
            toggle -= 1
            cadText.placeholder = "CAD Amount"
        }
        
       
    }
    
    func setupBackgroundImage() {
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "currency.jpg")!)
    }
    
    
    
}
