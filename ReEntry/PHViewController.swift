//
//  PHViewController.swift
//  ReEntry
//
//  Created by Claire Mai on 10/8/20.
//

import UIKit

class PHViewController: UIViewController {
    
    var locationName = ""
    @IBOutlet weak var PHLabel: UILabel!
    @IBOutlet weak var ResourcesNM: UIButton!
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func ResourcesNM(_ sender: Any) {
        locationName = "public housing"
        self.performSegue(withIdentifier: "PHMap", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let mapVC = segue.destination as! MHMapViewController
            mapVC.locationName = locationName
        }
    
    @IBAction func section8(_ sender: Any) {
        if let url = URL(string: "https://www.hud.gov/topics/housing_choice_voucher_program_section_8") {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func affordableHousing(_ sender: Any) {
        if let url = URL(string: "https://www.usa.gov/finding-home") {
            UIApplication.shared.open(url)
        }
    }
    
     @IBAction func federalHousing(_ sender: Any) {
        if let url = URL(string: "https://www.hud.gov/topics/rental_assistance/phprog") {
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
