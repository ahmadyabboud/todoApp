

import UIKit

class ViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate{
    var selectedNotes:Notes? = nil
    @IBOutlet weak var tableView: UITableView!
    var notes:[Notes] = []
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! TableViewCell
        let imageUIImage:UIImage = UIImage(data: notes[indexPath.row].image!)!
        
        cell.imagee.layer.cornerRadius = 20
        cell.imagee.clipsToBounds = true
     
        cell.imagee.layer.borderWidth = 4
       
        cell.imagee.image = imageUIImage
        cell.textee.text = notes[indexPath.row].text
        cell.titlee.text = notes[indexPath.row].title
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "edit"
        {
            let indexPathForSelectedRow = tableView.indexPathForSelectedRow
            let row: Int                = (indexPathForSelectedRow?.row)!
            //var selectedRowIndex = self.tableView.indexPathForSelectedRow
            var editCont:EditViewController = segue.destination as! EditViewController
            editCont.Notess = notes[row]
            var note:Note = Note(titiee: notes[row].title!, textt: notes[row].text!, imagee: UIImage(data: notes[row].image!)!)
            editCont.Note = note
            //print(notes[row].objectID)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        notes = coreDataHandler.fetchObject()!
     tableView.reloadData()
        self.navigationItem.setHidesBackButton(true, animated:true);
        // Do any additional setup after loading the view, typically from a nib.
    }

  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        self.navigationItem.setHidesBackButton(true, animated:true);
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
       let delete = UITableViewRowAction(style: .destructive, title: "delete") { (action, indexPath) in
           // delete item at indexPath
           
           let row: Int = (indexPath.row)
           if  coreDataHandler.deleteObject(note: self.notes[row])
           {
            self.notes.remove(at: row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
           }
      }
       return [delete]
    }
    
    
    
    
   
}



