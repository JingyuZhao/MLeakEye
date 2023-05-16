//
//  ViewController.swift
//  MLeakEye
//
//  Created by JingyuZhao on 11/22/2022.
//  Copyright (c) 2022 JingyuZhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var subV: subView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let btn = UIButton()
        btn.backgroundColor = UIColor.red
        btn.frame = CGRectMake(20, 100, 200, 50)
        btn.setTitle("点我present", for: .normal)
        btn.addTarget(self, action: #selector(jump), for: .touchUpInside)
        view.addSubview(btn)
        
        let btn2 = UIButton()
        btn2.backgroundColor = UIColor.brown
        btn2.frame = CGRectMake(20, 200, 200, 50)
        btn2.setTitle("点我产生内存泄漏", for: .normal)
        btn2.addTarget(self, action: #selector(diss), for: .touchUpInside)
        view.addSubview(btn2)
        
        subV = subView(frame: CGRectMake(20, 300, 200, 50))
        subV.backgroundColor = UIColor.green
        view.addSubview(subV)
        
        leak()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc
    func leak() {
        
        self.subV.tb = {(param)->() in
            self.subV.backgroundColor = UIColor.purple
            self.remove()
        }
        
        subV.tb("gg")
    }
    
    func remove() {
        
    }
    
    @objc
    func jump() {
        let vc = ViewController()
        vc.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    @objc
    func diss() {
        self.dismiss(animated: true)
    }
}

