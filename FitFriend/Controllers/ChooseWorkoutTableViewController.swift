//
//  ChooseWorkoutTableViewController.swift
//  FitFriend
//
//  Created by Christopher Martinez on 11/2/22.
//

import UIKit

class ChooseWorkoutTableViewController: UITableViewController, WorkoutViewControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: - Workout ViewController Delegates
    //pops the view cntroller, responsibily is on the delegate
    func workoutViewControllerDidCancel(_ controller: WorkoutViewController) {
        navigationController?.popViewController(animated: true)
    }
    
    //array of workout objects
    var workouts = [WorkoutItem]()
    
    var currentWorkout = WorkoutItem()//save the current workout object in a variable which I can pass to the next screen
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //add workouts to the array to add more rows
        //maybe i can create a data file to store all the data and created objects
        //MARK: Add workouts to table

        let fullBodyWorkout = WorkoutItem(name: "Full Body", description: "Most efficent fullbody workout focusing on compound movements", image: UIImage(named: "fullbody.png"), exercises: ["squat", "deadlift", "dumbbell bench seated press", "dumbbell biceps curl"])//for each string in exercises array, make an api call to get information about that exercise
        workouts.append(fullBodyWorkout)
        
        
        let lowerBodyWorkout = WorkoutItem(name: "Lower Body", description: "Lower body workout focuses on legs and core only using dumbbells and bodyweight", image: UIImage(named: "gobletsquat.png"), exercises: ["jump squat", "dumbbell goblet squat", "walking lunge", "dumbbell single leg split squat", "dumbbell seated calf raise"])
        workouts.append(lowerBodyWorkout)
        
        let upperBodyWorkout = WorkoutItem(name: "Upper Body", description: "Upper body workout focusing on chest, back, shoulders, and core", image: UIImage(named: "upperbody.png"), exercises: ["weighted bench dip", "barbell squat", "overhead barbell press", "seated lat pull down", "bent over rows"])
        workouts.append(upperBodyWorkout)
        
        let chestWorkout = WorkoutItem(name: "Chest", description: "20 minute workout focused to build bigger and more defined chest", image: UIImage(named: "pecfly.png"), exercises: ["dumbbell bench press", "machine pec fly", "dumbbell pec fly", "incline dumbbell press", "cable crossover", "weighted dips"])
        workouts.append(chestWorkout)
        
        let backWorkout = WorkoutItem(name: "Back", description: "4 exercises to target every part of back and build back strength", image: UIImage(named: "backgif.png"))
        workouts.append(backWorkout)
        
        let bicepsWorkout = WorkoutItem(name: "Biceps", description: "Feel the Burn and Build massive Biceps", image: UIImage(named: "bicep.png"), exercises: [])
        workouts.append(bicepsWorkout)
        
        let tricepsWorkout = WorkoutItem(name: "Triceps", description: "Feel the Burn and Build massive arms by building triceps", image: UIImage(named: "triceps.png"), exercises: ["overhead tricep extension", "skull crusher", "close grip bench press", "tricep dumbbell kickback"])
        workouts.append(tricepsWorkout)
        
        let gluteWorkout = WorkoutItem(name: "Glutes", description: "Grow your Glutes", image: UIImage(named: "goodmorning.png"), exercises: [])
        workouts.append(gluteWorkout)
        
        let cardioWorkout = WorkoutItem(name: "Cardio", description: "Increase stamina and cardiovascular health", image: UIImage(named: "running.png"), exercises: [])
        workouts.append(cardioWorkout)
        
        let HIITWorkout = WorkoutItem(name: "H.I.I.T", description: "High Intensity Interval Training. Periods of fast spurts of intense exercise followed by rest.", image: UIImage(named: "hiit.png"), exercises: [])
        workouts.append(HIITWorkout)//do a bicycle workout
        
        let coreWorkout = WorkoutItem(name: "Core", description: "Build a strong core. Building a strong foundation is important for every exercise.", image: UIImage(named: "abs.png"), exercises: [])
        workouts.append(coreWorkout) //bodyweight abs workout
        
        let baseballWorkout = WorkoutItem(name: "Baseball", description: "Increase explosive power with baseball related movemenets", image: UIImage(named: "ballthrow.png"), exercises: ["medicine ball throw", "medicine ball rotational throw", "barbell squat"])
        workouts.append(baseballWorkout)//focus on medicine balls
        
        let soccerWorkout = WorkoutItem(name: "Soccer", description: "Increase leg strength, quickness, and agility", image: UIImage(named: "lunge.png"), exercises: ["single leg squat", "side lunges", "sprint", "box squat"])
        workouts.append(soccerWorkout)//leg workout
        
        let basketballWorkout = WorkoutItem(name: "Basketball", description: "Increase vertical by focusing on explosive leg movements", image: UIImage(named: "jumpsquat.png"), exercises: ["jump squat", "one leg floor calf raise", "hamstring stretch"])
        //, exercises: ["jump squat", "one leg floor calf raise"]
        workouts.append(basketballWorkout)//explosiveness focus on legs and core
        
        
    }
    
    //maybe get a random workout that targets those muscles, using the api
    
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
    
    //configure current table cell
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
        UserDefaults.standard.set(
            indexPath.row,
            forKey: "ChecklistIndex")
        tableView.deselectRow(at: indexPath, animated: true)
        print("cell selected")
        //set the current workout to the workout chosen
        
        currentWorkout = workouts[indexPath.row]
        print(currentWorkout)
        performSegue(withIdentifier: "ShowWorkout", sender: nil)

        //how can i use the exercise data api?
        //-> get the gifs
    }
    
    //send workout item selected through the segue
    //pass reference to the current workout object to the destination VC 
    override func prepare(
        for segue: UIStoryboardSegue,
        sender: Any?
    ){
        if segue.identifier == "ShowWorkout" {
            let destinationVC = segue.destination as! WorkoutViewController
            //set the next screen's current workout to the chosen workout
            destinationVC.currentWorkout = currentWorkout
        }
    }

    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
    }
    
    // MARK: - Navigation Controller Delegates
    func navigationController(
      _ navigationController: UINavigationController,
      willShow viewController: UIViewController,
      animated: Bool
    ) {
      // Was back button tapped?
      if viewController === self {
        UserDefaults.standard.set(-1, forKey: "WorkoutIndex")
      }
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//      super.viewDidAppear(animated)
//
//      navigationController?.delegate = self
//
//      let index = UserDefaults.standard.integer(
//        forKey: "WorkoutIndex")
//      if index != -1 {
//        let workout = dataModel.lists[index]
//        performSegue(
//          withIdentifier: "WorkoutIndex",
//          sender: workout)
//      }
//    }

    
    
}
