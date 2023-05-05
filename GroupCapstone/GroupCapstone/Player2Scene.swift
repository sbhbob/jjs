//
//  Player2Scene.swift
//  GroupCapstone
//
//  Created by Junne Murdock on 4/25/23.
//


import Foundation
import UIKit

 
class PlayerTwoScene: UIViewController {
    var cards: String = ""
    var imageView = UIImage()

    
    var charactersPlayerTwo: [Character] = []
    var statusEffectPlayerTwo: [StatusEffect] = []
    
    
    @IBOutlet weak var p2CharacterCard1: UIImageView!
    
    @IBOutlet weak var P2CharacterCard2: UIImageView!
    
    
    @IBOutlet weak var P2CharacterCard3: UIImageView!
    
    
    @IBOutlet weak var P2DebuffCard1: UIImageView!
    
    @IBOutlet weak var P2DebuffCard2: UIImageView!
    
    @IBOutlet weak var P2DebuffCard3: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

//        for imageView in characterCardsP2 + debuffCardsP2  {
//            imageView.isUserInteractionEnabled = true
//            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
//            imageView.addGestureRecognizer(tapGestureRecognizer)
//        }
        
    }

    @objc func imageTapped(_ sender: UITapGestureRecognizer) {
        guard let imageView = sender.view as? UIImageView else { return }
        
        // Handle image tap here
    }

    
    
    @IBAction func playerTwoRandomCharAndStatusEffect(_ sender: Any) {

        charactersPlayerTwo = Randomizers.getRandomCharacters()
        statusEffectPlayerTwo = Randomizers.getRandomStatusEffect()
        //        Need to assgin those to the labels
//        charactersPlayerTwo[0].name
//        charactersPlayerTwo[1].name
//        charactersPlayerTwo[2].name
//        Need to assgin those to the labels
//        statusEffectPlayerTwo[0].name
//        statusEffectPlayerTwo[1].name
//        statusEffectPlayerTwo[2].name
    }
    
    
    
    
    
    
}
