//
//  MLeakEye.swift
//  Pods
//
//  Created by zixun on 16/12/12.
//
//

import Foundation

/// MARK: - LeakEyeDelegate
@objc public protocol MLeakEyeDelegate: NSObjectProtocol {
    @objc optional func leakEye(_ leakEye: MLeakEye, didCatchLeak object: NSObject)
}

/// MARK: - LeakEye
@objcMembers public class MLeakEye: NSObject {

    /// 单例对象
    public static let shared = MLeakEye()

    /// 代理属性，用于自定义输出格式
    public weak var delegate: MLeakEyeDelegate?

    /// 是否使用弹窗输出，默认开启
    public var useAlert = true

    /// 用于扫描的定时器
    private var timer: Timer?

    /// 忽略列表信息
    public var ignoreList: [String]?
    
    /// 判断检查内存泄漏工具是否开启
    public var isOpening: Bool {
        get {
            return self.timer?.isValid ?? false
        }
    }

    /// 构造方法
    private override init() {
        super.init()
        NotificationCenter.default.addObserver(self, selector: #selector(MLeakEye.receive), name: NSNotification.Name.Receive, object: nil)
    }


    /// 开启内存泄漏检测工具
    public func open() {
        Preparer.binding()
        self.startPingTimer()
    }


    /// 关闭内存泄漏检测工具
    public func close() {
        self.timer?.invalidate()
        self.timer = nil
    }
}



/// MARK: - 私有方法
extension MLeakEye {

    private func startPingTimer() {
        if Thread.isMainThread == false {
            DispatchQueue.main.async {
                self.startPingTimer()
                return
            }
        }
        self.close()

        self.timer = Timer.scheduledTimer(timeInterval: 0.5,
                                          target: self,
                                          selector: #selector(MLeakEye.scan),
                                          userInfo: nil,
                                          repeats: true)
    }

    @objc private func scan() {
        NotificationCenter.default.post(name: NSNotification.Name.Scan, object: nil)
    }

    @objc private func receive(notif: NSNotification) {
        guard let leakObj = notif.object as? NSObject else { return }
        guard !self.checkIgnore(obj: leakObj) else { return }
        self.delegate?.leakEye?(self, didCatchLeak: leakObj)
        let message = "发现可疑内存泄漏对象\(leakObj)"
        if useAlert {
            let vc = UIAlertController(title: "提示", message: message, preferredStyle: .alert)
            vc.addAction(UIAlertAction(title: "确定", style: .default, handler: nil))
            UIApplication.shared.keyWindow?.rootViewController?.present(vc, animated: true, completion: nil)
        } else {
            debugPrint(message)
        }
    }
    
    private func checkIgnore(obj: NSObject) -> Bool {
        
        let vc = NSStringFromClass(obj.classForCoder)
        guard vc.count > 0 else { return false }
        
        var ignore = false
        ignoreList?.forEach({ info in
            if (vc.range(of: info) != nil) {
                ignore = true
            }
        })

        return ignore
    }
    
}

