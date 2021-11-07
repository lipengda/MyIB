//
//  ScrollViewController.swift
//  MyIB
//
//  Created by 李鹏达 on 2021/11/6.
//

import UIKit

class ScrollViewController: BaseViewController {
    @IBOutlet weak var myScrollView: UIScrollView!
    @IBOutlet weak var dynamicLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        dispatchTimer(timeInterval: 1, handler: { [weak self] timer in
            print(self?.myScrollView.contentSize.height)
            let text = self?.dynamicLabel.text ?? ""
            self?.dynamicLabel.text = text + "change"
        }, needRepeat: true)
    }
}

