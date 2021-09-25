//
//  MyXibView.swift
//  MyIB
//
//  Created by 李鹏达 on 2021/9/4.
//

import Foundation
import UIKit

@IBDesignable
class MyXibView: XibBaseView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        container.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        container.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
    }
    
}
