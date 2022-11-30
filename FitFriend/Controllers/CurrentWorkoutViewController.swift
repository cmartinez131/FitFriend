//
//  CurrentWorkoutViewController.swift
//  FitFriend


import UIKit
import Foundation

//probably delete this view controller because i created a table view to make it more readable

class CurrentWorkoutViewController: UIViewController {

    //@IBOutlet weak var WorkoutNameLabel: UILabel!
    
    @IBOutlet weak var workoutDescirptionLabel: UILabel!


    @IBAction func startButtonPressed(_ sender: UIButton) {//allow user to start workout
        print("started \(currentWorkout.name) workout")
        sender.isEnabled = false //dont allow user to start workout again
        
        
        //change the function of the button to show next exercise and change the text to show "next exercise"
        
    }
    
    var currentWorkout = WorkoutItem()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        print("View Loaded")
        
        print("Current workout:  \(currentWorkout.name).")
        //navigationItem.largeTitleDisplayMode = .never
        //WorkoutNameLabel.text = currentWorkout.name
        workoutDescirptionLabel.text = currentWorkout.description
        navigationItem.title = currentWorkout.name

//        let headers = [
//            "X-RapidAPI-Key": "724af047ddmshe330f0f888257e2p1c9e38jsn64a47f4f72b2",
//            "X-RapidAPI-Host": "exercisedb.p.rapidapi.com"
//        ]
//
//        let request = NSMutableURLRequest(url: NSURL(string: "https://exercisedb.p.rapidapi.com/exercises/target/biceps")! as URL,
//                                                cachePolicy: .useProtocolCachePolicy,
//                                            timeoutInterval: 10.0)
//        request.httpMethod = "GET"
//        request.allHTTPHeaderFields = headers
//
//        let session = URLSession.shared
//        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
//            if (error != nil) {
//                print(error)
//            } else {
//                let httpResponse = response as? HTTPURLResponse
//                print(httpResponse)
//
//
//            }
//        })
//
//        dataTask.resume()
        
        
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
