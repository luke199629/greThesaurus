//
//  assesmentViewController.swift
//  greThesaurus
//
//  Created by Ding Zhang on 12/1/16.
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
        solutionButton.titleLabel?.textColor = UIColor.black
    }
    
}
