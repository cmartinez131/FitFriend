//
//  WorkoutViewController.swift
//  FitFriend
//
//  Created by Christopher Martinez on 11/29/22.
//

import UIKit

class WorkoutViewController: UITableViewController {
    
    //reference to the object that was passed through the segue
    var currentWorkout: WorkoutItem!
    
    
    let cellIdentifier = "DetailCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        title = currentWorkout.name
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        print(currentWorkout.name)
        print(currentWorkout.description)
        print("Exercises:  \( currentWorkout.exercises)")
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return 5
    }
    
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: cellIdentifier, for: indexPath)
        
        //create a label through code
        //cell.textLabel!.text = "List \(indexPath.row)"
        //configureing current workout screen
        let detailLabel = cell.textLabel!
        detailLabel.text = "List \(indexPath.row)"
        if indexPath.row == 0 {
            detailLabel.text = "Description:  \(currentWorkout.description)"
            detailLabel.numberOfLines = 0
            
        } else if indexPath.row == 1 {
            detailLabel.text = "Exercises:  \(currentWorkout.exercises)"
            detailLabel.backgroundColor = UIColor.cyan
            
        } else if indexPath.row == 2 {
            detailLabel.text = "This is row: \(indexPath.row)"
            
        } else if indexPath.row == 3 {
            detailLabel.text = "This is row: \(indexPath.row)"
            
        } else if indexPath.row == 4 {
            detailLabel.text = "This is row: \(indexPath.row)"
        }
        
        
        
        
        //        let detailLabel = cell.viewWithTag(2000) as! UILabel
        //
        //        detailLabel.text = "List \(indexPath.row)"
        
        
        
        return cell
    }
    
    override func tableView(//adjust cell height
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        return 50
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
    }
}
