//
//  RootViewController.swift
//  MyIB
//
//  Created by 李鹏达 on 2021/9/2.
//

import Foundation
import UIKit

class RootViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.orange
    }
    @IBAction func b1Action(_ sender: Any) {
        navigationController?.pushViewController(HomeViewController3(), animated: true)
    }
    @IBAction func b2Action(_ sender: Any) {
        let sb = UIStoryboard.init(name: "StoryBoardViewController", bundle: nil).instantiateViewController(identifier: "mySBID233")
        navigationController?.pushViewController(sb, animated: true)
    }
    @IBAction func loginAction(_ sender: Any) {
        let sb = UIStoryboard.init(name: "LoginViewController", bundle: nil).instantiateViewController(identifier: "login")
        navigationController?.pushViewController(sb, animated: true)
    }
    @IBAction func extensionAction(_ sender: Any) {
        let baseVC = MyVC(gender: "nil")
        navigationController?.pushViewController(baseVC, animated: true)
    }
}
