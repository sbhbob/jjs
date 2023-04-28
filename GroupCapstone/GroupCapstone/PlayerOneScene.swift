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
    @IBOutlet var debuffCardsP1: [UIImageView]!
    @IBOutlet var characterCardsP1: [UIImageView]!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        print(debuffCardsP1)
        
        for imageView in characterCardsP1 + debuffCardsP1  {
            imageView.isUserInteractionEnabled = true
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
            imageView.addGestureRecognizer(tapGestureRecognizer)
        }
        
    }

    @objc func imageTapped(_ sender: UITapGestureRecognizer) {
        guard let imageView = sender.view as? UIImageView else { return }
        
        // Handle image tap here
    }

    
    @IBAction func randomCharacterAndStatusEffectTapped(_ sender: Any) {

        characters = charArray.getRandomCharacters(CharacterArray.characterArray)
        statusEffect = statusEffectArr.getRandomStatusEffect(StatusEffectArray.statusEffectArray)

        characters = Randomizers.getRandomCharacters()
        statusEffect = Randomizers.getRandomStatusEffect()
        
        

    }
}
