//
//  ViewController.swift
//  DemoAccessibilityInspector
//
//  Created by Rajeshnath Chyarngayil Vishwanath on 1/29/17.
//  Copyright © 2017 Rajeshnath Chyarngayil Vishwanath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelNameValue: UILabel!
    @IBOutlet weak var labelAge: UILabel!
    @IBOutlet weak var labelElevatorPitch: UILabel!
    
    @IBOutlet weak var textAreaElevatorPitch: UITextView!
    
    @IBOutlet weak var labelAgeValue: UILabel!
    @IBOutlet weak var buttonInvite: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* Dynamic text */
        
        self.applyDynamicTextAccessibility()

        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  
    @IBAction func invite(_ sender: Any) {
        
        let alertController = UIAlertController(title: "", message: "Invite Sent !", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default)

        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
 
    func applyDynamicTextAccessibility() {
        
        /* setting dynamic font size */
        labelName.font = UIFont.preferredFont(forTextStyle: .body)
        labelName.adjustsFontForContentSizeCategory = true
        
        labelNameValue.font = UIFont.preferredFont(forTextStyle: .body)
        labelNameValue.adjustsFontForContentSizeCategory = true
        
        labelAge.font = UIFont.preferredFont(forTextStyle: .body)
        labelAge.adjustsFontForContentSizeCategory = true
        
        labelElevatorPitch.font = UIFont.preferredFont(forTextStyle: .body)
        labelElevatorPitch.adjustsFontForContentSizeCategory = true
        
        textAreaElevatorPitch.font = UIFont.preferredFont(forTextStyle: .body)
        textAreaElevatorPitch.adjustsFontForContentSizeCategory = true
        
        labelAgeValue.font = UIFont.preferredFont(forTextStyle: .body)
        labelAgeValue.adjustsFontForContentSizeCategory = true
        /*
        buttonInvite.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        buttonInvite.titleLabel?.adjustsFontForContentSizeCategory = true */
    }
    
    
}

