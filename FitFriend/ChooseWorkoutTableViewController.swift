//
//  ChooseWorkoutTableViewController.swift
//  FitFriend
//
//  Created by Christopher Martinez on 11/2/22.
//

import UIKit
//to do: add protocol
class ChooseWorkoutTableViewController: UITableViewController {

    //maybe make workouts a singleton class
    
    //array of workout objects
    var workouts = [WorkoutItem]()
    
    var currentWorkout = WorkoutItem()//save the current workout object in a variable which I can pass to the next screen
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //question: is it bad practice to put following objects in the WorkoutItem Swift file?
        //add workouts to the array to add more rows
        //todo: create the array of exercises
        
        //appending workout objects which are created in workoutitem.swift
        //maybe i can create a data file to store all the data and created objects

        let fullBodyWorkout = WorkoutItem(name: "Full Body", description: "Most efficent fullbody workout focusing on compound movements", image: UIImage(named: "BenchPressCartoon.png"))
        workouts.append(fullBodyWorkout)
        
        let lowerBodyWorkout = WorkoutItem(name: "Lower Body", description: "Lower body focus on legs and core", image: UIImage(named: "defaultimage.png"))
        workouts.append(lowerBodyWorkout)
        
        let upperBodyWorkout = WorkoutItem(name: "Upper Body", description: "Upper body workout focusing on chest, back, shoulders, and core", image: UIImage(named: "defaultimage.png"))
        workouts.append(upperBodyWorkout)
        
        let chestWorkout = WorkoutItem(name: "Chest", description: "20 minute workout focused to build bigger and more defined chest", image: UIImage(named: "BenchPressCartoon.png"))
        workouts.append(chestWorkout)
        
        let backWorkout = WorkoutItem(name: "Back", description: "4 exercises to target every part of back and build back strength", image: UIImage(named: "defaultimage.png"))
        workouts.append(backWorkout)
        
        let bicepsWorkout = WorkoutItem(name: "Biceps", description: "Feel the Burn and Build massive Biceps", image: UIImage(named: "bicep.png"))
        workouts.append(bicepsWorkout)
        
        let cardioWorkout = WorkoutItem(name: "Cardio", description: "Increase stamina and cardiovascular health", image: UIImage(named: "defaultimage.png"))
        workouts.append(cardioWorkout)
        
        let baseballWorkout = WorkoutItem(name: "Baseball", description: "Increase explosive power with baseball related movemenets", image: UIImage(named: "defaultimage.png"))
        workouts.append(baseballWorkout)
        
        let soccerWorkout = WorkoutItem(name: "Soccer", description: "Increase leg strength, quickness, and agility", image: UIImage(named: "defaultimage.png"))
        workouts.append(soccerWorkout)
        
        let basketballWorkout = WorkoutItem(name: "Basketball", description: "Increase vertical by focusing on explosive leg movements", image: UIImage(named: "defaultimage.png"))
        workouts.append(basketballWorkout)
        
        
    }
    
    
    // MARK: - Table View Data Source
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return workouts.count
    }
    
    override func tableView(//adjust cell height
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        return 160
    }
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "WorkoutItem",
            for: indexPath)
        let workout = workouts[indexPath.row]//workout is a WorkoutItem object
        
        let nameLabel = cell.viewWithTag(1000) as! UILabel
        nameLabel.text = workout.name
        let descriptionLabel = cell.viewWithTag(1001) as! UILabel
        descriptionLabel.text = workout.description
        let workoutImage = cell.viewWithTag(1002) as! UIImageView
        workoutImage.image = workout.image
        
        return cell
    }
    
    
    // MARK: - Table View Delegate
    override func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("cell selected")

        
    }
//    override func prepare(
//        for segue: UIStoryboardSegue,
//        sender: Any?
//    ){
//
//    }

    
//    //Mark: - Navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "DoWorkout"{
//            let controller = segue.destination as! CurrentWorkoutViewController
//            controller.delegate = self
//        }
//    }
//
    
}
