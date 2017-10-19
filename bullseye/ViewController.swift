//
//  ViewController.swift
//  bullseye
//
//  Created by Neil Houselander on 17/10/2017.
//  Copyright © 2017 Neil Houselander. All rights reserved.
//

import UIKit

//to do
//UI
//DONE add labels for instructions, score, round
//DONE add slider with labels at either end
//DONE add button hit me
//customise slider
//add resrt & information button

//code
//DONE generate random number
//DONE set up slider so tracks values 1 - 100
//DONE set up variables to hold score & round number
//DONE add code to compare slider value to random number & assign score
//DONE when hit me tocuhed comparison happens - popup with scoer & add to running score
//reset game when reset hit



class ViewController: UIViewController {
    
    @IBOutlet weak var theSliderLabel: UISlider!
    @IBOutlet weak var theTargetToGuessLabel: UILabel!
    @IBOutlet weak var theScoreLabel:UILabel!
    @IBOutlet weak var roundNumberLabel: UILabel!
    
    
    var currentValueSlider: Int = 0
    var targetValue : Int = 0
    var score: Int = 0
    var round: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newGame()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startNewRound() {
        
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValueSlider = 50
        theSliderLabel.value = Float(currentValueSlider)
        round += 1
        updateLabels()

    }
    
    func updateLabels() {
        
        theTargetToGuessLabel.text = String(targetValue)
        theScoreLabel.text = String(score)
        roundNumberLabel.text = String(round)
    }
    
    @IBAction func showAlert() {
        
        let theDifference: Int = abs(targetValue - currentValueSlider)
        let points = 100 - theDifference
        let title: String
        var pointsBonus = 0
        
        if theDifference == 0 {
            title = "Perfect! \n100 Bonus Points"
            pointsBonus = 100
            
        } else if theDifference < 5 {
            title = "You almost had it! \n50 Bonus Points"
            pointsBonus = 50
            
        } else if theDifference < 10 {
            title = "Pretty Good... \n25 Bonus Points"
            pointsBonus = 25
            
        } else {
            title = "Not Even Close !"
            pointsBonus = 0
        }
        
        score = score + points + pointsBonus
        
        let message = "Target:\(targetValue) \nYou hit: \(currentValueSlider) \nPoints: \(points) + Bonus: \(pointsBonus) \nTotal: \(pointsBonus+points)"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Next Round", style: .default, handler: {
            
            thisIsAClosure in
            self.startNewRound()
        })
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func sliderMoved(_ theSlider: UISlider) {
        
        currentValueSlider = lroundf(theSlider.value)
        
        print("the value of the slider is now \(currentValueSlider)")
        
    }
    
    @IBAction func startOver() {
        
        newGame()
        
    }
    
    func newGame() {
        
        currentValueSlider = lroundf(theSliderLabel.value)
        score = 0
        round = 0
        startNewRound()
           
    }

}

