//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Nikita  on 8/23/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    
    
    @IBOutlet var resultsLabel: UILabel!
    @IBOutlet var settingsLabel: UILabel!
    
    var totalPerPerson = 0.0
    var people = 0
    var tip = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultsLabel.text = totalPerPerson.description
        settingsLabel.text = "Split between \(people) people, with \(tip)% tip."
    }
    

    @IBAction func recalculatePressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
