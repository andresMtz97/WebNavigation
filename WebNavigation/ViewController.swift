//
//  ViewController.swift
//  WebNavigation
//
//  Created by Rafael González on 26/04/24.
//

import UIKit

class ViewController: UIViewController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func openUrlButtonTapped(_ sender: UIButton) {
        if appDelegate.internetStatus {
            if let url = URL(string: "https://developer.apple.com/documentation/uikit/uiapplication/1648685-open") {
                UIApplication.shared.open(url)
            }
        } else {
            print("Sin conexión a internet")
        }
    }
    
}

