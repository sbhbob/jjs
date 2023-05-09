//
//  DisplayWinnerViewController.swift
//  GroupCapstone
//
//  Created by Skyler Hope on 4/27/23.
//

import UIKit

class DisplayWinnerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ???label.text = winner.name or sum shit
    }
    
    let player1 = GameManager.shared.player1
    let player2 = GameManager.shared.player2
    let environment = GameManager.shared.battleEnvironment
    
    
//    let winner = GameManager.shared.determineWinner(player1: player1, player2: player2, environment: environment)
    
    // have a label be l
    @IBAction func dismissButtonTapped(_ sender: UIButton) {
        if let viewControllers = navigationController?.viewControllers,
           viewControllers.count >= 5 {
            // Get the view controller four positions back in the stack
            let viewControllerToPopTo = viewControllers[viewControllers.count - 5]
            
            // Pop back to that view controller
            navigationController?.popToViewController(viewControllerToPopTo, animated: true)
        }
    }
}
