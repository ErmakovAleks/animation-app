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
    var safeAreaSize: (x: CGFloat, y: CGFloat)? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        safeAreaSize = (x: view.safeAreaLayoutGuide.layoutFrame.width,
                        y: view.safeAreaLayoutGuide.layoutFrame.height)
        
                self.square  = UIView(frame: CGRect(
                    x: view.safeAreaLayoutGuide.layoutFrame.origin.x,
                    y: view.safeAreaLayoutGuide.layoutFrame.origin.y,
                    width: self.sideSize,
                    height: self.sideSize))
                square?.backgroundColor = UIColor(red: 0.91, green: 0.4, blue: 0.45, alpha: 1.0)
                if let square = square {
                    view.addSubview(square)
                }
    }

    @IBAction func pushButton(_ sender: Any) {
        if let safeAreaSize = safeAreaSize {
            animateMovement(startPosition: (x: view.safeAreaLayoutGuide.layoutFrame.origin.x,
                                            y: view.safeAreaLayoutGuide.layoutFrame.origin.y),
                            finishPosition: (x: safeAreaSize.x,
                                             y: view.safeAreaLayoutGuide.layoutFrame.origin.y))
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.animateMovement(startPosition: (x: safeAreaSize.x,
                                                     y: self.view.safeAreaLayoutGuide.layoutFrame.origin.y),
                                finishPosition: (x: safeAreaSize.x, y: safeAreaSize.y))
            }
        }
    }
    
    func animateMovement(startPosition: (x: CGFloat, y: CGFloat), finishPosition: (x: CGFloat, y: CGFloat)) {
        let animation = CABasicAnimation()
        animation.keyPath = "position.x"
        animation.fromValue = startPosition.x + self.sideSize / 2
        animation.toValue = finishPosition.x - self.sideSize / 2
        animation.duration = 1
        if let square = square {
            square.layer.add(animation, forKey: "basic")
            square.layer.position = CGPoint(x: finishPosition.x - self.sideSize / 2, y: finishPosition.y + self.sideSize / 2)
        }
    }
}
