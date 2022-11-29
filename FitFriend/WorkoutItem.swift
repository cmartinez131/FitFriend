//
//  WorkoutItem.swift
//  FitFriend
//
//  Created by Christopher Martinez on 11/16/22.
//

import Foundation
import UIKit

struct WorkoutItem {//struct vs class?
    var name = ""
    var description = ""
    var image: UIImage?
    var exercises = [ExerciseItem]()//list of exercise items
    
}


var savedWorkouts = [WorkoutItem]()     //array to store saved workouts
var savedExercises = [ExerciseItem]()   //array to store saved exercises


