//
//  NSNotification+MLeakEye.swift
//  Pods
//
//  Created by zixun on 16/12/13.
//
//

import Foundation


private let ntcPrefix = "MLeakEye.Notification"


extension Notification.Name {
    
    static let Scan = NSNotification.Name("\(ntcPrefix).Scan")
    
    static let Receive = NSNotification.Name("\(ntcPrefix).Receive")
}
