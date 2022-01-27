//
//  MyTableviewController.swift
//  MyIB
//
//  Created by 李鹏达 on 2021/10/17.
//

import Foundation
import UIKit

class MyTableviewController: UIViewController {
    @IBOutlet weak var myTableview: UITableView!
    
    let modules = ["UIStackView", "Calculator", "scroll", "priority", "snapkit", "RX", "SwiftLanguage"]
    
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myCellNib = UINib.init(nibName: "MyCell", bundle: nil)
        myTableView.register(myCellNib, forCellReuseIdentifier: "MyCell")
    }
}

extension MyTableviewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modules.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! MyCell
        cell.myLabel.text = modules[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let e = UIEdgeInsets(top: 0, left: 0, bottom: 400, right: 0)
//        myTableview.contentInset = e
        myTableview.setContentOffset(CGPoint(x: 0, y: 200), animated: true)
        return
        
        if indexPath.row == 0 {
            let sb = UIStoryboard.init(name: "UIStackViewController", bundle: nil).instantiateViewController(identifier: "UIStackViewController")
            navigationController?.pushViewController(sb, animated: true)
        } else if indexPath.row == 1 {
            //CalculatorController
            let sb = UIStoryboard.init(name: "CalculatorController", bundle: nil).instantiateViewController(identifier: "CalculatorController")
            navigationController?.pushViewController(sb, animated: true)
        } else if indexPath.row == 2 {
            //scroll
            let sb = UIStoryboard.init(name: "ScrollViewController", bundle: nil).instantiateViewController(identifier: "ScrollViewController")
            navigationController?.pushViewController(sb, animated: true)
        } else if indexPath.row == 3 {
            //scroll
            let sb = UIStoryboard.init(name: "PriorityController", bundle: nil).instantiateViewController(identifier: "PriorityController")
            navigationController?.pushViewController(sb, animated: true)
        } else if indexPath.row == 4 {
            let sb = SnapKitController()
            navigationController?.pushViewController(sb, animated: true)
        } else if indexPath.row == 5 {
            let sb = UIStoryboard.init(name: "RXController", bundle: nil).instantiateViewController(identifier: "RXController")
            navigationController?.pushViewController(sb, animated: true)
        } else if indexPath.row == 6 {
            let sb = SwiftLanguageController()
            navigationController?.pushViewController(sb, animated: true)
        }
    }
}
