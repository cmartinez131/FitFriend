//
//  CalulateBMIViewController.swift
//  FitFriend
//
//  Created by Christopher Martinez on 11/19/22.
//

import UIKit

class CalulateBMIViewController: UIViewController {

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    var bmi: Float?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func heightSliderchanged(_ sender: UISlider) {//set the slider label to the slider value
        let height = String(format: "%.0f", heightSlider.value)//formated to no decimal value
        heightLabel.text = "\(height) inches"
        print(heightSlider.value)
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let weight = String(format: "%.0f", weightSlider.value)
        weightLabel.text = "\(weight) pounds"
        print(weightSlider.value)
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        bmi = (weight*703)/((height*height))
        self.performSegue(withIdentifier: "getRecommendation", sender: self)
        
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "getRecommendation" {
            let destinationVC = segue.destination as? RecommendationViewController
            destinationVC?.bmi = bmi
        }
    }
    

}
