
import UIKit

class EditViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    var Note:Note!
    var Notess:Notes!
    @IBOutlet weak var imagee: UIImageView!
    @IBOutlet weak var titlee: UITextField!
    @IBOutlet weak var notee: UITextField!
     let imagePicker = UIImagePickerController()
    
    @IBAction func save(_ sender: Any) {
        
        Notess.text = notee.text
        Notess.title = titlee.text
        Notess.image = UIImagePNGRepresentation(imagee.image!)!
        if  coreDataHandler.editObject(note: Notess)
        {
           //  print("object has been saved")
           //  self.performSegue(withIdentifier: "return1", sender: self)
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //enable Tap Me on Image
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tappedMe))
        imagee.addGestureRecognizer(tap)
        imagee.isUserInteractionEnabled = true
        
        
        
        imagee.image=Note.image
        titlee.text=Note.title
        notee.text=Note.text
        print(Notess.objectID)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func tappedMe()
    {
        
        //Open image from photo library
        let image = UIImagePickerController()
        image.delegate = self
        
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        
        image.allowsEditing = false
        
        self.present(image, animated: true)
        {
            //After it is complete
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //hide keyboard 
        self.view.endEditing(true)
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
}
