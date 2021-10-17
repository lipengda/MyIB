//
//  MyTableviewController.swift
//  MyIB
//
//  Created by 李鹏达 on 2021/10/17.
//

import Foundation
import UIKit

class MyTableviewController: UIViewController {
    @IBOutlet weak var myTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let myCellNib = UINib.init(nibName: "MyCell", bundle: nil)
        myTableView.register(myCellNib, forCellReuseIdentifier: "MyCell")
        
    }
}

extension MyTableviewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! MyCell
        cell.myLabel.text = "123123"
        return cell
    }
}
