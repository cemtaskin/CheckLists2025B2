import UIKit

class AddNewItemTableViewController: UITableViewController,UITextFieldDelegate {
    @IBOutlet weak var btnDone: UIBarButtonItem?
    @IBOutlet weak var textField: UITextField?
    weak var delegate : AddNewItemViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func cancel (){
        delegate?.addNewItemViewControllerDidCancel(self)
    }
    @IBAction func done (){
        let item = CheckListItem()
        item.text = textField!.text!
        delegate?.addNewItemViewController(self, didFinishAdding: item)
    }
}

protocol AddNewItemViewControllerDelegate : class{
    func addNewItemViewControllerDidCancel (_ controller: AddNewItemTableViewController)
    func addNewItemViewController(_ controller: AddNewItemTableViewController,didFinishAdding item : CheckListItem)
    
}
