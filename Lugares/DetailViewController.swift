//
//  DetailViewController.swift
//  Lugares
//
//  Created by Gerard Divi on 4/10/16.
//  Copyright © 2016 Gerard Divi. All rights reserved.
//

import UIKit


class DetailViewController: UIViewController {

    @IBOutlet var tableViewDetail: UITableView!
    @IBOutlet var placeImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var ratingButton: UIButton!
    
    var place: Place!
  
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = ""
        timeLabel.text = ""
        
        self.title = place.name

        self.placeImageView.image = self.place.image
        self.placeImageView.layer.borderColor = UIColor.darkGray.cgColor
        self.placeImageView.layer.borderWidth = 2
        self.placeImageView.layer.cornerRadius = 0
        
        self.tableViewDetail.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1) .withAlphaComponent(0.50)
        
        self.tableViewDetail.tableFooterView = UIView(frame: .zero)
        
        self.tableViewDetail.separatorColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) .withAlphaComponent(0.9)
        self.tableViewDetail.layer.borderWidth = 2
        self.tableViewDetail.layer.borderColor = UIColor.darkGray.cgColor
        self.tableViewDetail.layer.cornerRadius = 0
        
        
        self.tableViewDetail.estimatedRowHeight = 30
        self.tableViewDetail.rowHeight = UITableViewAutomaticDimension
        
        self.ratingButton.setImage(UIImage(named: self.place.rating), for: .normal)

    }
    
    @IBAction func close(segue: UIStoryboardSegue) {
        
        if let reviewVC = segue.source as? ReviewViewController {
            
            if let rating = reviewVC.ratingSelected {
                self.place.rating = rating
                self.ratingButton.setImage(UIImage(named: self.place.rating), for: .normal)
            }
            
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMap" {
            if let destination = segue.destination as? MapViewController {
                destination.place = self.place
            }
            
        }
        
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == "showMap" {
//            let destinationViewController = segue.destinationViewController as! MapViewController
//            destinationViewController.place = self.place
//        }
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DetailViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlaceDetailViewCell", for: indexPath) as! PlaceDetailViewCell
        
        cell.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        
        switch indexPath.section {
        case 0:
            cell.keyLabel.text = "Nombre: "
            cell.valueLabel.text = self.place.name
        case 1:
            cell.keyLabel.text = "Tipo: "
            cell.valueLabel.text = self.place.type
        case 2:
            cell.keyLabel.text = "Localización: "
            cell.valueLabel.text = self.place.location
        case 3:
            cell.keyLabel.text = "Teléfono: "
            cell.valueLabel.text = self.place.telephoneNumber
        case 4:
            cell.keyLabel.text = "Web: "
            cell.valueLabel.text = self.place.web
        default:
            break
        }

    
        return cell
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        
//        var title = ""
//        
//        switch section {
//        case 0:
//            title = "Nombre"
//        case 1:
//            title = "Tiempo"
//        case 2:
//            title = "Ingredientes"
//        case 3:
//            title = "Pasos a seguir"
//        default:
//            break
//        }
//        return title
//        }
    }


extension DetailViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 2:
            //Hemos seleccionado la geolocalización
            self.performSegue(withIdentifier: "showMap", sender: nil)
        default:
            break
        }
    }
    
}


