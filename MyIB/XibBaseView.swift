//
//  XibBaseView.swift
//  MyIB
//
//  Created by 李鹏达 on 2021/9/8.
//

import Foundation
import UIKit

class XibBaseView: UIView {
    
    var container: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        container = loadViewFromNib()
        addSubview(container)
        
        updateFrame()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        container = loadViewFromNib()
        addSubview(container)
        
        updateFrame()
    }
    
    func loadViewFromNib() -> UIView {
        let className = type(of: self)
        let bundle = Bundle(for: className)
        let name = NSStringFromClass(className).components(separatedBy: ".").last
        let nib = UINib(nibName: name!, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        return view
    }
    
    func updateFrame() {
        container.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
    }
    
}
