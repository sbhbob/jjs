//
//  DisplayWinnerViewController.swift
//  GroupCapstone
//
//  Created by Skyler Hope on 4/27/23.
//

import UIKit

class DisplayWinnerViewController: UIViewController {

    let gameManager = GameManager.shared

    @IBOutlet weak var playerWinnerLabel: UILabel!
    override func viewDidLoad() {
           super.viewDidLoad()

           guard let player1 = gameManager.player1,
                 let player2 = gameManager.player2,
                 let environment = gameManager.battleEnvironment else {
               print("Error: Could not start game.")
               return
           }

           gameManager.startGame()

           if let winner = gameManager.winner {
               playerWinnerLabel.text = "The winner is \(winner.name)!"
               // Set label text to winner's name
           } else {
               playerWinnerLabel.text = "It's a tie!...some how, we are impressed you did this"
               // Set label text to indicate tie
           }
       }
    
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
