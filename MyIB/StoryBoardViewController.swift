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
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myView = MyXibView.init(frame: CGRect(x: 10, y: 100, width: 100, height: 400))
        view.addSubview(myView)
        
        
        
    }
    
    
}
