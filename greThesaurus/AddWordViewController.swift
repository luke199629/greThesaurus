//
//  AddWordViewController.swift
//  greThesaurus
//
//  Created by Ke Lu on 11/8/16.
//  Copyright © 2016 kelu2zhao102. All rights reserved.
//

import Foundation
import UIKit

protocol AddWordViewControllerDelegate: class {
    func addWordViewControllerdidCancel(_ controller: AddWordViewController)
    func addWordViewController(_ controller: AddWordViewController, didFinishAdding item: SpecificListItem)
}

class AddWordViewController: UITableViewController, UITextFieldDelegate {
    
    // var delegate: AddWordViewControllerDelegate
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    
    weak var delegate: AddWordViewControllerDelegate?
    
    @IBAction func cancel() {
        // dismiss(animated: true, completion: nil)
        delegate?.addWordViewControllerdidCancel(self)
    }
    
    @IBAction func done() {
        // print("Contents of the text field: \(textField.text!)")
        // dismiss(animated: true, completion: nil)
        let item = SpecificListItem()
        item.word = textField.text!
        delegate?.addWordViewController(self, didFinishAdding:item)
    }
    
   
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let oldText = textField.text! as NSString
        let newText = oldText.replacingCharacters(in: range, with: string) as NSString
        if newText.length > 0 {
            doneBarButton.isEnabled = true
        } else {
            doneBarButton.isEnabled = false
        }
        return true
    }
    
    
    
}
