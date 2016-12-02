//
//  TestViewController.swift
//  greThesaurus
//
//  Created by zhao yuanyuan on 12/2/16.
//  Copyright © 2016 kelu2zhao102. All rights reserved.
//

import Foundation
import UIKit
class TestViewController: UIViewController {
    var answersArray = Array(repeating: -1, count: questions.count)
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.allowsSelection = false
        let footerButton = UIButton()
        footerButton.setTitle("Submit", for: .normal)
        footerButton.backgroundColor = .green
        footerButton.addTarget(self, action: #selector(self.didClickSubmit), for: .touchUpInside)
        footerButton.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50)
        self.tableView.tableFooterView = footerButton
        
    }
    
    func didClickSubmit() {
        self.performSegue(withIdentifier: "showResult", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResult" {
            let destination = segue.destination as! ResultViewController
            var numCorrect = 0
            var numIncorrect = 0
            for (index,q) in questions.enumerated() {
                if answersArray[index] == q.solutionIndex {
                    numCorrect += 1
                } else {
                    numIncorrect += 1
                }
            }
            
            
            destination.numIncorrect = numIncorrect
            destination.numCorrect = numCorrect
        }
    }
    
}

extension TestViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "questionCell") as! QuestionCell
        let question = questions[indexPath.row]
        cell.configureCell(options: question.option, question: question.prompt)
        cell.delegate = self
        return cell
    }
}


extension TestViewController: QuestionCellDelegate {
    func didClickButton(_ cell: UITableViewCell, optionIndex: Int) {
        let index = tableView.indexPath(for: cell)!
        let row = index.row
        answersArray[row] = optionIndex
        print(answersArray)
    }
}
