//
//  Battle Scene .swift
//  GroupCapstone
//
//  Created by Junne Murdock on 4/18/23.
//

import Foundation
import UIKit

struct SceneElement {
    let image: UIImage
    let element: Element
}

class BattleSceneViewController: UIViewController {
    @IBOutlet weak var BattleSceneImage: UIImageView!
    
    @IBAction func randomElement(_ sender: UIButton) {
        let sceneElements: [SceneElement] = [
            SceneElement(image: UIImage(named: "10")!, element: .firecave),
            SceneElement(image: UIImage(named: "Ocean")!, element: .ocean),
            SceneElement(image: UIImage(named: "stormySky")!, element: .stormySky),
            SceneElement(image: UIImage(named: "Volcano")!, element: .volcano),
            SceneElement(image: UIImage(named: "Mountain")!, element: .mountain),
            SceneElement(image: UIImage(named: "Plains")!, element: .plains),
            SceneElement(image: UIImage(named: "ParkingGarage")!, element: .parkingGarage),
            SceneElement(image: UIImage(named: "TimesSquare")!, element: .timesSquare),
            SceneElement(image: UIImage(named: "Cemetery ")!, element: .graveyard),
            SceneElement(image: UIImage(named: "OuterSpace")!, element: .outerSpace),
            SceneElement(image: UIImage(named: "YourMomsHouse")!, element: .yourMomsHouse),
            SceneElement(image: UIImage(named: "CERN")!, element: .CERN),
            SceneElement(image: UIImage(named: "Swamp")!, element: .swamp),
            SceneElement(image: UIImage(named: "Sewer")!, element: .sewer)
        ]


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

        let randomIndex = Int.random(in: 0..<sceneElements.count)
        let randomImage = sceneElements[randomIndex].image
        let selectedElement = sceneElements[randomIndex].element

        
        print(selectedElement)
        startCyclingImages(imageArray: sceneElements.map { $0.image }, randomImageIndex: randomIndex)
    }
    
    func startCyclingImages(imageArray: [UIImage], randomImageIndex: Int) {
        var imageIndex = (randomImageIndex + 1) % imageArray.count
        var timer: Timer?
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            
            // Update the image displayed by the UIImageView
            self.BattleSceneImage.image = imageArray[imageIndex]
            
            // Check if the current image is the one you want to stop at
            if self.shouldStopCycling(currentImageIndex: imageIndex, targetImageIndex: randomImageIndex) {
                timer?.invalidate()
                timer = nil
            } else {
                imageIndex = (imageIndex + 1) % imageArray.count
            }
        }
    }

    
    func shouldStopCycling(currentImageIndex: Int, targetImageIndex: Int) -> Bool {
        // Stop when the current image index is the target image index
        return currentImageIndex == targetImageIndex
    }







