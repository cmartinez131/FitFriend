//
//  CurrentWorkoutViewController.swift
//  FitFriend
//
//  Created by Christopher Martinez on 11/16/22.
//

import UIKit


class CurrentWorkoutViewController: UIViewController {

    @IBOutlet weak var WorkoutNameLabel: UILabel!
    
    @IBOutlet weak var workoutDescirptionLabel: UILabel!
    var itemToEdit: WorkoutItem?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View Loaded")
        //navigationItem.largeTitleDisplayMode = .never
        
        //must be able to pass in a WorkoutItem Object
        //screen title must be changed to WorkoutItem object's name
        //place checklistItem's description into text field
        //get all the exercises in the workout
        
       
        
    }

    @IBAction func save() {
        //navigationController?.popViewController(animated: true)
        print("Workout Saved")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
     ->need to do this
    }
    */

}
