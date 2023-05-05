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
