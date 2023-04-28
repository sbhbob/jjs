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

    let statusEffectArrPlayerTwo = StatusEffectArray()
    let charArrayPlayerTwo = CharacterArray()
    
    var charactersPlayerTwo: [Character] = []
    var statusEffectPlayerTwo: [StatusEffect] = []
    
    
    @IBOutlet weak var P2CharacterCard1: UIImageView!
    
    @IBOutlet weak var P2CharacterCard2: UIImageView!
    
    
    @IBOutlet weak var P2CharacterCard3: UIImageView!
    
    
    @IBOutlet weak var P2DebuffCard1: UIImageView!
    
    @IBOutlet weak var P2DebuffCard2: UIImageView!
    
    @IBOutlet weak var P2DebuffCard3: UIImageView!
    
    
    
    @IBOutlet var characterCardsP2: [UIImageView]!

    @IBOutlet var debuffCardsP2: [UIImageView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for imageView in characterCardsP2 + debuffCardsP2  {
            imageView.isUserInteractionEnabled = true
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
            imageView.addGestureRecognizer(tapGestureRecognizer)
        }
        
    }

    @objc func imageTapped(_ sender: UITapGestureRecognizer) {
        guard let imageView = sender.view as? UIImageView else { return }
        
        // Handle image tap here
    }

    
    
    @IBAction func playerTwoRandomCharAndStatusEffect(_ sender: Any) {
        charactersPlayerTwo = charArrayPlayerTwo.getRandomCharacters(charArrayPlayerTwo.characterArray)
        statusEffectPlayerTwo = statusEffectArrPlayerTwo.getRandomStatusEffect(StatusEffectArray.statusEffectArray)
    }
    
    
    
    
    
    
}
