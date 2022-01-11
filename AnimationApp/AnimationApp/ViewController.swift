//
//  ViewController.swift
//  AnimationApp
//
//  Created by Александр Ермаков on 29.12.2021.
//

import UIKit

class ViewController: UIViewController {
    
    let sideSize = 100.0
    var startPosition: (x: CGFloat, y: CGFloat)?
    var finishPosition: (x: CGFloat, y: CGFloat)?
    var square: UIView?
    var n = 3
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let window = UIApplication.shared.windows.first
//        let topPadding = window?.safeAreaInsets.top
        
        self.square  = UIView(frame: CGRect(
            x: 0,
            y: 44 ?? 0,
            width: self.sideSize,
            height: self.sideSize))
        square?.backgroundColor = UIColor(red: 0.91, green: 0.4, blue: 0.45, alpha: 1.0)
        if let square = square {
            view.addSubview(square)
        }
    }
    
//    func dimensions() -> (CGFloat, CGFloat) {
//        let safeAreaHeight = view.safeAreaLayoutGuide.layoutFrame.height
//        let safeAreaWidth = view.safeAreaLayoutGuide.layoutFrame.width
//        
//        return (safeAreaWidth, safeAreaHeight)
//    }
//
//    @IBAction func pushButton(_ sender: Any) {
//        
//        let window = UIApplication.shared.windows.first
//        let topPadding = window?.safeAreaInsets.top
//        
//        let safeAreaSize: (width: CGFloat, height: CGFloat)
//        safeAreaSize = dimensions()
//        startPosition = (x: 0, y: topPadding)
//        finishPosition = (x: safeAreaSize.width, y: topPadding)
//        animateMovement(startPosition: startPosition, finishPosition: finishPosition)
//    }
//    
//    func animateMovement(startPosition: (x: CGFloat, y: CGFloat), finishPosition: (x: CGFloat, y: CGFloat)) {
//        let animation = CABasicAnimation()
//        animation.keyPath = "position.x"
//        animation.fromValue = startPosition.x + self.sideSize / 2
//        animation.toValue = finishPosition.x - self.sideSize / 2
//        animation.duration = 1
//        if let square = square {
//            square.layer.add(animation, forKey: "basic")
//            square.layer.position = CGPoint(x: finishPosition.x - self.sideSize / 2, y: self.finishPosition.y + self.sideSize / 2)
//        }
//    }
}
