//
//  assesmentViewController.swift
//  greThesaurus
//
//  Created by zhao yuanyuan on 12/1/16.
//  Copyright © 2016 kelu2zhao102. All rights reserved.
//

import Foundation
import UIKit
class AssessmentViewController: UIViewController {
    
    @IBOutlet weak var practiceTestButton: UIButton!
    @IBOutlet weak var solutionButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        practiceTestButton.titleLabel?.textColor = UIColor.black
    }
    
}
