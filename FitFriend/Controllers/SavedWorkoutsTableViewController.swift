//
//  SavedWorkoutsTableViewController.swift
//  FitFriend
//
//  Created by Christopher Martinez on 11/2/22.
//

import UIKit
import CoreData

class SavedWorkoutsTableViewController: UITableViewController {
    //reference to managed object context core data
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    //Data for table
    var items:[Workout]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //fetch the data from coreData AppDelegate
        fetchWorkout()
        
    }

    //fetch saved workouts from Core Data to display in the table
    func fetchWorkout() {
        do {
            self.items = try context.fetch(Workout.fetchRequest())
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        catch {
            print("couldn't fetch")
        }
    }
    //create swipe action to remove from saved data
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let action = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completionHandler) in
            
            let workoutToRemove = self.items![indexPath.row]
            
            self.context.delete(workoutToRemove)
            
            do {
                try self.context.save()
            }
            catch {
                
            }
            //refetch data to reload table
            self.fetchWorkout()
        }
        
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    // MARK: - Table view data source
    override func tableView(
      _ tableView: UITableView,
      numberOfRowsInSection section: Int
    ) -> Int {
        return items!.count
    }

    override func tableView(
      _ tableView: UITableView,
      cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(
        withIdentifier: "SavedWorkoutItem",
        for: indexPath)
        
        let workout = self.items![indexPath.row]
        cell.textLabel?.text = workout.name
        cell.textLabel?.font = UIFont(name: "Gill Sans", size: 21)
        
      return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
    }

    // MARK: - Table View Delegate
    override func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: Table design configurations
    override func tableView(//adjust cell height
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        return 80
    }

}
