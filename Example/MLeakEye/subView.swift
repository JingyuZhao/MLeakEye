//
//  subView.swift
//  MLeakEye_Example
//
//  Created by johnson on 2023/5/16.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import UIKit

typealias testBlock = (String) -> Void

class subView: UIView {

    var tb: testBlock!
    
    var s: UIView!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
