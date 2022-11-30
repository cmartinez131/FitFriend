//
//  ViewController.swift
//  FitFriend
//
//  Created by Christopher Martinez on 11/2/22.
//

import UIKit

class HomeScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
    }
        //maybe i can show all the workouts on the home screen and not have it take the whole screen. i notice a lot of apps have more content on the home screen
    
    @IBAction func getCustomWorkoutPressed() {
        print("Get Custom Workout Pressed")
    }
        
    @IBAction func chooseWorkoutPressed() {
        print("Choose Workout button Pressed")

    }
}

