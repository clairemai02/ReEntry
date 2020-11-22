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
    @IBOutlet weak var NationalInstituteMH: UIButton!
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
    
    @IBAction func NamiHelplineLink(_ sender: Any) {
        if let url = URL(string: "https://www.nami.org/help") {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func CounselingLink(_ sender: Any) {
        if let url = URL(string: "https://www.betterhelp.com/helpme/?utm_source=AdWords&utm_medium=Search_PPC_c&utm_term=mental+health+resources_e&utm_content=112453035815&network=g&placement=&target=&matchtype=e&utm_campaign=2079213825&ad_type=text&adposition=&gclid=CjwKCAiAtej9BRAvEiwA0UAWXl954TzJVTsCQ602QIblMFYDNmAHShpMkLvQRbEpSV8U-I21_9fF_xoCb3gQAvD_BwE&not_found=1&gor=helpme") {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func NationalInstituteLink(_ sender: Any) {
        if let url = URL(string: "https://www.nimh.nih.gov/health/find-help/index.shtml") {
            UIApplication.shared.open(url)
        }
    }
    
    
    @IBAction func CDCLink(_ sender: Any) {
        if let url = URL(string: "https://www.cdc.gov/mentalhealth/tools-resources/individuals/index.htm") {
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
