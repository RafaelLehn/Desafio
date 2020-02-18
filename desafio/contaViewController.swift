//
//  contaViewController.swift
//  desafio
//
//  Created by Webeleven on 07/02/20.
//  Copyright © 2020 Rafael Lehn. All rights reserved.
//

import Foundation
import UIKit

class contaViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBAction func closeView(_ sender: Any) {
        tabBarController?.selectedIndex = 0
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.borderWidth = 2.0
        loginButton.layer.borderColor = UIColor.white.cgColor
        loginButton.layer.cornerRadius = 3
        // Do any additional setup after loading the view.
    }
}
