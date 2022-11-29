//
//  ExerciseItem.swift
//  FitFriend
//
//  Created by Christopher Martinez on 11/16/22.
//

import Foundation
import UIKit

struct ExerciseItem {//struct vs class
    //exercise item will be instantiated with multiple parameters, name, image, description, number of reps, number of sets, muscle group targets
    var name = ""
    var image: UIImage?
    var description: String
    var numSets = 0
    var numReps = 0
    var targets: [String] = []
    //https://developer.apple.com/documentation/swift/array
    
}
let benchPressStrength = ExerciseItem(name: "Bench Press", image: UIImage(named: "BenchPressCartoon.png"), description: "Press the barbell up in the air", numSets: 5, numReps: 5, targets: ["Chest", "Shoulders", "Triceps"])

let benchPressSize = ExerciseItem(name: "Bench Press", image: UIImage(named: "BenchPressCartoon.png"), description: "Press the barbell up in the air", numSets: 4, numReps: 10, targets: ["Chest", "Shoulders", "Triceps"])

let bicepCurl = ExerciseItem(name: "Bicep Curl", image: UIImage(named: "defaultimage.png"), description: "Curl the dumbell up and down", numSets: 4, numReps: 10, targets: ["Bicep"])

let squatStrength = ExerciseItem(name: "Barbell Squat", image: UIImage(named: "defaultimage.png"), description: "Brace your core, squat down without letting your knees pass your toes", numSets: 4, numReps: 5, targets: ["Hamstrings", "Quads", "Glutes"])


//use api:
//get list by name (exercise name) -> get the json data which given the name, you get the bodypart targetted, equipment needed, gif url, target
struct Exercise {
    var name = ""   //string which is the exercise name. ex: "forward jump", "cable pushdown", "forward lunge (male)"
    var bodyPart = ""
    var equipment = ""  //ex: "body weight", cable, barbell
    var gifUrl = ""     //ex: "http://d205bpvrqc9yn1.cloudfront.net/0201.gif", "http://d205bpvrqc9yn1.cloudfront.net/1472.gif"
    var muscleTargeted = ""
    
    func getExerciseData(name: String) {//take in name of exercise, return data
        
    }
}
