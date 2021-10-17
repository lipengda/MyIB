//
//  MyCell.swift
//  MyIB
//
//  Created by 李鹏达 on 2021/10/17.
//

import Foundation
import UIKit

class MyCell: UITableViewCell {
    @IBOutlet weak var myLabel: UILabel!
    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        myLabel.backgroundColor = UIColor.red
//    }
//
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        myLabel.backgroundColor = UIColor.red
    }
}
