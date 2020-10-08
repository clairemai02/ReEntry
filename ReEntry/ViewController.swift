//
//  ViewController.swift
//  ReEntry
//
//  Created by Claire Mai on 10/8/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ReEntryLabel: UILabel!
    @IBOutlet weak var MentalHealthLabel: UIButton!
    @IBOutlet weak var CommunityCollegeLabel: UIButton!
    @IBOutlet weak var HomelessSheltersLabel: UIButton!
    @IBOutlet weak var PublicHousingLabel: UIButton!
    @IBOutlet weak var FoodSheltersLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func MentalHealthButton(_ sender: Any) {
        self.performSegue(withIdentifier: "MHSegue", sender: self)
    }
    @IBAction func CommunityCollegeButton(_ sender: Any) {
        self.performSegue(withIdentifier: "CCSegue", sender: self)
    }
    @IBAction func HomelessSheltersButton(_ sender: Any) {
        self.performSegue(withIdentifier: "HSSegue", sender: self)
    }
    @IBAction func PublicHousingButton(_ sender: Any) {
        self.performSegue(withIdentifier: "PHSegue", sender: self)
    }
    @IBAction func FoodSheltersButton(_ sender: Any) {
        self.performSegue(withIdentifier: "FSSegue", sender: self)
    }
    
}

