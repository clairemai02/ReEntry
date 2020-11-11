//
//  MHViewController.swift
//  ReEntry
//
//  Created by Claire Mai on 10/8/20.
//

import UIKit

class MHViewController: UIViewController {
    var locationName = ""

    @IBOutlet weak var ResourcesNM: UIButton!
    @IBOutlet weak var MHLabel: UILabel!
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func ResourcesNM(_ sender: Any) {
        locationName = "mental health facility"
        self.performSegue(withIdentifier: "MHmap", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let mapVC = segue.destination as! MHMapViewController
            mapVC.locationName = locationName
        }
    
    
     @IBAction func MHMapsButton(_ sender: Any) {
        
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
