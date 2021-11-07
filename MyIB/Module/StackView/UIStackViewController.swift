//
//  UIStackViewController.swift
//  MyIB
//
//  Created by 李鹏达 on 2021/11/5.
//

import UIKit

class UIStackViewController: BaseViewController {
    
    @IBOutlet weak var button2: UIButton!
    
    @IBOutlet weak var dynamicLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dispatchTimer(timeInterval: 1, handler: { [weak self] timer in
            print(self?.dynamicLabel.text)
            let text = self?.dynamicLabel.text ?? ""
            self?.dynamicLabel.text = text + "变长"
        }, needRepeat: true)
    }
    
    @IBAction func button2Action(_ sender: Any) {
        button2.isHidden = true
    }
    
    
    
    
    
    
}
