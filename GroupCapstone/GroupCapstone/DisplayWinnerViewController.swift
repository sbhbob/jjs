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
        determineWinner(player1: GameManager().player1!.character, player2: GameManager().player2!.character, environment: GameManager().element!)
        // Do any additional setup after loading the view.
    }
    
    func randomWin(arr: [String]) -> String? {
        guard !arr.isEmpty else { return nil }
       return arr.randomElement()
    }
    
    func determineWinner(player1: Character, player2: Character, environment: Element) -> Character? {
        guard player1.statusEffect != nil else { return nil }
        guard player2.statusEffect != nil else { return nil }
        guard !player1.name.isEmpty else { return nil }
        guard !player2.name.isEmpty else { return nil }

        var player1PL = player1.powerLevel
        player1PL += player1.statusEffect!.powerLevel
        if environment == player1.element {
            player1PL += 10
        }
        
        var player2PL = player2.powerLevel
        player2PL += player2.statusEffect!.powerLevel
        if environment == player2.element {
            player2PL += 10
        }
        
        if player1PL > player2PL {
            return player1
        }
        else if player1PL < player2PL {
            return player2
        }
        else {
            return nil
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
