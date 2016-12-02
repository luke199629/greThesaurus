//
//  ResultViewController.swift
//  greThesaurus
//
//  Created by zhao yuanyuan on 12/2/16.
//  Copyright © 2016 kelu2zhao102. All rights reserved.
//

import Foundation
import UIKit
class ResultViewController: UIViewController {
    var numIncorrect:Int!
    var numCorrect:Int!
    @IBOutlet weak var incorrectLabel: UILabel!
    @IBOutlet weak var correctLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        incorrectLabel.text = "Incorrect: \(numIncorrect!)"
        
        correctLabel.text = "Correct: \(numCorrect!)"
    }
}
