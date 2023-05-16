//
//  DisplayWinnerViewController.swift
//  GroupCapstone
//
//  Created by Skyler Hope on 4/27/23.
//

import UIKit

class DisplayWinnerViewController: UIViewController {
    
    let gameManager = GameManager.shared
    
    
    @IBOutlet weak var howItHappenedLabel: UILabel!
    @IBOutlet weak var playerWinnerLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Hide the back button, because we have a bug rn that wont let us hit the back button cuz if we do the function to determine winner wont work.
        navigationItem.hidesBackButton = true
        
        guard let player1 = gameManager.player1,
              let player2 = gameManager.player2,
              let environment = gameManager.battleEnvironment else {
            print("Error: Could not start game.")
            return
        }
        
        gameManager.startGame()
        
        if let winner = gameManager.winner {
            playerWinnerLabel.text = "The winner is \(winner.name)!"
            let winArr = ["\(winner.name) utterly destoryed their opponent", "\(winner.name) won by curbstomping", "(winning player) won by slapping", "\(winner.name) won", "\(winner.name) won by a landslide...I mean literaly there was a landslide", "\(winner.name) won by their use of cabages", "\(winner.name) dispite their debuff they wrecked the compatition.", "\(winner.name) won by (jiggle physics)...Idk what you expected", "\(winner.name) won by using their brain cuz their smrt", "\(winner.name) won because of their abilities", "\(winner.name) won by distracting them with a spoon", "\(winner.name) wins because", "\(winner.name) ran away...like really far so they win....I think", "\(winner.name) used energy drinks to give them the upperhand", "\(winner.name) won by reciving powers from a popular theme park", "\(winner.name) won because their sneakers were completely better", "\(winner.name) wins because they were they used ideas they got from a certain video game", "\(winner.name) streamed their fight and won because of the support of thier fans", "\(winner.name) learned that they could win by driving this popular car so they did....so they won!", "\(winner.name) struggled but finally ended it all with a pb & j sandwich", "\(winner.name) was tried and tested but won","\(winner.name) atempted to do a really cool backflip and failed however their opponent couldn't stop laughing and died", "\(winner.name) used a rock to win", "\(winner.name) used a laptop as a shield and although it was useless he still some how won", "\(winner.name) has a training montage so he won", "\(winner.name) plot armor! (shhhh that means he can't lose)", "\(winner.name) used the power of friendship to win", "\(winner.name) yelled with a guttural cry to begin the fight and caused fright", "\(winner.name) used thunder clap", "\(winner.name) used cheek clap", "\(winner.name) used flower clap", "\(winner.name) used thunder sniff", "\(winner.name) used thunder boop", "\(winner.name) booped their opoents nose causing confusion so \(winner.name) could sneak the win!", "\(winner.name) used thunder snot", "\(winner.name) used fire ear", "\(winner.name) used thud", "\(winner.name) used shower cap", "\(winner.name) used jiggly physics, it was highly effective", "\(winner.name) used intense stare, it wasn't effective but still for some reason beat their oppoent", "\(winner.name) used water boarding, it's not what you're thinking tho", "\(winner.name) + tacos = win", "\(winner.name) used hot style wings to win", "\(winner.name) used the sadness of developers to make the opponent so sad he gave up", "\(winner.name) + a winning personality = dubs....again not sure how", "\(winner.name) used cry aloud", "\(winner.name) used basic girl to win....again I'm not really sure how but sometimes it just happens", "\(winner.name) used sad eyes but like cute so it distracted their opponent so they could use a haymaker on them", "\(winner.name) used uppercut", "\(winner.name) used clap", "\(winner.name) used powers of a lake. Not sure what that entails but it worked", "\(winner.name) used thot power", "\(winner.name) won by a lot...like a car lot", "\(winner.name) used lighing line", "\(winner.name) used tho shalt maybe pass by without pain but actaully with a lot of pain therefore \(winner.name) won", "\(winner.name) used speach to convince their opponent to follow them instead", "\(winner.name) used their best friend", "\(winner.name) used jokes", "\(winner.name) used a bowling ball to get a strike!", "\(winner.name) used water bottle", "\(winner.name) used thunder clap + lightning eyes to shock for the win", "\(winner.name) banana boat", "\(winner.name) used power of a 1,000 suns!!!", "\(winner.name) used is a hotdog a taco which caused a Existential Crisis in their opponet causing them to give up", "\(winner.name) used I have a lawyer, it was super effective and caused a life time of distrust", "\(winner.name) threw a pie and the other dude slipped on it...Idk how that means \(winner.name) won but he did", "\(winner.name) won by sheer luck", "\(winner.name) won by distracting  their opponent with a cute puppy", "\(winner.name) used cat to scare off their opponent, it was midly effective", "\(winner.name) used dust to make their opponent cry thus beating them by emberessment", "\(winner.name) won by showing of their rad skate skills, they weren't impressive but they still shreded the nar duuuuude", "\(winner.name) slapped a fly straight into their opponent's mouth causing severe discomfort therefore cuasing their opponent to lose", "\(winner.name) won by being comfy in a bean bag chair", "\(winner.name) won have a crazy 97 round game of rock, paper, scissors. (It was supposed to be best 2/3)", "\(winner.name) used \(winner.statusEffect!.name) it was highly effictive", "\(winner.name) used \(winner.statusEffect!.name) it was some how highly effective...leaving there opponent utterly annihilated.. Man who writes these??", "\(winner.name) won by a using their \(winner.statusEffect!.name) to empower a leaf they than threw at their opponent causing them to lose instently", "\(winner.name) worked hard for 10 years of their life to only need their \(winner.statusEffect!.name) to win", "\(winner.name) won, I'm just running out of ideas at this point.", "\(winner.name) used a horse to galently win the day with the use of their \(winner.statusEffect!.name)", "\(winner.name) use a house to galently win the day with the use of their \(winner.statusEffect!.name)", "\(winner.name) tried and attempted to use their \(winner.statusEffect!.name) instead of their \(winner.statusEffect!.name) so they some how used both and won that way", "\(winner.name) lost....it shows he won but in reality he lost...just so you know.", "\(winner.name) use \(winner.statusEffect!.name) kick it won.", "\(winner.name) used \(winner.statusEffect!.name) clap, it was effective", "\(winner.name) used crying \(winner.statusEffect!.name) it was weirdly effective", "\(winner.name) took a really long nap so he was ready to use \(winner.statusEffect!.name) to their advantage", "\(winner.name) won cuz their opponent was a nerd", "\(winner.name) won but in the past", "Fight was over in 2 seconds and \(winner.name) won", "Crazy amazing anime dual happend in the blink of an eye and \(winner.name) was the last one standing when the dust cleared", "\(winner.name) had a great time on a tandem bicycle. Woot woot!"]
            howItHappenedLabel.text = winArr.randomElement()
            print(howItHappenedLabel.text!)
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
