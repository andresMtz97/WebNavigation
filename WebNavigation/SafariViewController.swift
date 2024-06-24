//
//  SafariViewController.swift
//  WebNavigation
//
//  Created by DISMOV on 27/04/24.
//

import UIKit
import SafariServices

class SafariViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func launchSafariTapped(_ sender: UIButton) {
        let url = URL(string: "https://developer.apple.com/documentation/safariservices/sfsafariviewcontroller")
        let config = SFSafariViewController.Configuration()
        config.entersReaderIfAvailable = true
        let safariVC = SFSafariViewController(url: url!, configuration: config)
        self.present(safariVC, animated: true)
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
