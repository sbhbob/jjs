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
    
    @IBOutlet weak var flipButton: UIButton!
    
    @IBOutlet weak var p1CharacterOne: UIImageView!
    
    @IBOutlet weak var p1CharacterTwo: UIImageView!
    
    @IBOutlet weak var p1CharacterThree: UIImageView!
    
    @IBOutlet weak var p1StatusEffect: UIImageView!
    
    @IBOutlet weak var p1StatusEffectTwo: UIImageView!
    
    @IBOutlet weak var p1StatusEffectThree: UIImageView!
    
    @IBOutlet weak var player2Button: UIButton!
    
    private let frontImageView: UIImageView! = UIImageView(image: UIImage(named: "front"))
    private let frontImageView2: UIImageView! = UIImageView(image: UIImage(named: "front"))
    private let frontImageView3: UIImageView! = UIImageView(image: UIImage(named: "front"))
    
    private let frontImageViewStatus: UIImageView! = UIImageView(image: UIImage(named: "front"))
    private let frontImageViewStatus2: UIImageView! = UIImageView(image: UIImage(named: "front"))
    private let frontImageViewStatus3: UIImageView! = UIImageView(image: UIImage(named: "front"))
    
    private var backView: UIView = UIView()
    private var backView2: UIView = UIView()
    private var backView3: UIView = UIView()
    
    private var backViewStatus: UIView = UIView()
    private var backViewStatus2: UIView = UIView()
    private var backViewStatus3: UIView = UIView()
    
    private var showingBack = false
    private var characterTapped = false
    private var statusEffectTapped = false
    
    
    let charactersArray = Randomizers.getRandomCharacters()
    let debuffArray = Randomizers.getRandomStatusEffect()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        player2Button.isEnabled = false
        // Hide the back button, because we have a bug rn that wont let us hit the back button cuz if we do the function to determine winner wont work.
        navigationItem.hidesBackButton = true
        
        //Get all views in the xib
        let allViewsInXibArray = Bundle.main.loadNibNamed("FrontCard", owner: self, options: nil)
        let allViewsInXibArray2 = Bundle.main.loadNibNamed("FrontCard", owner: self, options: nil)
        let allViewsInXibArray3 = Bundle.main.loadNibNamed("FrontCard", owner: self, options: nil)
        let allViewsInXibArrayStatus = Bundle.main.loadNibNamed("FrontCard", owner: self, options: nil)
        let allViewsInXibArrayStatus2 = Bundle.main.loadNibNamed("FrontCard", owner: self, options: nil)
        let allViewsInXibArrayStatus3 = Bundle.main.loadNibNamed("FrontCard", owner: self, options: nil)
        //If you only have one view in the xib and you set it's class to MyView class
        let labelView = allViewsInXibArray?.first as! FrontCard
        let labelView2 = allViewsInXibArray2?.first as! FrontCard
        let labelView3 = allViewsInXibArray3?.first as! FrontCard
        
        let labelViewStatus = allViewsInXibArrayStatus?.first as! FrontCard
        let labelViewStatus2 = allViewsInXibArrayStatus2?.first as! FrontCard
        let labelViewStatus3 = allViewsInXibArrayStatus3?.first as! FrontCard
        
        
        let characterOne = charactersArray[0]
        let characterTwo = charactersArray[1]
        let characterThree = charactersArray[2]
        
        labelView.label.text = "\(characterOne.name)"
        labelView2.label.text = "\(characterTwo.name)"
        labelView3.label.text = "\(characterThree.name)"
        
        let debuffOne = debuffArray[0]
        let debuffTwo = debuffArray[1]
        let debuffThree = debuffArray[2]
        
        labelViewStatus.label.text = debuffOne.name
        labelViewStatus2.label.text = debuffTwo.name
        labelViewStatus3.label.text = debuffThree.name
        
        //Set wanted position and size (frame)
        labelView.frame = p1CharacterOne.bounds
        labelView2.frame = p1CharacterTwo.bounds
        labelView3.frame = p1CharacterThree.bounds
        
        labelViewStatus.frame = p1StatusEffect.bounds
        labelViewStatus2.frame = p1StatusEffectTwo.bounds
        labelViewStatus3.frame = p1StatusEffectThree.bounds
        
        backView = labelView
        backView2 = labelView2
        backView3 = labelView3
        
        backViewStatus = labelViewStatus
        backViewStatus2 = labelViewStatus2
        backViewStatus3 = labelViewStatus3
        
        frontImageView.contentMode = .scaleAspectFill
        backView.contentMode = .scaleAspectFit
        frontImageView2.contentMode = .scaleAspectFill
        backView2.contentMode = .scaleAspectFit
        frontImageView3.contentMode = .scaleAspectFill
        backView3.contentMode = .scaleAspectFit
        
        frontImageViewStatus.contentMode = .scaleAspectFill
        backViewStatus.contentMode = .scaleAspectFit
        frontImageViewStatus2.contentMode = .scaleAspectFill
        backViewStatus2.contentMode = .scaleAspectFit
        frontImageViewStatus3.contentMode = .scaleAspectFill
        backViewStatus3.contentMode = .scaleAspectFit
        
        p1CharacterOne.addSubview(frontImageView)
        frontImageView.translatesAutoresizingMaskIntoConstraints = true
        frontImageView.frame = p1CharacterOne.bounds
        
        p1CharacterTwo.addSubview(frontImageView2)
        frontImageView2.translatesAutoresizingMaskIntoConstraints = true
        frontImageView2.frame = p1CharacterTwo.bounds
        
        p1CharacterThree.addSubview(frontImageView3)
        frontImageView3.translatesAutoresizingMaskIntoConstraints = true
        frontImageView3.frame = p1CharacterThree.bounds
        
        p1StatusEffect.addSubview(frontImageViewStatus)
        frontImageViewStatus.translatesAutoresizingMaskIntoConstraints = true
        frontImageViewStatus.frame = p1StatusEffect.bounds
        
        p1StatusEffectTwo.addSubview(frontImageViewStatus2)
        frontImageViewStatus2.translatesAutoresizingMaskIntoConstraints = true
        frontImageViewStatus2.frame = p1StatusEffectTwo.bounds
        
        p1StatusEffectThree.addSubview(frontImageViewStatus3)
        frontImageViewStatus3.translatesAutoresizingMaskIntoConstraints = true
        frontImageViewStatus3.frame = p1StatusEffectThree.bounds
        
        // tap gesture recognizers
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(characterCardTapped(_:)))
        p1CharacterOne.addGestureRecognizer(tapGesture1)
        p1CharacterOne.isUserInteractionEnabled = true
        
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(characterCardTapped(_:)))
        p1CharacterTwo.addGestureRecognizer(tapGesture2)
        p1CharacterTwo.isUserInteractionEnabled = true
        
        let tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(characterCardTapped(_:)))
        p1CharacterThree.addGestureRecognizer(tapGesture3)
        p1CharacterThree.isUserInteractionEnabled = true
        
        let tapGestureStatusEffect1 = UITapGestureRecognizer(target: self, action: #selector(statusEffectCardTapped(_:)))
        p1StatusEffect.addGestureRecognizer(tapGestureStatusEffect1)
        p1StatusEffect.isUserInteractionEnabled = true
        
        let tapGestureStatusEffect2 = UITapGestureRecognizer(target: self, action: #selector(statusEffectCardTapped(_:)))
        p1StatusEffectTwo.addGestureRecognizer(tapGestureStatusEffect2)
        p1StatusEffectTwo.isUserInteractionEnabled = true
        
        let tapGestureStatusEffect3 = UITapGestureRecognizer(target: self, action: #selector(statusEffectCardTapped(_:)))
        p1StatusEffectThree.addGestureRecognizer(tapGestureStatusEffect3)
        p1StatusEffectThree.isUserInteractionEnabled = true
    }
    
    func flip() {
        let toView = showingBack ? frontImageView : backView
        let fromView = showingBack ? backView : frontImageView
        UIView.transition(from: fromView!, to: toView!, duration: 1, options: .transitionFlipFromRight, completion: nil)
        toView!.translatesAutoresizingMaskIntoConstraints = true
       
        
        toView?.frame = p1CharacterOne.bounds
        
        let toView2 = showingBack ? frontImageView2 : backView2
        let fromView2 = showingBack ? backView2 : frontImageView2
        UIView.transition(from: fromView2!, to: toView2!, duration: 1, options: .transitionFlipFromRight, completion: nil)
        toView2!.translatesAutoresizingMaskIntoConstraints = true
        
        toView2?.frame = p1CharacterTwo.bounds
        
        let toView3 = showingBack ? frontImageView3 : backView3
        let fromView3 = showingBack ? backView3 : frontImageView3
        UIView.transition(from: fromView3!, to: toView3!, duration: 1, options: .transitionFlipFromRight, completion: nil)
        toView3!.translatesAutoresizingMaskIntoConstraints = true
        
        toView3?.frame = p1CharacterThree.bounds
        
        let toViewStatus = showingBack ? frontImageViewStatus : backViewStatus
        let fromViewStatus = showingBack ? backViewStatus : frontImageViewStatus
        UIView.transition(from: fromViewStatus!, to: toViewStatus!, duration: 1, options: .transitionFlipFromRight, completion: nil)
        toViewStatus!.translatesAutoresizingMaskIntoConstraints = true
        toViewStatus?.frame = p1StatusEffect.bounds
        
        let toViewStatus2 = showingBack ? frontImageViewStatus2 : backViewStatus2
        let fromViewStatus2 = showingBack ? backViewStatus2 : frontImageViewStatus2
        UIView.transition(from: fromViewStatus2!, to: toViewStatus2!, duration: 1, options: .transitionFlipFromRight, completion: nil)
        toViewStatus2!.translatesAutoresizingMaskIntoConstraints = true
        toViewStatus2?.frame = p1StatusEffectTwo.bounds
        
        let toViewStatus3 = showingBack ? frontImageViewStatus3 : backViewStatus3
        let fromViewStatus3 = showingBack ? backViewStatus3 : frontImageViewStatus3
        UIView.transition(from: fromViewStatus3!, to: toViewStatus3!, duration: 1, options: .transitionFlipFromRight, completion: nil)
        toViewStatus3!.translatesAutoresizingMaskIntoConstraints = true
        toViewStatus3?.frame = p1StatusEffectThree.bounds
        
        showingBack = !showingBack
        
    }
    
    
    
    
    @IBAction func flipButtonTapped(_ sender: Any) {
        flip()
        flipButton.isEnabled = false
        player2Button.isEnabled = true
        
    }
    
    @IBAction func characterIsNotNil(_ sender: Any) {
        if GameManager.shared.player1 == nil {
            // Show an alert asking the user to select a character first so they can't skip this screen
            let alert = UIAlertController(title: "Select a Character and Status Effect!", message: "Please select a character and status effect first.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }
        
        if GameManager.shared.player1!.statusEffect == nil {
             // Show an alert asking the user to select a character first so they can't skip this screen
             let alert = UIAlertController(title: "Select a Status Effect", message: "Please select a status effect.", preferredStyle: .alert)
             alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
             present(alert, animated: true, completion: nil)
             return
         }
    }
    
    
    @objc func characterCardTapped(_ sender: UITapGestureRecognizer) {
        guard !flipButton.isEnabled else { return }
        guard let selectedImageView = sender.view as? UIImageView else { return }
        // Dismiss other character cards and animate the dismissal
        if characterTapped == false {
            let otherCards: [UIImageView] = {
                switch selectedImageView {
                case p1CharacterOne:
                    return [p1CharacterTwo, p1CharacterThree]
                case p1CharacterTwo:
                    return [p1CharacterOne, p1CharacterThree]
                case p1CharacterThree:
                    return [p1CharacterOne, p1CharacterTwo]
                default:
                    return []
                }
            }()
            
            for card in otherCards {
                UIView.animate(withDuration: 0.3, animations: {
                    card.alpha = 0.0
                    card.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
                }) { _ in
                    card.removeFromSuperview()
                }
            }
            
            // Set the selected character value to GameManager.shared.player1
            let selectedCharacterIndex: Int = {
                switch selectedImageView {
                case p1CharacterOne:
                    return 0
                case p1CharacterTwo:
                    return 1
                case p1CharacterThree:
                    return 2
                default:
                    return -1
                }
            }()
            
            if selectedCharacterIndex >= 0 {
                print(charactersArray)
                print(selectedCharacterIndex)
                let selectedCharacter = charactersArray[selectedCharacterIndex]
                GameManager.shared.player1 = selectedCharacter
            }
            characterTapped.toggle()
        }
        else {
            return
        }
    }
    
    @objc func statusEffectCardTapped(_ sender: UITapGestureRecognizer) {
        guard !flipButton.isEnabled else { return }
        guard let selectedImageView = sender.view as? UIImageView else { return }
        if GameManager.shared.player1 == nil {
            // Show an alert asking the user to select a character first
            let alert = UIAlertController(title: "Select a Character", message: "Please select a character first.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }
        
        if statusEffectTapped == false {
            let otherCards: [UIImageView] = {
                switch selectedImageView {
                case p1StatusEffect:
                    return [p1StatusEffectTwo, p1StatusEffectThree]
                case p1StatusEffectTwo:
                    return [p1StatusEffect, p1StatusEffectThree]
                case p1StatusEffectThree:
                    return [p1StatusEffect, p1StatusEffectTwo]
                default:
                    return []
                }
            }()
            
            for card in otherCards {
                UIView.animate(withDuration: 0.3, animations: {
                    card.alpha = 0.0
                    card.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
                }) { _ in
                    card.removeFromSuperview()
                }
            }
            
            // Set the selected status effect value to GameManager.shared.player1.statusEffect
            let selectedStatusEffectIndex: Int = {
                switch selectedImageView {
                case p1StatusEffect:
                    return 0
                case p1StatusEffectTwo:
                    return 1
                case p1StatusEffectThree:
                    return 2
                default:
                    return -1
                }
            }()
            
            if selectedStatusEffectIndex >= 0 {
                let selectedStatusEffect = debuffArray[selectedStatusEffectIndex]
                GameManager.shared.player1!.statusEffect = selectedStatusEffect
            }
            statusEffectTapped.toggle()
        } else {
            return
        }
    }
    
}
