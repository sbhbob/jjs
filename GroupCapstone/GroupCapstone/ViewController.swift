//
//  ViewController.swift
//  GroupCapstone
//
//  Created by Skyler Hope on 4/13/23.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func StartBattleButton(_ sender: UIButton) {
        performSegue(withIdentifier: "StartBattleSegue", sender: nil)
    }
}

