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
        // Do any additional setup after loading the view.
        if bmi! < 18.5 {
            recommendationLabel.text = "You are underweight, do some weight training to build muscle"
        } else
        if bmi! <= 30 {
            recommendationLabel.text = "You have a healthy BMI. Do some weight training with moderate cardio"
        }
        else if bmi! > 25 {
            recommendationLabel.text = "You are overweight. Focus on cardio to slim down with some added weight training"
        }
    }
}
