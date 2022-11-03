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

    
    @IBAction func getCustomWorkoutPressed() {
        print("Get Custom Workout Pressed")
    }
    
    
    @IBAction func chooseWorkoutPressed() {
        print("Choose Workout button Pressed")
        
    }
    
    
}

