//
//  Battle Scene .swift
//  GroupCapstone
//
//  Created by Junne Murdock on 4/18/23.
//

import Foundation
import UIKit


class BattleSceneViewController: UIViewController {
    
    // firecave, ocean, stormySky, volcano, mountain, plains, parkingGarage, timesSquare, graveyard, outerSpace, yourMomsHouse, CERN, swamp, sewer
    
    
    @IBOutlet weak var BattleSceneImage: UIImageView!
   




//For random statusEffect
    let statusEffectArray: [StatusEffect] = [GodPowers(), RicksPortalGun(), AISlaves(), AncientDarkMagicks(), Memories(), PhilosophersStone(), IlluminatiMember(), Bribes(), NoMorals(), ShadowClones(), WitchesCurse(), MissingNo(), Genie(), Enlightened(), UltraPerception(), JackedPikachu(), Velociraptor(), Firebending(), LightningBreath(), Confidence(), Teleportation(), Religious(), Flubber(), TimeFreezer(), JungleBaby(), Influential(), SixthSense(), PropheticDreams(), Blingin(), MonkeysPaw(), NoMercy(), Entrepreneur(), WaterShaman(), SharkTeeth(), CardThrower(), Thighs4Life(), BoinicLimbs(), Informed(),PopEye(), MarriedWell(), BlackBelt(), Superfan(), Hedonist(), ElkMeat(), Hunter(), YardSale(), Vegan(), Employed(), WellCaffienated(), JustAte(), HotDogMaster(), PriusOwner(), TreeHugger(), SamsungOnly(), WeedleCollector(), MtechTeacher(), RobSteedStrength(), NoSweetTaste(), WhisperTalker(), WaterAllergy(), FearOfOpenSpaces(), SlowerTime(), SourLemonade(), RandomStone(), NoSmile(), MetalTaste(), UncontrollableTremors(), RottenEggSmell(), OwnSweatAllergy(), BirdPhobia(), NoPainSense(), ConstantVertigo(), FireBreather(), NoOpposableThumbs(), InvertedMovement(), EyeContactFaint(), SlowMo(), TremblingLegs(), TremblingArms(), ChronicBackPain(), HormonalRage(), Exhaustion(), Narcolepsy(), Confusion(), UncontrollableCrying(), SpitAllergy(), AlwaysSticky(), SneezingFits(), ButterFingers(), Magnetized(), ChronicBadLuck(), SevereMotionSickness(), AlwaysCold(), BloodPhobia(), NoiseSensitivity(), UncontrollableDancing(), RhymeCommunication(), CompulsiveLying(), ConstantSweating(), Poisoned()]

    
    func getRandomStatusEffect(_ statusEffect: [StatusEffect]) -> [StatusEffect] {
        var randomStats: [StatusEffect] = []
        
        // Loop until we have 3 characters in our result array
        while randomStats.count < 3 {
            
            // Select a random index in the input array
            let randomIndex = Int.random(in: 0..<statusEffect.count)
            
            // Check if the selected character is not already in our result array
            if !randomStats.contains(where: { $0 === statusEffect[randomIndex]}) {
                randomStats.append(statusEffect[randomIndex])
            }
        }
        return randomStats
    }
    
//    For random character
    let characterArray: [Character] = [Superman(), Batman(), SpiderMan(), Wolverine(), WonderWoman(), CaptainAmerica(), HalJordan(), WallyWest(), Hulk(), Daredevil(), DickGrayson(), IronMan(), JeanGrey(), Thor(), DreamOfTheEndless(), Rorschach(), BarbaraGordon(), Thing(), JamesGordon(), Catwoman(), TheSpirit(), ProfessorX(), Raphael(), YorickBrown(), Hellboy(), RickGrimes(), Punisher(), SwampThing(), JohnConstantine(), GreenArrow(), Deadpool(), TimDrake(), NickFury(), JesseCuster(), JudgeDredd(), Spawn(), TheCrow(), DoctorStrange(), Cyclops(), MrFantastic(), SilverSurfer(), Storm(), MartianManhunter(), Hawkeye(), SpiderJerusalem(), HumanTorch(), KittyPryde(), MitchellHundred(), BarryAllen(), BillyBatson(), BlackPanther(), Aquaman(), BuckyBarnes(), ElijahSnow(), JohnStewart(), Hawkman(), TheTick(), Beast(), BoosterGold(), FoneBone(), BlueBeetle(), DashiellBadHorse(), Blade(), RayPalmer(), Gambit(), InvisibleWoman(), HankPym(), IronFist(), ScottPilgrim(), Spectre(), Wildcat(), LukeCage(), JonahHex(), BlackWidow(), Marv(), TheRocketeer(), Namor(), SgtRock(), CaptainBritain(), Nightcrawler(), BlackCanary(), EricOGrady(), KonEl(), KaZar(), BlackLightning(), Michonne(), ReneeMontoya(), SheHulk(), MoonKnight(), GhostRider(), Cerebus(), UsagiYojimbo(), DonnaTroy(), Supergirl(), SavageDragon(), Falcon(), AdamStrange(), Nova(), Wasp(), BabyGroot()]
    
    
    
    func getRandomCharacters(_ characters: [Character]) -> [Character] {
        var randomCharacters: [Character] = []
        
        // Loop until we have 3 characters in our result array
        while randomCharacters.count < 3 {
            
            // Select a random index in the input array
            let randomIndex = Int.random(in: 0..<characters.count)
            
            // Check if the selected character is not already in our result array
            if !randomCharacters.contains(where: { $0 === characters[randomIndex] }) {
                randomCharacters.append(characters[randomIndex])
            }
        }
        return randomCharacters
    }
    //  To call it
    // getRandomCharacters(characterArray)
    
    
    @IBAction func randomElement(_ sender: UIButton) {
   

        let sceneElement = [UIImage(named: "FireCave"),UIImage(named: "Ocean"),UIImage(named: "stormySky"),UIImage(named: "Volcano"),UIImage(named: "Mountain"),UIImage(named: "Plains"), UIImage(named: "ParkingGarage"), UIImage(named: "TimesSquare"), UIImage(named: "Cemetery"), UIImage(named: "OuterSpace"), UIImage(named: "YourMomsHouse"), UIImage(named: "CERN"), UIImage(named: "Swamp"), UIImage(named: "Sewer")]
        let randomImageIndex = Int.random(in: 0..<sceneElement.count)
            let randomImage = sceneElement[randomImageIndex]
            let selectedElement: Element

            switch randomImage?.accessibilityIdentifier {
            case "FireCave":
                selectedElement = .firecave
            case "Ocean":
                selectedElement = .ocean
            case "stormySky":
                selectedElement = .stormySky
            case "Volcano":
                selectedElement = .volcano
            case "Mountain":
                selectedElement = .mountain
            case "Plains":
                selectedElement = .plains
            case "ParkingGarage":
                selectedElement = .parkingGarage
            case "TimesSquare":
                selectedElement = .timesSquare
            case "Cemetery":
                selectedElement = .graveyard
            case "OuterSpace":
                selectedElement = .outerSpace
            case "YourMomsHouse":
                selectedElement = .yourMomsHouse
            case "CERN":
                selectedElement = .CERN
            case "Swamp":
                selectedElement = .swamp
            case "Sewer":
                selectedElement = .sewer
            default:
                selectedElement = .firecave // Default to a known case to avoid runtime errors
            }

            BattleSceneImage.image = randomImage
        }
        
//    BattleSceneImage.image = sceneElement[Int.random(in: 0...13)] //DiceImageView 1 is what the image view is that will be showing fir



    }

    


    

