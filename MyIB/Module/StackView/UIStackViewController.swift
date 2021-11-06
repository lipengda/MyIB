//
//  UIStackViewController.swift
//  MyIB
//
//  Created by 李鹏达 on 2021/11/5.
//

import UIKit

class UIStackViewController: UIViewController {
    
    @IBOutlet weak var button2: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func button2Action(_ sender: Any) {
        button2.isHidden = true
    }
    
    
    
    
    
}
