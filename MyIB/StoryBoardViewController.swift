//
//  StoryBoardViewController.swift
//  MyIB
//
//  Created by 李鹏达 on 2021/9/4.
//

import Foundation
import UIKit

import RxSwift
import RxRelay
import Alamofire

class StoryBoardViewController: UIViewController {
    @IBOutlet weak var myLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let myView = MyXibView.init(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
//        view.addSubview(myView)
        myLabel.isUserInteractionEnabled = true
        
        
    }
    
    @IBAction func taplabel(_ sender: Any) {
        print("add ok")
    }
    
}
