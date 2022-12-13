//
//  RecommendationViewController.swift
//  FitFriend
//
//  Created by Christopher Martinez on 11/19/22.
//

import UIKit

class RecommendationViewController: UIViewController {
    
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var recommendationLabel: UILabel!
    
    var bmi: Float?
    var recommendation: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bmiLabel.text = String(format: "%.2f", bmi!)//round string to 2 decimal places
        print(bmi!)
        if bmi! < 18.5 {
            recommendationLabel.text = "You are underweight, Do our full body workout which focuses on compound movements and muscle growth. Focus on heavy weights to build muscle."
        } else
        if bmi! <= 30 {
            recommendationLabel.text = "You have a healthy BMI. Do some weight training with moderate cardio to build muscle. We recommend full body workout or targetted muscle workouts."
        }
        else if bmi! > 25 {
            recommendationLabel.text = "Your BMI is high so you are overweight. Try out High Intensity Interval Training (H.I.I.T) workout to focus on calories burnt. Also try the full body workout to maximize calories burnt."
        }
    }
}
