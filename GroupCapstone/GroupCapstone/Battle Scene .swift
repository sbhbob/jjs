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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Hide the back button, because we have a bug rn that wont let us hit the back button cuz if we do the function to determine winner wont work.
        navigationItem.hidesBackButton = true
    }
    
    
    @IBAction func alertToPickSceneElement(_ sender: Any) {
        if GameManager.shared.battleEnvironment == nil {
            // Show an alert asking the user to select a character first
            let alert = UIAlertController(title: "Smack That Button!", message: "Please smack that Pick Scene of Battle button! If you don't, than what's the point?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }
    }
    
    
    @IBAction func randomElement(_ sender: UIButton) {
        let sceneElements: [SceneElement] = [
            SceneElement(image: UIImage(named: "FireCave")!, element: .firecave),
            SceneElement(image: UIImage(named: "Ocean")!, element: .ocean),
            SceneElement(image: UIImage(named: "stormySky")!, element: .stormySky),
            SceneElement(image: UIImage(named: "Volcano")!, element: .volcano),
            SceneElement(image: UIImage(named: "Mountain")!, element: .mountain),
            SceneElement(image: UIImage(named: "Plains")!, element: .plains),
            SceneElement(image: UIImage(named: "ParkingGarage")!, element: .parkingGarage),
            SceneElement(image: UIImage(named: "TimesSquare")!, element: .timesSquare),
            SceneElement(image: UIImage(named: "Cemetery")!, element: .graveyard),
            SceneElement(image: UIImage(named: "OuterSpace")!, element: .outerSpace),
            SceneElement(image: UIImage(named: "YourMomsHouse")!, element: .yourMomsHouse),
            SceneElement(image: UIImage(named: "CERN")!, element: .CERN),
            SceneElement(image: UIImage(named: "Swamp")!, element: .swamp),
            SceneElement(image: UIImage(named: "Sewer")!, element: .sewer)]
        
        if GameManager.shared.battleEnvironment == nil {
            
            let randomIndex = Int.random(in: 0..<sceneElements.count)
            let randomImage = sceneElements[randomIndex].image
            let selectedElement = sceneElements[randomIndex].element
            
            //        Should hold the element to then use in determine winner func
            GameManager.shared.battleEnvironment = selectedElement
            
            print(selectedElement)
            startCyclingImages(imageArray: sceneElements.map { $0.image }, randomImageIndex: randomIndex)
        }
        
        // If there's already a battle environment, do nothing
        else {
            return
        }
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
}

