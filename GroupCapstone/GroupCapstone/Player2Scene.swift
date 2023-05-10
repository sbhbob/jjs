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
    
    let charactersArray = Randomizers.getRandomCharacters()
    let debuffArray = Randomizers.getRandomStatusEffect()
    
    private var characterTapped = false
    private var statusEffectTapped = false
    
    
    @IBOutlet weak var p2FlipButton: UIButton!
    
    @IBOutlet weak var p2CharacterCard1: UIImageView!
    
    @IBOutlet weak var p2CharacterCard2: UIImageView!
    
    
    @IBOutlet weak var p2CharacterCard3: UIImageView!
    
    
    @IBOutlet weak var p2DebuffCard1: UIImageView!
    
    @IBOutlet weak var p2DebuffCard2: UIImageView!
    
    @IBOutlet weak var p2DebuffCard3: UIImageView!
    
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Hide the back button, because we have a bug rn that wont let us hit the back button cuz if we do the function to determine winner wont work.
        navigationItem.hidesBackButton = true
        
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
        
        
        // Handle image tap here
        
        let characterOne = charactersArray[0].name
        let characterTwo = charactersArray[1].name
        let characterThree = charactersArray[2].name
        
        labelView.label.text = "\(characterOne)"
        labelView2.label.text = "\(characterTwo)"
        labelView3.label.text = "\(characterThree)"
        
        let debuffArray = Randomizers.getRandomStatusEffect()
        
        let debuffOne = debuffArray[0].name
        let debuffTwo = debuffArray[1].name
        let debuffThree = debuffArray[2].name
        
        labelViewStatus.label.text = debuffOne
        labelViewStatus2.label.text = debuffTwo
        labelViewStatus3.label.text = debuffThree
        
        //Set wanted position and size (frame)
        labelView.frame = p2CharacterCard1.bounds
        labelView2.frame = p2CharacterCard2.bounds
        labelView3.frame = p2CharacterCard3.bounds
        
        labelViewStatus.frame = p2DebuffCard1.bounds
        labelViewStatus2.frame = p2DebuffCard2.bounds
        labelViewStatus3.frame = p2DebuffCard3.bounds
        
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
        
        p2CharacterCard1.addSubview(frontImageView)
        frontImageView.translatesAutoresizingMaskIntoConstraints = true
        frontImageView.frame = p2CharacterCard1.bounds
        
        p2CharacterCard2.addSubview(frontImageView2)
        frontImageView2.translatesAutoresizingMaskIntoConstraints = true
        frontImageView2.frame = p2CharacterCard2.bounds
        
        p2CharacterCard3.addSubview(frontImageView3)
        frontImageView3.translatesAutoresizingMaskIntoConstraints = true
        frontImageView3.frame = p2CharacterCard3.bounds
        
        p2DebuffCard1.addSubview(frontImageViewStatus)
        frontImageViewStatus.translatesAutoresizingMaskIntoConstraints = true
        frontImageViewStatus.frame = p2DebuffCard1.bounds
        
        p2DebuffCard2.addSubview(frontImageViewStatus2)
        frontImageViewStatus2.translatesAutoresizingMaskIntoConstraints = true
        frontImageViewStatus2.frame = p2DebuffCard2.bounds
        
        p2DebuffCard3.addSubview(frontImageViewStatus3)
        frontImageViewStatus3.translatesAutoresizingMaskIntoConstraints = true
        frontImageViewStatus3.frame = p2DebuffCard3.bounds
        
        // tap gesture recognizers
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(characterCardTapped(_:)))
        p2CharacterCard1.addGestureRecognizer(tapGesture1)
        p2CharacterCard1.isUserInteractionEnabled = true
        
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(characterCardTapped(_:)))
        p2CharacterCard2.addGestureRecognizer(tapGesture2)
        p2CharacterCard2.isUserInteractionEnabled = true
        
        let tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(characterCardTapped(_:)))
        p2CharacterCard3.addGestureRecognizer(tapGesture3)
        p2CharacterCard3.isUserInteractionEnabled = true
        
        let tapGestureStatusEffect1 = UITapGestureRecognizer(target: self, action: #selector(statusEffectCardTapped(_:)))
        p2DebuffCard1.addGestureRecognizer(tapGestureStatusEffect1)
        p2DebuffCard1.isUserInteractionEnabled = true
        
        let tapGestureStatusEffect2 = UITapGestureRecognizer(target: self, action: #selector(statusEffectCardTapped(_:)))
        p2DebuffCard2.addGestureRecognizer(tapGestureStatusEffect2)
        p2DebuffCard2.isUserInteractionEnabled = true
        
        let tapGestureStatusEffect3 = UITapGestureRecognizer(target: self, action: #selector(statusEffectCardTapped(_:)))
        p2DebuffCard3.addGestureRecognizer(tapGestureStatusEffect3)
        p2DebuffCard3.isUserInteractionEnabled = true
        
    }
    
    func flip() {
        let toView = showingBack ? frontImageView : backView
        let fromView = showingBack ? backView : frontImageView
        UIView.transition(from: fromView!, to: toView!, duration: 1, options: .transitionFlipFromRight, completion: nil)
        toView!.translatesAutoresizingMaskIntoConstraints = true
        
        toView?.frame = p2CharacterCard1.bounds
        
        let toView2 = showingBack ? frontImageView2 : backView2
        let fromView2 = showingBack ? backView2 : frontImageView2
        UIView.transition(from: fromView2!, to: toView2!, duration: 1, options: .transitionFlipFromRight, completion: nil)
        toView2!.translatesAutoresizingMaskIntoConstraints = true
        
        toView2?.frame = p2CharacterCard2.bounds
        
        let toView3 = showingBack ? frontImageView3 : backView3
        let fromView3 = showingBack ? backView3 : frontImageView3
        UIView.transition(from: fromView3!, to: toView3!, duration: 1, options: .transitionFlipFromRight, completion: nil)
        toView3!.translatesAutoresizingMaskIntoConstraints = true
        
        toView3?.frame = p2CharacterCard3.bounds
        
        let toViewStatus = showingBack ? frontImageViewStatus : backViewStatus
        let fromViewStatus = showingBack ? backViewStatus : frontImageViewStatus
        UIView.transition(from: fromViewStatus!, to: toViewStatus!, duration: 1, options: .transitionFlipFromRight, completion: nil)
        toViewStatus!.translatesAutoresizingMaskIntoConstraints = true
        toViewStatus?.frame = p2DebuffCard1.bounds
        
        let toViewStatus2 = showingBack ? frontImageViewStatus2 : backViewStatus2
        let fromViewStatus2 = showingBack ? backViewStatus2 : frontImageViewStatus2
        UIView.transition(from: fromViewStatus2!, to: toViewStatus2!, duration: 1, options: .transitionFlipFromRight, completion: nil)
        toViewStatus2!.translatesAutoresizingMaskIntoConstraints = true
        toViewStatus2?.frame = p2DebuffCard2.bounds
        
        let toViewStatus3 = showingBack ? frontImageViewStatus3 : backViewStatus3
        let fromViewStatus3 = showingBack ? backViewStatus3 : frontImageViewStatus3
        UIView.transition(from: fromViewStatus3!, to: toViewStatus3!, duration: 1, options: .transitionFlipFromRight, completion: nil)
        toViewStatus3!.translatesAutoresizingMaskIntoConstraints = true
        toViewStatus3?.frame = p2DebuffCard3.bounds
        
        showingBack = !showingBack
    }
    
    @IBAction func p2FlipButtonTapped(_ sender: Any) {
        flip()
        p2FlipButton.isHidden = true
    }
    
    @IBAction func characterIsNotNilP2(_ sender: Any) {
        if GameManager.shared.player2 == nil {
            // Show an alert asking the user to select a character first so they can't skip this screen
            let alert = UIAlertController(title: "Select a Character", message: "Please select a character first.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }
        
       if GameManager.shared.player2!.statusEffect == nil {
            // Show an alert asking the user to select a character first so they can't skip this screen
            let alert = UIAlertController(title: "Select a Status Effect", message: "Please select a status effect.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }
    }
    
    @objc func characterCardTapped(_ sender: UITapGestureRecognizer) {
        guard let selectedImageView = sender.view as? UIImageView else { return }
        // Dismiss other character cards and animate the dismissal
        if characterTapped == false {
            let otherCards: [UIImageView] = {
                switch selectedImageView {
                case p2CharacterCard1:
                    return [p2CharacterCard2, p2CharacterCard3]
                case p2CharacterCard2:
                    return [p2CharacterCard1, p2CharacterCard3]
                case p2CharacterCard3:
                    return [p2CharacterCard1, p2CharacterCard2]
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
            
            // Set the selected character value to GameManager.shared.player2
            let selectedCharacterIndex: Int = {
                switch selectedImageView {
                case p2CharacterCard1:
                    return 0
                case p2CharacterCard2:
                    return 1
                case p2CharacterCard3:
                    return 2
                default:
                    return -1
                }
            }()
            
            if selectedCharacterIndex >= 0 {
                print(charactersArray)
                print(selectedCharacterIndex)
                let selectedCharacter = charactersArray[selectedCharacterIndex]
                GameManager.shared.player2 = selectedCharacter
            }
            characterTapped.toggle()
        }
        else {
            return
        }
    }
    
    @objc func statusEffectCardTapped(_ sender: UITapGestureRecognizer) {
        guard let selectedImageView = sender.view as? UIImageView else { return }
        
        if GameManager.shared.player2 == nil {
            // Show an alert asking the user to select a character first
            let alert = UIAlertController(title: "Select a Character", message: "Please select a character first.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }
        
        if statusEffectTapped == false {
            let otherCards: [UIImageView] = {
                switch selectedImageView {
                case p2DebuffCard1:
                    return [p2DebuffCard2, p2DebuffCard3]
                case p2DebuffCard2:
                    return [p2DebuffCard1, p2DebuffCard3]
                case p2DebuffCard3:
                    return [p2DebuffCard1, p2DebuffCard2]
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
            
            // Set the selected status effect value to GameManager.shared.player2.statusEffect
            let selectedStatusEffectIndex: Int = {
                switch selectedImageView {
                case p2DebuffCard1:
                    return 0
                case p2DebuffCard2:
                    return 1
                case p2DebuffCard3:
                    return 2
                default:
                    return -1
                }
            }()
            
            if selectedStatusEffectIndex >= 0 {
                let selectedStatusEffect = debuffArray[selectedStatusEffectIndex]
                GameManager.shared.player2!.statusEffect = selectedStatusEffect
            }
            statusEffectTapped.toggle()
        } else {
            return
        }
    }  
}
