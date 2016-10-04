//
//  ViewController.swift
//  Lugares
//
//  Created by Gerard Divi on 4/10/16.
//  Copyright © 2016 Gerard Divi. All rights reserved.
//

import UIKit



class ViewController: UITableViewController {
    
    var places: [Place] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        
        var place = Place(name: "AlexanderPlatz", type: "Plaza de interés", location: "Alexanderstraße 4 10178 Berlin Deutschland", image: #imageLiteral(resourceName: "alexanderplatz"), telephoneNumber: "5558172", web: "https://www.disfrutaberlin.com/alexanderplatz")
        places.append(place)
        
        place = Place(name: "Andorra", type: "Paisaje", location: "Ruta del Paisaje y Tradiciones AD300 Ordino Andorra", image: #imageLiteral(resourceName: "andorra"), telephoneNumber: "12341552", web: "http://visitandorra.com/ca/itineraris/ruta-de-senderisme-estanys-de-tristaina/")
        places.append(place)
        
        place = Place(name: "Atomium", type: "Museo", location: "Atomiumsquare 1 1020 Bruxelles België", image: #imageLiteral(resourceName: "atomium"), telephoneNumber: "", web: "http://atomium.be")
        places.append(place)
        
        place = Place(name: "Big Ben", type: "Monumento", location: "London SW1A 0AA England", image: #imageLiteral(resourceName: "bigben"), telephoneNumber: "", web: "http://www.parliament.uk/bigben")
        places.append(place)
        
        place = Place(name: "Cristo Redentor", type: "Monumento", location: "Cristo Redentor João Pessoa - PB Brasil", image: #imageLiteral(resourceName: "cristoredentor"), telephoneNumber: "", web: "https://en.cristoredentoroficial.com.br/ingressos")
        places.append(place)
        
        place = Place(name: "Los Gigantes", type: "Acantilados", location: "Calle Poblado Marinero 38683 Santiago del Teide Santa Cruz de Tenerife, España", image: #imageLiteral(resourceName: "gigantes"), telephoneNumber: "", web: "http://www.losgigantes.com")
        places.append(place)
        
        place = Place(name: "Louvre", type: "Museo", location: "Rue de Rivoli 75058 Paris France", image: #imageLiteral(resourceName: "louvre"), telephoneNumber: "", web: "http://www.louvre.fr")
        places.append(place)
        
        place = Place(name: "Catedral de Palma de Mallorca", type: "Catedral", location: "La Seu Plaza de la Seu 5 07001 Palma, Baleares, España", image: #imageLiteral(resourceName: "mallorca"), telephoneNumber: "902022445", web: "http://www.visitpalma.com/es/contenido/lugares-de-interes/lugarinteres/La-Seu-Catedral-de-Mallorca/")
        places.append(place)
        
        place = Place(name: "Torre Eiffel", type: "Monumento", location: "5 Avenue Anatole France 75007 Paris France", image: #imageLiteral(resourceName: "torreeiffel"), telephoneNumber: "", web: "http://www.toureiffel.paris/es.html")
        places.append(place)
        
        place = Place(name: "Muralla China", type: "Monumento", location: "Great Wall, Mutianyu Beijing China", image: #imageLiteral(resourceName: "murallachina"), telephoneNumber: "", web: "https://www.disfrutapekin.com/gran-muralla-china")
        places.append(place)
        
        place = Place(name: "Torre de Pisa", type: "Monumento", location: "Torre di Pisa 56126 Pisa Italia", image: #imageLiteral(resourceName: "torrepisa"), telephoneNumber: "+39 050 835011", web: "http://turismo.org/torre-de-pisa/")
        places.append(place)
        
        place = Place(name: "Estatua de la Libertad", type: "Monumento", location: "Liberty Island Nueva York, NY  10004 Estados Unidos", image: #imageLiteral(resourceName: "estatualibertad"), telephoneNumber: "", web: "https://www.nuevayork.net/estatua-libertad")
        places.append(place)
        
        place = Place(name: "El Serrallo", type: "Lugar emblemático", location: "Calle de Trafalgar 43004 Tarragona España", image: #imageLiteral(resourceName: "serrallo"), telephoneNumber: "", web: "http://www.porttarragona.cat/ca/port-i-ciutat-sp-1179214180/espais-ludics-menu/el-serrallo-menu.html")
        places.append(place)
        
        place = Place(name: "El Teide", type: "Volcán", location: "Parque Nacional Del Teide Lugar las Cañadas del Teide, 38 38300 La Orotava Santa Cruz de Tenerife, España", image: #imageLiteral(resourceName: "teide"), telephoneNumber: "", web: "http://www.webtenerife.com/que-visitar/parque-nacional-del-teide/?tab=1")
        places.append(place)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnSwipe = true
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - UITableViewDataSource
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.places.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let place = places[indexPath.row]
        let cellID = "PlaceCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! PlaceCell
        cell.nameLabel.text = place.name
        cell.thumbnailImageView.image = place.image
        cell.timeLabel.text = place.type
        cell.ingredientsLabel.text = place.location
        
        cell.thumbnailImageView.layer.borderColor = UIColor.darkGray.cgColor
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            self.places.remove(at: indexPath.row)
        }
        
        self.tableView.deleteRows(at: [indexPath], with: .fade)
    }
    
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        //Compartir
        let shareAction = UITableViewRowAction(style: .default, title: "Compartir") { (action, indexPath) in
            
            let place = self.places[indexPath.row]
            
            var shareDefaultText = "Estoy mirando en la App del curso de iOS 10 con Juan Gabriel el lugar de \(place.name).\nEs un \(place.type)." //\nTiene estos ingredientes: \n"
            
//            for ingrediente in self.places[indexPath.row].location {
//                shareDefaultText += "-\(ingrediente)\n"
//            }
//            
//            shareDefaultText += "Los pasos a seguir son : \n"
//            
//            for paso in self.places[indexPath.row].steps {
//                shareDefaultText += "-\(paso). \n"
//            }
            
            let activityController = UIActivityViewController(activityItems: [shareDefaultText, self.places[indexPath.row].image!], applicationActivities: nil)
            self.present(activityController, animated: true, completion: nil)
        }
        shareAction.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        //Borrar
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Borrar") { (action, indexPath) in
            self.places.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
        
        deleteAction.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        return[shareAction, deleteAction]
        
    }
    
    
    //MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("He seleccionado la fila \(indexPath.row)")
        

        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let selectedPlace = self.places[indexPath.row]
                let destinationViewController = segue.destination as! DetailViewController
                destinationViewController.place = selectedPlace
         }

        }

}
    
}



