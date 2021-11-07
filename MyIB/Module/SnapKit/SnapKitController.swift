//
//  SnapKitController.swift
//  MyIB
//
//  Created by 李鹏达 on 2021/11/7.
//

import UIKit

class SnapKitController: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .orange
        
        
//        let box1 = UIView()
//        box1.backgroundColor = .blue
//        view.addSubview(box1)
//        box1.snp.makeConstraints { make in
//            make.width.height.equalTo(100)
//            make.center.equalToSuperview()
//        }
//
//        let box2 = UIView()
//        box2.backgroundColor = .red
//        view.addSubview(box2)
//        box2.snp.makeConstraints { make in
//            make.width.height.equalTo(50)
//            make.centerY.equalToSuperview()
////            make.left.equalTo(box1.snp.rightMargin).offset(0)
//            make.leftMargin.equalTo(box1.snp.right).offset(0)
//        }
        
        let box3 = UIView()
        box3.backgroundColor = .green
        view.addSubview(box3)
        box3.snp.makeConstraints { make in
            make.width.height.equalTo(50)
            make.left.equalToSuperview()
            make.bottom.equalTo(self.view.snp.bottomMargin).offset(0)
        }
        
        let box4 = UIView()
        box4.backgroundColor = .purple
        view.addSubview(box4)
        box4.snp.makeConstraints { make in
            make.width.height.equalTo(100)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(0)
        }
    }
}
