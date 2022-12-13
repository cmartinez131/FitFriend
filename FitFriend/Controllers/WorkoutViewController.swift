//
//  WorkoutViewController.swift
//  FitFriend
//

import UIKit
import Foundation
import CoreData

// MARK: Protocol
protocol WorkoutViewControllerDelegate: AnyObject {
    func workoutViewControllerDidCancel(
        _ controller: WorkoutViewController)
    
}

class WorkoutViewController: UITableViewController {
    var currentWorkout: WorkoutItem!
    var exercisesIndexCounter = 0
    
    //reference to managed object context so we can interact with Core Data
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    //save current workout in Core Data
    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        print("save Button tapped")
        
        //create new Workout object
        let newWorkout = Workout(context: self.context)
        newWorkout.name = currentWorkout.name
        newWorkout.desc = currentWorkout.description
        
        //save workout into core data
        do {
            try self.context.save()
        }
        catch {
            
        }
        sender.isEnabled = false
        
        
    }
    
    @IBAction func cancel() {
        delegate?.workoutViewControllerDidCancel(self)

        navigationController?.popViewController(animated: true)
    }
    
    
    
    weak var delegate: WorkoutViewControllerDelegate?
    
    let cellIdentifier = "DetailCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = currentWorkout.name
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        print(currentWorkout.name)
        print(currentWorkout.description)
        print("Exercises:  \( currentWorkout.exercises)")
        
        
        // MARK: API Call
        
        
        
        //api call to get all exercises
        
        //        let headers = [
        //            "X-RapidAPI-Key": "724af047ddmshe330f0f888257e2p1c9e38jsn64a47f4f72b2",
        //            "X-RapidAPI-Host": "exercisedb.p.rapidapi.com"
        //        ]
        //
        //        let request = NSMutableURLRequest(url: NSURL(string: "https://exercisedb.p.rapidapi.com/exercises")! as URL,
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
        //            }
        //        })
        //
        //        dataTask.resume()
        
    }
    
    // MARK: - Table view data source
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return currentWorkout.exercises.count + 2   //+ 2 accounts for the first 2 rows in table which are not exercises yet
    }
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: cellIdentifier, for: indexPath)
        var exerciseName: String
        
        //configureing current workout screen
        let detailLabel = cell.textLabel!
        detailLabel.numberOfLines = 0
        detailLabel.font = UIFont(name: "Gill Sans", size: 21)
        if indexPath.row == 0 {
            detailLabel.text = "\(currentWorkout.description)"
            
        } else if indexPath.row == 1 {
            detailLabel.text = "Do each folowing exercise for 3 sets of 10 reps"
            
        } else  {
            exerciseName = currentWorkout.exercises[exercisesIndexCounter] //string of current exercise name
            detailLabel.text = "\(exerciseName)"
            exercisesIndexCounter += 1
            
            let exerciseImage = cell.imageView!
            
            exerciseImage.image = UIImage(named: "\(exerciseName).png")
            
        }
        return cell
    }
    
    override func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("cell selected")
    }
    
    // MARK: Table design configurations
    override func tableView(//adjust cell height
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
    }
}
