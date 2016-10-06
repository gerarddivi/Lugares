//
//  ReviewViewController.swift
//  Lugares
//
//  Created by Gerard Divi on 4/10/16.
//  Copyright © 2016 Gerard Divi. All rights reserved.
//

import UIKit



class ReviewViewController: UIViewController {

    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var ratingStackView: UIStackView!
    @IBOutlet var firstButton: UIButton!
    @IBOutlet var secondButton: UIButton!
    @IBOutlet var thirdButton: UIButton!
    
    var ratingSelected: String?
    
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        
        let scale = CGAffineTransform(scaleX: 0.0, y: 0.0)
        let translation = CGAffineTransform(translationX: 0.0, y: 800.0)
        
        //Combinar escalado con traslación
//        ratingStackView.transform = scale.concatenating(translation)
        self.firstButton.transform = scale.concatenating(translation)
        self.secondButton.transform = scale.concatenating(translation)
        self.thirdButton.transform = scale.concatenating(translation)


        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        UIView.animate(withDuration: 0.5, delay: 0.0, options: [], animations: {
//            self.ratingStackView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
//        }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.7, options: [], animations: {
            self.firstButton.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            }, completion: nil)
        UIView.animate(withDuration: 0.5, delay: 0.1, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.7, options: [], animations: {
            self.secondButton.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            }, completion: nil)
        UIView.animate(withDuration: 0.5, delay: 0.2, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.7, options: [], animations: {
            self.thirdButton.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            }, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ratingPressed(_ sender: UIButton) {
        
        switch sender.tag {
        case 1:
            ratingSelected = "dislike"
            let alert = UIAlertController(title: "Ooohhh!", message: "Siento que no te haya gustado, no te gusta viajar?", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "Ok", style: .default, handler: { (UIAlertAction) in
                self.performSegue(withIdentifier: "unwindToDetailView", sender: sender)
            })
            present(alert, animated: true, completion: nil)
            alert.addAction(okButton)
        case 2:
            ratingSelected = "good"
            let alert = UIAlertController(title: "Bien!", message: "Te ha gustado! Bien!", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "Ok", style: .default, handler: { (UIAlertAction) in
                self.performSegue(withIdentifier: "unwindToDetailView", sender: sender)
            })
            present(alert, animated: true, completion: nil)
            alert.addAction(okButton)

        case 3:
            ratingSelected = "great"
            let alert = UIAlertController(title: "Perfecto!", message: "Súper! Me alegra mucho que te encante este lugar!!!", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "Ok", style: .default, handler: { (UIAlertAction) in
                self.performSegue(withIdentifier: "unwindToDetailView", sender: sender)
            })
            present(alert, animated: true, completion: nil)
            alert.addAction(okButton)

        default:
            break
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

}
