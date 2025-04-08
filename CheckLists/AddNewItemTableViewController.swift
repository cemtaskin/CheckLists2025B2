import UIKit

class AddNewItemTableViewController: UITableViewController,UITextFieldDelegate {
    var itemToEdit : CheckListItem?
    
    @IBOutlet weak var btnDone: UIBarButtonItem?
    @IBOutlet weak var textField: UITextField?
    weak var delegate : AddNewItemViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let item = itemToEdit{
            title = "Edit Item"
            textField?.text = item.text
        }
    }
    @IBAction func cancel (){
        delegate?.addNewItemViewControllerDidCancel(self)
    }
    @IBAction func done (){
        let item = CheckListItem()
        item.text = textField!.text!
        if let item = itemToEdit {
            delegate?.addNewItemViewController(self, didFinishEditing: item)
        }else{
            delegate?.addNewItemViewController(self, didFinishAdding: item)
        }
       
        
        
        
        
    }
}

protocol AddNewItemViewControllerDelegate : class{
    func addNewItemViewControllerDidCancel (_ controller: AddNewItemTableViewController)
    func addNewItemViewController(_ controller: AddNewItemTableViewController,didFinishAdding item : CheckListItem)
    func addNewItemViewController(_ controller: AddNewItemTableViewController,didFinishEditing item : CheckListItem)
    
}
