//
//  carrinhoViewController.swift
//  desafio
//
//  Created by Webeleven on 07/02/20.
//  Copyright © 2020 Rafael Lehn. All rights reserved.
//

import Foundation
import UIKit

class carrinhoViewController: UIViewController {

    
    @IBAction func closeView(_ sender: Any) {
        tabBarController?.selectedIndex = 0
    }
    
    @IBAction func products(_ sender: Any) {
        tabBarController?.selectedIndex = 1
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
