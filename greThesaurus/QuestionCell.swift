//
//  QuestionCell.swift
//  greThesaurus
//
//  Created by Ding Zhang on 12/2/16.
//  Copyright © 2016 kelu2zhao102. All rights reserved.
//

import Foundation
import UIKit
class QuestionCell: UITableViewCell {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var option1Label: UIButton!
    @IBOutlet weak var option2Label: UIButton!
    @IBOutlet weak var option3Label: UIButton!
    @IBOutlet weak var option4Label: UIButton!
    var delegate:QuestionCellDelegate?
    
    @IBAction func didClickOption1(_ sender: Any) {
        delegate?.didClickButton(self, optionIndex: 0)
        option1Label.isSelected = true
        option4Label.isSelected = false
        option2Label.isSelected = false
        option3Label.isSelected = false
    }
    
    @IBAction func didClickOption2(_ sender: Any) {
        delegate?.didClickButton(self, optionIndex: 1)
        option2Label.isSelected = true
        option1Label.isSelected = false
        option4Label.isSelected = false
        option3Label.isSelected = false
    }
    @IBAction func didClickOption3(_ sender: Any) {
        delegate?.didClickButton(self, optionIndex: 2)
        option3Label.isSelected = true
        option1Label.isSelected = false
        option2Label.isSelected = false
        option4Label.isSelected = false
    }
    @IBAction func didClickOption4(_ sender: Any) {
        delegate?.didClickButton(self, optionIndex: 3)
        option4Label.isSelected = true
        option1Label.isSelected = false
        option2Label.isSelected = false
        option3Label.isSelected = false
    }
    
    func configureCell(options:[String],question:String) {
        questionLabel.text = question
        option1Label.setTitle(options[0], for: .normal)
        option2Label.setTitle(options[1], for: .normal)
        option3Label.setTitle(options[2], for: .normal)
        option4Label.setTitle(options[3], for: .normal)
    }
}

protocol QuestionCellDelegate {
    func didClickButton(_ cell: UITableViewCell, optionIndex:Int)
}
