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
    
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    //array of workout objects
    var workouts = [WorkoutItem]()
    
    var currentWorkout = WorkoutItem()//save the current workout object in a variable which I can pass to the next screen
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //add workouts to the array to add more workouts

        //MARK: Add workouts to table
//something i can do instead is to just show all the exercises from the api that target a specific muscle
        let fullBodyWorkout = WorkoutItem(name: "Full Body", description: "Most efficent fullbody workout focusing on compound movements. Compount movements target multiple muscle groups.", image: UIImage(named: "fullbody.png"), exercises: ["dumbbell bench press", "barbell deadlift", "dumbbell seated shoulder press", "dumbbell seated bicep curl", "assisted pull-up","barbell bent over row"])//todo: for each string in exercises array, make an api call to get information about that exercise. get by name
        workouts.append(fullBodyWorkout)
        
        
        let lowerBodyWorkout = WorkoutItem(name: "Lower Body", description: "Lower body workout focuses on legs and core only using dumbbells and bodyweight.", image: UIImage(named: "dumbbell goblet squat.png"), exercises: ["jump squat", "dumbbell goblet squat", "walking lunge", "dumbbell single leg split squat", "dumbbell seated calf raise"])
        workouts.append(lowerBodyWorkout)
        
        let upperBodyWorkout = WorkoutItem(name: "Upper Body", description: "Upper body workout focusing on chest, back, shoulders, and core", image: UIImage(named: "barbell standing close grip military press.png"), exercises: ["dumbbell bench press","assisted chest dip (kneeling)", "dumbbell seated shoulder press", "pull up (neutral grip)", "dumbbell bent over row","barbell standing close grip military press"])
        workouts.append(upperBodyWorkout)
        
        let chestWorkout = WorkoutItem(name: "Chest", description: "20 minute workout focused to build bigger and more defined chest.", image: UIImage(named: "dumbbell fly.png"), exercises: ["dumbbell bench press", "dumbbell fly", "dumbbell incline bench press", "cable cross-over variation", "assisted chest dip (kneeling)","barbell incline close grip bench press"])
        workouts.append(chestWorkout)
        
        let backWorkout = WorkoutItem(name: "Back", description: "4 exercises to target every part of back and build back strength", image: UIImage(named: "dumbbell incline row.png"), exercises: ["alternate lateral pulldown", "dumbbell incline row","lower back curl","back extension on exercise ball","assisted parallel close grip pull-up","hyperextension"])
        workouts.append(backWorkout)
        
        let bicepsWorkout = WorkoutItem(name: "Biceps", description: "Feel the Burn and Build massive Biceps", image: UIImage(named: "dumbbell alternate biceps curl.png"), exercises: ["dumbbell alternate biceps curl", "cable hammer curl (with rope)", "dumbbell incline biceps curl", "dumbbell alternate seated hammer curl"])
        workouts.append(bicepsWorkout)
        
        let tricepsWorkout = WorkoutItem(name: "Triceps", description: "Feel the Burn and Build massive arms by building triceps", image: UIImage(named: "barbell lying triceps extension skull crusher.png"), exercises: ["cable high pulley overhead tricep extension", "barbell lying triceps extension skull crusher", "dumbbell close grip press", "dumbbell kickback"])
        workouts.append(tricepsWorkout)
        
        let gluteWorkout = WorkoutItem(name: "Glutes", description: "Grow your Glutes", image: UIImage(named: "barbell good morning.png"), exercises: ["band bent-over hip extension", "barbell full squat", "barbell romanian deadlift","cable standing hip extension", "barbell good morning","dumbbell single leg split squat","hyperextension"])
        workouts.append(gluteWorkout)
        
//        let cardioWorkout = WorkoutItem(name: "Cardio", description: "Increase stamina and cardiovascular health", image: UIImage(named: "running.png"), exercises: [])
//        workouts.append(cardioWorkout)
        
        let HIITWorkout = WorkoutItem(name: "H.I.I.T", description: "High Intensity Interval Training. Periods of fast spurts of intense exercise followed by rest.", image: UIImage(named: "jump rope.png"), exercises: ["wind sprints", "burpee", "dumbbell burpee", "jump rope"])
        workouts.append(HIITWorkout)//do a bicycle workout
        
        let coreWorkout = WorkoutItem(name: "Core", description: "Build a strong core. Building a strong foundation is important for every exercise.", image: UIImage(named: "alternate heel touchers.png"), exercises: ["3/4 sit-up", "alternate heel touchers", "hanging leg hip raise", "hanging oblique knee raise"])
        workouts.append(coreWorkout)
        
        let baseballWorkout = WorkoutItem(name: "Baseball", description: "Increase explosive power with baseball related movemenets usin a medicine ball.", image: UIImage(named: "medicine ball chest pass.png"), exercises: ["medicine ball catch and overhead throw", "medicine ball chest pass", "cable palm rotational row", "barbell full squat"])
        workouts.append(baseballWorkout)//focus on medicine balls
        
        let soccerWorkout = WorkoutItem(name: "Soccer", description: "Increase leg strength, quickness, and agility to kick harder and be more agile on the field.", image: UIImage(named: "ankle circles.png"), exercises: ["dumbbell single leg squat", "dumbbell lunge", "wind sprints", "hamstring stretch", "ankle circles"])
        workouts.append(soccerWorkout)//leg workout
        
        let basketballWorkout = WorkoutItem(name: "Basketball", description: "Increase vertical jump and durability by focusing on explosive leg movements and stretching.", image: UIImage(named: "jump squat.png"), exercises: ["jump squat", "one leg floor calf raise", "hamstring stretch", "dumbbell lunge"])
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
