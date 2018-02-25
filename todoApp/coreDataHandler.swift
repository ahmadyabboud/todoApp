
import UIKit
import CoreData
class coreDataHandler: NSObject {
    private class func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
   
    class func editObject(note:Notes) -> Bool
    {
        let context = getContext()
        let manageObject = context.object(with: note.objectID)
        manageObject.setValue(note.title, forKey: "title")
        manageObject.setValue(note.text, forKey: "text")
        manageObject.setValue(note.image, forKey: "image")
        
        do{
            try context.save()
            print("save new object")
            return true
        }catch{
            return false
        }
    }
    class func deleteObject(note:Notes) -> Bool{
        let context = getContext()
        let manageObject = context.object(with: note.objectID)
        context.delete(manageObject)
        do{
            try context.save()
            
            return true
        }catch{
            return false
        }
        
        return true
    }
    //save new object
    class func saveObjectNote(title:String,text:String,image:UIImage) -> Bool
    {
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "Notes", in: context)
        let manageObject = NSManagedObject(entity: entity!, insertInto: context)
        manageObject.setValue(title, forKey: "title")
        manageObject.setValue(text, forKey: "text")
        let imageData: Data = UIImagePNGRepresentation(image)!
        manageObject.setValue(imageData, forKey: "image")
        //save data
        do{
            try context.save()
            return true
        }catch{
            return false
        }
    }
    class func fetchObject() -> [Notes]? // return all Users
    {
        let context = getContext()
        var notes:[Notes]? = nil
        do
        {
            notes = try context.fetch(Notes.fetchRequest())
            return notes
        }catch
        {
            return notes
        }
    }
 
   
   
   
}
