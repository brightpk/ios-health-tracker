//
//  TrackTableViewController.swift
//  PhakamadS_MilosavljevicM_HealthTracker
//
//  Created by Bright Phakamad on 3/8/20.
//  Copyright © 2020 Marko Milosavljevic. All rights reserved.
//

import UIKit

let trackTopics = [
    "Breakfast",
    "Lunch",
    "Dinner",
    "Water",
    "Exersice"
]

let meal1 = Meal(food: "oatmeal", mealType: .breakfast, amount: 1, calories: 300)
let meal2 = Meal(food: "banana", mealType: .breakfast, amount: 1, calories: 200)
let meal3 = Meal(food: "Coffee", mealType: .breakfast, amount: 1, calories: 180)
let meal4 = Meal(food: "chicken sandwich", mealType: .lunch, amount: 1, calories: 520)
let meal5 = Meal(food: "Steak", mealType: .dinner, amount: 1, calories: 400)
let meal6 = Meal(food: "tuna salad", mealType: .dinner, amount: 1, calories: 400)

 var breakfastMeals : [Meal]? = [ meal1, meal2, meal3 ]
//var breakfastMeals : [Meal]? = [ ]
var lunchMeals : [Meal]? = [ meal4 ]
var dinnerMeals : [Meal]? = [ meal5, meal6]

class TrackTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return topics.count
    }

//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let trackTopic = trackTopics[indexPath.row]
//        let cell = tableView.dequeueReusableCell(withIdentifier: trackTopic.lowercased(), for: indexPath)
//
//        // Configure the cell...
//        cell.textLabel?.text = trackTopics[indexPath.row]
//        return cell
//    }
    

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


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        var sentTopic: [String : String ] = [:]
        
        if let indexPath = self.tableView.indexPathForSelectedRow {
  
            if let mealViewController = segue.destination as? MealViewController {
                
                if indexPath.row == 0 {
                    sentTopic["Breakfast"] = topics[indexPath.row]
                    mealViewController.receivedTopic = sentTopic
                    mealViewController.receivedMeals = breakfastMeals
                    
                } else if indexPath.row == 1 {
                    sentTopic["Lunch"] = topics[indexPath.row]
                    mealViewController.receivedTopic = sentTopic
                    mealViewController.receivedMeals = lunchMeals
                    
                } else if indexPath.row == 2 {
                    sentTopic["Dinner"] = topics[indexPath.row]
                    mealViewController.receivedTopic = sentTopic
                    mealViewController.receivedMeals = dinnerMeals
                    
                }
            } else if let waterViewController = segue.destination as? WaterViewController {
                if indexPath.row == 3 {
                        sentTopic["Water"] = topics[indexPath.row]
                        waterViewController.receivedTopic = sentTopic
                }
                
            } else if let exerciseViewController = segue.destination as? ExerciseViewController {
                if indexPath.row == 4 {
                        sentTopic["Exercise"] = topics[indexPath.row]
                        exerciseViewController.receivedTopic = sentTopic
                }
                
            }
            
         }
        
    
    }
    

}
