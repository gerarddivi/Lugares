//
//  AddPlaceViewController.swift
//  Lugares
//
//  Created by Gerard Divi on 5/10/16.
//  Copyright © 2016 Gerard Divi. All rights reserved.
//

import UIKit
import CoreData

class AddPlaceViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var typeTextField: UITextField!
    @IBOutlet var telephoneTextField: UITextField!
    @IBOutlet var directionTextField: UITextField!
    @IBOutlet var websiteTextField: UITextField!
    @IBOutlet var dislikeButton: UIButton!
    @IBOutlet var goodButton: UIButton!
    @IBOutlet var greatButton: UIButton!
    
    
    var rating: String?
    
    var place: Place?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameTextField.delegate = self
        self.typeTextField.delegate = self
        self.telephoneTextField.delegate = self
        self.directionTextField.delegate = self
        self.websiteTextField.delegate = self

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            //Hay que gestionar la selección de la imagen del lugar
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                let imagePicker = UIImagePickerController()
                imagePicker.allowsEditing = false
                imagePicker.sourceType = .photoLibrary
                imagePicker.delegate = self
                
                self.present(imagePicker, animated: true, completion: nil)
            }
            
            
        }
        
        
        
        
        
        
        
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        self.imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        self.imageView.contentMode = .scaleAspectFill
        self.imageView.clipsToBounds = true
        
        let leadingConstraint = NSLayoutConstraint(item: self.imageView, attribute: .leading, relatedBy: .equal, toItem: self.imageView.superview, attribute: .leading, multiplier: 1, constant: 0)
        leadingConstraint.isActive = true
        
        let trailingConstraint = NSLayoutConstraint(item: self.imageView, attribute: .trailing, relatedBy: .equal, toItem: self.imageView.superview, attribute: .trailing, multiplier: 1, constant: 0)
        trailingConstraint.isActive = true
        
        let topConstraint = NSLayoutConstraint(item: self.imageView, attribute: .top, relatedBy: .equal, toItem: self.imageView.superview, attribute: .top, multiplier: 1, constant: 0)
        topConstraint.isActive = true
        
        let bottomConstraint = NSLayoutConstraint(item: self.imageView, attribute: .bottom, relatedBy: .equal, toItem: self.imageView.superview, attribute: .bottom, multiplier: 1, constant: 0)
        bottomConstraint.isActive = true
        
        dismiss(animated: true, completion: nil)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        
        if let name = self.nameTextField.text,
            let type = self.typeTextField.text,
            let direction = self.directionTextField.text,
            let telephone = self.telephoneTextField.text,
            let website = self.websiteTextField.text,
            let theImage = self.imageView.image,
            let rating = self.rating {
            
            if let container = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer {
                let context = container.viewContext
                
                self.place = NSEntityDescription.insertNewObject(forEntityName: "Place", into: context) as? Place
                
                self.place?.name = name
                self.place?.type = type
                self.place?.location = direction
                self.place?.telephoneNumber = telephone
                self.place?.web = website
                self.place?.rating = rating
                
                self.place?.image = UIImagePNGRepresentation((theImage)) as NSData?
                
                do {
                    try context.save()
                } catch {
                    print("Ha habido un error al guardar el lugar en Core Data")
                }
            }
            
            
            
            
            
            
            
            self.performSegue(withIdentifier: "unwindToMainViewController", sender: self)
            
        } else {
            let alertController = UIAlertController(title: "Falta algún dato", message: "Si no sabes algún dato escribe cualquier cosa, estamos teniendo problemas... Disculpa las molestias", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        }

    }
    
    
    let defaultColor: UIColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
    let selectedColor: UIColor = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)

    @IBAction func ratingPressed(_ sender: UIButton) {
        
        switch sender.tag {
        case 1:
            self.rating = "dislike"
            self.dislikeButton.backgroundColor = selectedColor
            self.goodButton.backgroundColor = defaultColor
            self.greatButton.backgroundColor = defaultColor
        case 2:
            self.rating =  "good"
            self.dislikeButton.backgroundColor = defaultColor
            self.goodButton.backgroundColor = selectedColor
            self.greatButton.backgroundColor = defaultColor
        case 3:
            self.rating = "great"
            self.dislikeButton.backgroundColor = defaultColor
            self.goodButton.backgroundColor = defaultColor
            self.greatButton.backgroundColor = selectedColor
        default:
            break
        }
    }
    

    
    

    // MARK: - Table view data source
//
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
