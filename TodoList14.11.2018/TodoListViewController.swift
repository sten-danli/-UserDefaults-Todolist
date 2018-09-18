
import UIKit

class TodoListViewController: UITableViewController {
    
     var todoListArray=[String]()
    
    @IBAction func addNewButton(_ sender: UIBarButtonItem) {
        popUpAlertWithDefault(nil,handler: {(seccess:Bool, result:String?) in
            if seccess==true{
                if let okResult=result{
                    self.todoListArray.append(okResult)
                    let insertPosition=IndexPath(row: self.todoListArray.count-1, section: 0)
                    self.tableView.insertRows(at: [insertPosition], with:.left)
                    self.saveList()
                }
            }
            })
        }
        
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        popUpAlertWithDefault(todoListArray[indexPath.row], handler: { (seccess:Bool, result:String?) in
            if seccess==true{
                if let okResult=result{
                    self.todoListArray[indexPath.row]=okResult
                    self.tableView.reloadData()
                    self.saveList()
                }
            }
        })
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            todoListArray.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    func popUpAlertWithDefault(_ defaultValue:String?, handler:@escaping (Bool,String?)->()){
        let alert=UIAlertController(title: "Add New Items Here", message: nil, preferredStyle: .alert)
        alert.addTextField { (textfield) in
            textfield.placeholder="add new item here"
            textfield.text = defaultValue
        }
       let okButton=UIAlertAction(title: "Ok", style: .default) { (action) in
            if let inputText=alert.textFields?[0].text{
                if inputText != ""{
                    handler(true, inputText)
                }else{
                    handler(false, nil)
                }
            }
        
        }
        let cancelButton=UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        alert.addAction(cancelButton)
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
        }
    func nextStep(seccess:Bool,result:String?){
        if seccess==true{
            if let okResult=result{
                
            }
        }
    }

    func saveList(){
        UserDefaults.standard.set(todoListArray, forKey: "list")
        UserDefaults.standard.synchronize()
    }
    func loadList(){
        if let okList=UserDefaults.standard.stringArray(forKey: "list"){
            todoListArray=okList
        }
    }

    

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text=todoListArray[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoListArray.count
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadList()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotoDetailView"{
            let dvc = segue.destination as! DetailViewController
            if let indexPath = tableView.indexPathForSelectedRow?.row{
                dvc.deatlData=todoListArray[indexPath]
            }
            
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        Todo
    }
}
