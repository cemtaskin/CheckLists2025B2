//
//  AddNewItemTableViewController.swift
//  CheckLists
//
//  Created by Cem TAŞKIN on 18.03.2025.
//

import UIKit

class AddNewItemTableViewController: UITableViewController,UITextFieldDelegate {
    @IBOutlet weak var btnDone: UIBarButtonItem?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func cancel (){
        dismiss(animated: true)
    }
    
    @IBAction func done (){
        dismiss(animated: true)
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let oldText = textField.text! as NSString
        let newText = oldText.replacingCharacters(in: range, with: string) as NSString
        
        btnDone?.isEnabled = newText.length>0
        
        return true
    }
    
    
   

}
