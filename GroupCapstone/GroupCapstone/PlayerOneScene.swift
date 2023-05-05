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
        
        let charactersArray = Randomizers.getRandomCharacters()
        
        let characterOne = charactersArray[0]
        let characterTwo = charactersArray[1]
        let characterThree = charactersArray[2]
        
        labelView.label.text = "\(characterOne.name)"
        labelView2.label.text = "\(characterTwo.name)"
        labelView3.label.text = "\(characterThree.name)"
        
        let debuffArray = Randomizers.getRandomStatusEffect()
    
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
    }
    
    @objc func imageTapped(_ sender: UITapGestureRecognizer) {
        guard let imageView = sender.view as? UIImageView else { return }
        
        // Handle image tap here
    }

}
