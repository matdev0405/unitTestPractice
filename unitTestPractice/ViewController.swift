//
//  ViewController.swift
//  unitTestPractice
//
//  Created by User on 2022/5/23.
//

import UIKit

class ViewController: UIViewController {
    
    let nameLabel : UILabel = {
        let a = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 20))
        a.translatesAutoresizingMaskIntoConstraints = false
        a.text = "label1"
        return a
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(nameLabel)
        nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
    }
    
    func plus(_ a: Int?, _ b: Int?) -> Int? {
            guard let numberA = a, let numberB = b else { return nil }
            return numberA + numberB
        }
    
    /// 改變 Label 的文字
    /// - Parameter wording: _
    func changeWroding(_ wording: String) {
        nameLabel.text = wording
    }
    
    func loopSomething() {
        for i in 0...10000 {
            print("i:\(i)")
        }
    }


}

