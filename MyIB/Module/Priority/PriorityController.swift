//
//  PriorityController.swift
//  MyIB
//
//  Created by 李鹏达 on 2021/11/6.
//

import UIKit

class PriorityController: BaseViewController {
    @IBOutlet weak var rightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var myButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func myAction(_ sender: Any) {
        myButton.isSelected = !myButton.isSelected
        
        UIView.animate(withDuration: 2) { [weak self] in
            self?.rightConstraint.priority = self?.myButton.isSelected ?? false ? .defaultLow : .defaultHigh
//            self?.myButton.layoutIfNeeded()
            self?.view.layoutIfNeeded()
        } completion: { _ in
            print("动画完成")
        }


    }

    
}
