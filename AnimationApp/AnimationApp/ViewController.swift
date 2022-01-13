//
//  ViewController.swift
//  AnimationApp
//
//  Created by Александр Ермаков on 29.12.2021.
//

import UIKit

class ViewController: UIViewController {
    
    let sideSize = 100.0
    var square: UIView?
    var safeAreaSize: CGSize?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        self.square  = UIView(frame: CGRect(
            x: self.view.center.x - self.sideSize / 2,
            y: self.view.center.y - self.sideSize / 2,
            width: self.sideSize,
            height: self.sideSize))
        square?.backgroundColor = UIColor(red: 0.91, green: 0.4, blue: 0.45, alpha: 1.0)
        if let square = square {
            view.addSubview(square)
        }
    }
    
    @IBAction func pushButton(_ sender: Any) {
        UIView.animate(withDuration: 1, animations: {
            self.square?.layer.cornerRadius = self.sideSize / 2
        })
    }
}
