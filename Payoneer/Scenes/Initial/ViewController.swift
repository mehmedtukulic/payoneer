//
//  ViewController.swift
//  Payoneer
//
//  Created by Mehmed Tukulic on 28. 4. 2021..
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc = PaymentMethodsViewController()
        self.navigationController?.setViewControllers([vc], animated: true)
    }


}

