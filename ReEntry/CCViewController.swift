//
//  CCViewController.swift
//  ReEntry
//
//  Created by Claire Mai on 10/8/20.
//

import UIKit

class CCViewController: UIViewController {
    var locationName = ""

    @IBOutlet weak var CCLabel: UILabel!
    @IBOutlet weak var ResourcesNM: UIButton!
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func ResourcesNM(_ sender: Any) {
        locationName = "community college"
        self.performSegue(withIdentifier: "CCMap", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let mapVC = segue.destination as! MHMapViewController
            mapVC.locationName = locationName
        }
    
     @IBAction func FederalLoansLink(_ sender: Any) {
        if let url = URL(string: "https://studentaid.gov/understand-aid/types/loans") {
            UIApplication.shared.open(url)
        }
     }
    @IBAction func CCInfoLink(_ sender: Any) {
        if let url = URL(string: "https://bigfuture.collegeboard.org/find-colleges/how-to-find-your-college-fit/community-college-faqs") {
            UIApplication.shared.open(url)
        }
    }
    @IBAction func OnlineDegreeLink(_ sender: Any) {
        if let url = URL(string: "https://www.onlineu.com/degrees") {
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
