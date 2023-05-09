////
////  AnimationCode.swift
////  GroupCapstone
////
////  Created by mac on 5/4/23.
////
//
//import Foundation
//@IBOutlet weak var p1CharacterOne: UIView!
//
//@IBOutlet weak var p1CharacterTwo: UIView!
//
//@IBOutlet weak var p1CharacterThree: UIView!
//
//@IBOutlet weak var p1StatusEffect: UIView!
//
//@IBOutlet weak var p1StatusEffectTwo: UIView!
//
//@IBOutlet weak var p1StatusEffectThree: UIView!
//
//private let frontImageView: UIImageView! = UIImageView(image: UIImage(named: "front"))
//private let frontImageView2: UIImageView! = UIImageView(image: UIImage(named: "front"))
//private let frontImageView3: UIImageView! = UIImageView(image: UIImage(named: "front"))
//
//private let frontImageViewStatus: UIImageView! = UIImageView(image: UIImage(named: "front"))
//private let frontImageViewStatus2: UIImageView! = UIImageView(image: UIImage(named: "front"))
//private let frontImageViewStatus3: UIImageView! = UIImageView(image: UIImage(named: "front"))
//
//private var backView: UIView = UIView()
//private var backView2: UIView = UIView()
//private var backView3: UIView = UIView()
//
//private var backViewStatus: UIView = UIView()
//private var backViewStatus2: UIView = UIView()
//private var backViewStatus3: UIView = UIView()
//
//private var showingBack = false
//
//override func viewDidLoad() {
//    super.viewDidLoad()
//    //Get all views in the xib
//    let allViewsInXibArray = Bundle.main.loadNibNamed("LabelView", owner: self, options: nil)
//    let allViewsInXibArray2 = Bundle.main.loadNibNamed("LabelView", owner: self, options: nil)
//    let allViewsInXibArray3 = Bundle.main.loadNibNamed("LabelView", owner: self, options: nil)
//    let allViewsInXibArrayStatus = Bundle.main.loadNibNamed("LabelView", owner: self, options: nil)
//    let allViewsInXibArrayStatus2 = Bundle.main.loadNibNamed("LabelView", owner: self, options: nil)
//    let allViewsInXibArrayStatus3 = Bundle.main.loadNibNamed("LabelView", owner: self, options: nil)
//    //If you only have one view in the xib and you set it's class to MyView class
//    let labelView = allViewsInXibArray?.first as! LabelView
//    let labelView2 = allViewsInXibArray2?.first as! LabelView
//    let labelView3 = allViewsInXibArray3?.first as! LabelView
//
//    let labelViewStatus = allViewsInXibArrayStatus?.first as! LabelView
//    let labelViewStatus2 = allViewsInXibArrayStatus2?.first as! LabelView
//    let labelViewStatus3 = allViewsInXibArrayStatus3?.first as! LabelView
//
//    let charactersArray = Randomizers.getRandomCharacters()
//
//    let characterOne = charactersArray[0].name
//    let characterTwo = charactersArray[1].name
//    let characterThree = charactersArray[2].name
//
//    labelView.label.text = "\(characterOne)"
//    labelView2.label.text = "\(characterTwo)"
//    labelView3.label.text = "\(characterThree)"
//
//    let debuffArray = Randomizers.getRandomStatusEffect()
//
//    let debuffOne = debuffArray[0].name
//    let debuffTwo = debuffArray[1].name
//    let debuffThree = debuffArray[2].name
//
//    labelViewStatus.label.text = debuffOne
//    labelViewStatus2.label.text = debuffTwo
//    labelViewStatus3.label.text = debuffThree
//
//    //Set wanted position and size (frame)
//    labelView.frame = p1CharacterOne.bounds
//    labelView2.frame = p1CharacterTwo.bounds
//    labelView3.frame = p1CharacterThree.bounds
//
//    labelViewStatus.frame = p1StatusEffect.bounds
//    labelViewStatus2.frame = p1StatusEffectTwo.bounds
//    labelViewStatus3.frame = p1StatusEffectThree.bounds
//
//    backView = labelView
//    backView2 = labelView2
//    backView3 = labelView3
//
//    backViewStatus = labelViewStatus
//    backViewStatus2 = labelViewStatus2
//    backViewStatus3 = labelViewStatus3
//
//    frontImageView.contentMode = .scaleAspectFill
//    backView.contentMode = .scaleAspectFit
//    frontImageView2.contentMode = .scaleAspectFill
//    backView2.contentMode = .scaleAspectFit
//    frontImageView3.contentMode = .scaleAspectFill
//    backView3.contentMode = .scaleAspectFit
//
//    frontImageViewStatus.contentMode = .scaleAspectFill
//    backViewStatus.contentMode = .scaleAspectFit
//    frontImageViewStatus2.contentMode = .scaleAspectFill
//    backViewStatus2.contentMode = .scaleAspectFit
//    frontImageViewStatus3.contentMode = .scaleAspectFill
//    backViewStatus3.contentMode = .scaleAspectFit
//
//    p1CharacterOne.addSubview(frontImageView)
//    frontImageView.translatesAutoresizingMaskIntoConstraints = true
//    frontImageView.frame = p1CharacterOne.bounds
//
//    p1CharacterTwo.addSubview(frontImageView2)
//    frontImageView2.translatesAutoresizingMaskIntoConstraints = true
//    frontImageView2.frame = p1CharacterTwo.bounds
//
//    p1CharacterThree.addSubview(frontImageView3)
//    frontImageView3.translatesAutoresizingMaskIntoConstraints = true
//    frontImageView3.frame = p1CharacterThree.bounds
//
//    p1StatusEffect.addSubview(frontImageViewStatus)
//    frontImageViewStatus.translatesAutoresizingMaskIntoConstraints = true
//    frontImageViewStatus.frame = p1StatusEffect.bounds
//
//    p1StatusEffectTwo.addSubview(frontImageViewStatus2)
//    frontImageViewStatus2.translatesAutoresizingMaskIntoConstraints = true
//    frontImageViewStatus2.frame = p1StatusEffectTwo.bounds
//
//    p1StatusEffectThree.addSubview(frontImageViewStatus3)
//    frontImageViewStatus3.translatesAutoresizingMaskIntoConstraints = true
//    frontImageViewStatus3.frame = p1StatusEffectThree.bounds
//}
//
//func flip() {
//    let toView = showingBack ? frontImageView : backView
//    let fromView = showingBack ? backView : frontImageView
//    UIView.transition(from: fromView!, to: toView!, duration: 1, options: .transitionFlipFromRight, completion: nil)
//    toView!.translatesAutoresizingMaskIntoConstraints = true
//
//    toView?.frame = p1CharacterOne.bounds
//
//    let toView2 = showingBack ? frontImageView2 : backView2
//    let fromView2 = showingBack ? backView2 : frontImageView2
//    UIView.transition(from: fromView2!, to: toView2!, duration: 1, options: .transitionFlipFromRight, completion: nil)
//    toView2!.translatesAutoresizingMaskIntoConstraints = true
//
//    toView2?.frame = p1CharacterTwo.bounds
//
//    let toView3 = showingBack ? frontImageView3 : backView3
//    let fromView3 = showingBack ? backView3 : frontImageView3
//    UIView.transition(from: fromView3!, to: toView3!, duration: 1, options: .transitionFlipFromRight, completion: nil)
//    toView3!.translatesAutoresizingMaskIntoConstraints = true
//
//    toView3?.frame = p1CharacterThree.bounds
//
//    let toViewStatus = showingBack ? frontImageViewStatus : backViewStatus
//    let fromViewStatus = showingBack ? backViewStatus : frontImageViewStatus
//    UIView.transition(from: fromViewStatus!, to: toViewStatus!, duration: 1, options: .transitionFlipFromRight, completion: nil)
//    toViewStatus!.translatesAutoresizingMaskIntoConstraints = true
//    toViewStatus?.frame = p1StatusEffect.bounds
//
//    let toViewStatus2 = showingBack ? frontImageViewStatus2 : backViewStatus2
//    let fromViewStatus2 = showingBack ? backViewStatus2 : frontImageViewStatus2
//    UIView.transition(from: fromViewStatus2!, to: toViewStatus2!, duration: 1, options: .transitionFlipFromRight, completion: nil)
//    toViewStatus2!.translatesAutoresizingMaskIntoConstraints = true
//    toViewStatus2?.frame = p1StatusEffectTwo.bounds
//
//    let toViewStatus3 = showingBack ? frontImageViewStatus3 : backViewStatus3
//    let fromViewStatus3 = showingBack ? backViewStatus3 : frontImageViewStatus3
//    UIView.transition(from: fromViewStatus3!, to: toViewStatus3!, duration: 1, options: .transitionFlipFromRight, completion: nil)
//    toViewStatus3!.translatesAutoresizingMaskIntoConstraints = true
//    toViewStatus3?.frame = p1StatusEffectThree.bounds
//
//    showingBack = !showingBack
//
//}
//@IBOutlet weak var flipButton1: UIButton!
//
//@IBAction func flipViewButtonTapped(_ sender: Any) {
//    flip()
//    flipButton1.isEnabled = false
//}
