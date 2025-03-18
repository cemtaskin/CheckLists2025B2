//
//  CheckListTableViewController.swift
//  CheckLists
//
//  Created by Cem TAŞKIN on 4.03.2025.
//

import UIKit

class CheckListTableViewController: UITableViewController,AddNewItemViewControllerDelegate {
    func addNewItemViewControllerDidCancel(_ controller: AddNewItemTableViewController) {
        controller.dismiss(animated: true)
    }
    
    func addNewItemViewController(_ controller: AddNewItemTableViewController, didFinishAdding item: CheckListItem) {
        dismiss(animated: true)
        print(item.text)
    }
    
    var items : [CheckListItem] //= [] //create an array (type of array is CheckListeItem)
   
    required init?(coder: NSCoder) {
        
        items = []
        
        var item0 = CheckListItem()
        item0.text = "Brush your teeth"
        items.append(item0)
        
        var item1 = CheckListItem()
        item1.text = "Walk the dog"
        items.append(item1)
        
        var item2 = CheckListItem()
        item2.text = "Learn iOS development"
        items.append(item2)
        
        super.init(coder: coder)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "AddItem" {
            let navigationController = segue.destination as! UINavigationController
            
            let controller = navigationController.topViewController as! AddNewItemTableViewController
            
            controller.delegate = self
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("numberOfRowsInSection called")
        return items.count //data source size
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print("cellForRowAt called - >indexPath :\(indexPath.row)" )
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CheckListItem",for: indexPath)
        configureText(for: cell, at: indexPath)
        return cell //returns cell
    }
    
    func configureText (for cell : UITableViewCell, at indexPath : IndexPath){
        
        let labelText = cell.viewWithTag(1000) as? UILabel
        let labelOrder = cell.viewWithTag(1001) as? UILabel
        let labelLenght = cell.viewWithTag(1002) as? UILabel
        
        let item = items[indexPath.row] // get data from data model with index
        labelText!.text = item.text //update cell label text
        labelOrder?.text = "\(indexPath.row + 1)"
        labelLenght?.text = "\(item.text.count)"
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath){
            
            let item = items[indexPath.row]
            if (item.checked){
                cell.accessoryType = .none
            }else{
                cell.accessoryType = .checkmark
            }
            
            item.toggleCheck()

        }
        
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    @IBAction func addItem (){
        var item = CheckListItem()
        item.text = "New added row"
        
        let indexPath = IndexPath(row: items.count, section: 0)
        let indexpaths = [indexPath]
        items.append(item)
        tableView.insertRows(at: indexpaths, with: .automatic)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        items.remove(at: indexPath.row)
        
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
        
    }
    
    
    
    
   
}
