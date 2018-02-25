
import UIKit

class ViewController2: UIViewController ,UIImagePickerControllerDelegate,UINavigationControllerDelegate{

    let imagePicker = UIImagePickerController()
    @IBAction func uploadImage(_ sender: Any) {
     
       if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
                    let image = UIImagePickerController()
                    image.delegate = self
                    image.sourceType = UIImagePickerControllerSourceType.photoLibrary
                    
                    image.allowsEditing = false
                    
                    self.present(image, animated: true)
                    {
                        //After it is complete
                    }
        }
        

    }
    
    @IBAction func savedata(_ sender: Any) {
       
        if  coreDataHandler.saveObjectNote(title: titlee.text!, text: textt.text!, image: imagee.image!)
       {
     
        self.performSegue(withIdentifier: "return", sender: self)
       
        }
    }
    
    @IBOutlet weak var textt: UITextField!
   
    @IBOutlet weak var imagee: UIImageView!
    @IBOutlet weak var titlee: UITextField!
   
   
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
    {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            imagee.image = image
        }
        else
        {
            //Error message
        }
        
        self.dismiss(animated: true, completion: nil)
    }
 
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
