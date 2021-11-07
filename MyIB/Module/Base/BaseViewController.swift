//
//  BaseViewController.swift
//  MyIB
//
//  Created by 李鹏达 on 2021/11/6.
//

import UIKit

class BaseViewController: UIViewController {
    func dispatchTimer(timeInterval: Double, handler: @escaping (DispatchSourceTimer?) -> Void, needRepeat: Bool) {
        let timer = DispatchSource.makeTimerSource(flags: [], queue: DispatchQueue.main)
        timer.schedule(deadline: .now(), repeating: timeInterval)
        timer.setEventHandler {
            DispatchQueue.main.async {
                if needRepeat {
                    handler(timer)
                } else {
                    timer.cancel()
                    handler(nil)
                }
            }
        }
        timer.resume()
        
    }
}
