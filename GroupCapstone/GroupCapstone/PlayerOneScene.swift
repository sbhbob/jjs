//
//  PlayerOneAndTwoScene.swift
//  GroupCapstone
//
//  Created by Junne Murdock on 4/25/23.
//

import Foundation
import UIKit

 
class PlayerOneScene: UIViewController {
    var cards: String = ""
    var imageView = UIImage()

    var characters: [Character] = []
    var statusEffect: [StatusEffect] = []

    //PLAYER 1

    
    @IBOutlet weak var P1CharacterCard1: UIImageView!
    
    @IBOutlet weak var P1CharacterCard2: UIImageView!
    
    @IBOutlet weak var P1CharacterCard3: UIImageView!
    
    @IBOutlet weak var P1DebuffCard1: UIImageView!
    
    @IBOutlet weak var P1DebuffCard2: UIImageView!
    
    @IBOutlet weak var P1DebuffCard3: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()


//        print(debuffCardsP1)
        
//        for imageView in characterCardsP1 + debuffCardsP1  {
//            imageView.isUserInteractionEnabled = true
//            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
//            imageView.addGestureRecognizer(tapGestureRecognizer)
//        }

        
    }

    @objc func imageTapped(_ sender: UITapGestureRecognizer) {
        guard let imageView = sender.view as? UIImageView else { return }
        
        // Handle image tap here
    }

    
    @IBAction func randomCharacterAndStatusEffectTapped(_ sender: Any) {

        characters = Randomizers.getRandomCharacters()
        statusEffect = Randomizers.getRandomStatusEffect()
        //        Need to assgin those to the labels
//        characters[0].name
//        characters[1].name
//        characters[2].name
        //        Need to assgin those to the labels
//        statusEffect[0].name
//        statusEffect[1].name
//        statusEffect[2].name
    }
}
