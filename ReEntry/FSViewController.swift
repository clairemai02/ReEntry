//
//  FSViewController.swift
//  ReEntry
//
//  Created by Claire Mai on 10/8/20.
//

import UIKit

class FSViewController: UIViewController {
    var locationName = ""
    @IBOutlet weak var FSLabel: UILabel!
    @IBOutlet weak var ResourcesNM: UIButton!
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func ResourcesNM(_ sender: Any) {
        locationName = "food pantry"
        self.performSegue(withIdentifier: "FSMap", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let mapVC = segue.destination as! MHMapViewController
            mapVC.locationName = locationName
        }
    
    @IBAction func hungerHotline(_ sender: Any) {
        if let url = URL(string: "https://www.fns.usda.gov/partnerships/national-hunger-clearinghouse#:~:text=By%20Phone%3A%20Call%20the%20USDA,services%20available%20near%20your%20location") {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func foodPantry(_ sender: Any) {
        if let url = URL(string: "https://www.salvationarmyusa.org/usn/plugins/gdosCenterSearch?start=1") {
            UIApplication.shared.open(url)
        }
    }
    @IBAction func foodBank(_ sender: Any) {
        if let url = URL(string: "https://www.feedingamerica.org/find-your-local-foodbank") {
            UIApplication.shared.open(url)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
