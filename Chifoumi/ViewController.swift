//
//  ViewController.swift
//  Chifoumi
//
//  Created by Solo on 11/05/2020.
//  Copyright © 2020 CopySolo_. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var resultatLabel: UILabel!
    @IBOutlet weak var resultatImageView: UIImageView!
    @IBOutlet weak var pierreBouton: UIButton!
    @IBOutlet weak var feuilleBouton: UIButton!
    @IBOutlet weak var ciseauxBouton: UIButton!
    
    var chronometre: Timer?
    var jukeBox: AVAudioPlayer?
    
    var boutons = [UIButton]()
    var images = [#imageLiteral(resourceName: "pierre.png"), #imageLiteral(resourceName: "feuille.png"), #imageLiteral(resourceName: "ciseaux.png")]
    var dictionnaire = ["pierre": #imageLiteral(resourceName: "pierre.png"), "feuille": #imageLiteral(resourceName: "feuille.png"), "ciseaux": #imageLiteral(resourceName: "ciseaux.png"),]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        boutons = [pierreBouton, feuilleBouton, ciseauxBouton]
        //Action bouton
    }
    
    func jouerSon(nom: String, ext: String, repetition: Int) {
        let bundle = Bundle.main
        if let son = bundle.url(forResource: nom, withExtension: ext) {
            do {
                jukeBox = try AVAudioPlayer(contentsOf: son)
                jukeBox?.numberOfLoops = repetition
                jukeBox?.prepareToPlay()
                jukeBox?.play()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    
    
    @IBAction func pierreBonAppuye(_ sender: Any) {
        lancerChronometre(choix: "pierre")
        disponibiliteDesBoutons(dispo: false, boutonChoisis: pierreBouton)
    }
    
    
    @IBAction func feuilleBoutonAppuye(_ sender: Any) {
        lancerChronometre(choix: "feuille")
        disponibiliteDesBoutons(dispo: false, boutonChoisis: feuilleBouton)
    }
    
    
    @IBAction func ciseauxBoutonAppuye(_ sender: Any) {
        lancerChronometre(choix: "ciseaux")
        disponibiliteDesBoutons(dispo: false, boutonChoisis: ciseauxBouton)
        
    }
     
    //fonction Chrometre

    func lancerChronometre(choix: String) {
        resultatLabel.text = ""
        jouerSon(nom: "tictac", ext: "mp3", repetition: -1)
        var nombreDeTours = 0
        chronometre = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: { (chrono) in
            if nombreDeTours < 10 {
                
                UIView.transition(with: self.resultatImageView, duration: 0.5, options: .transitionFlipFromLeft, animations: {
                    self.resultatImageView.image = self.imageAleatoire()
                }, completion: nil)
                //self.resultatImageView.image = self.imageAleatoire()
                nombreDeTours += 1
            } else {
                self.chronometre?.invalidate()
                self.jukeBox?.stop()
                if self.dictionnaire[choix] == self.resultatImageView.image {
                    //Print
                    self.resultatLabel.text = "C'est Gagné!"
                    self.jouerSon(nom: "good", ext: "wav", repetition: 1)
                }else {
                    self.resultatLabel.text = "Cest' Perdu!"
                    self.jouerSon(nom: "wrong", ext: "wav", repetition: 1)
                }
                self.disponibiliteDesBoutons(dispo: true, boutonChoisis: nil)
            }
        })
    }

    
    func imageAleatoire() -> UIImage {
        let aleatoireInt = Int(arc4random_uniform(UInt32(3)))
        return images[aleatoireInt]
    
    }
    
    func disponibiliteDesBoutons(dispo: Bool, boutonChoisis: UIButton?){
        if dispo {
            for bouton in boutons {
                bouton.isUserInteractionEnabled = true
                bouton.alpha = 1
            }
        } else {
            guard let choix = boutonChoisis else { return }
            for bouton in boutons {
                bouton.isUserInteractionEnabled = false
                if bouton != choix {
                    bouton.alpha = 0.33
                }
            }
        }
    }
    
}

