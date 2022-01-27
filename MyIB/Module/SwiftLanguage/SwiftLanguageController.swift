//
//  SwiftLanguageController.swift
//  MyIB
//
//  Created by 李鹏达 on 2021/12/23.
//

import UIKit

class SwiftLanguageController: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        setBackground()
    }
}

extension SwiftLanguageController: MyBaseable {
    
}

protocol MyBaseable {
    func setBackground()
}

extension MyBaseable where Self: UIViewController {
    func setBackground() {
        view.backgroundColor = .orange
    }
}
