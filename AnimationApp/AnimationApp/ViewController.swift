//
//  ViewController.swift
//  AnimationApp
//
//  Created by Александр Ермаков on 29.12.2021.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: -
    // MARK: Public variables
    
    var square = UIView()
    var safeAreaSize: CGSize?
    var pushCounter: Int = 0
    var cornersCoordinates: [CGPoint]?
    let colors: [CGColor] = [UIColor.blue.cgColor, UIColor.red.cgColor, UIColor.cyan.cgColor, UIColor.magenta.cgColor]
    let sideSize = 100.0
    
    // MARK: -
    // MARK: Public functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        square.backgroundColor = UIColor(red: 0.91, green: 0.4, blue: 0.45, alpha: 1.0)
        view.addSubview(square)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let area = view.safeAreaLayoutGuide.layoutFrame
        self.safeAreaSize = view.safeAreaLayoutGuide.layoutFrame.size
        self.square.frame = CGRect(x: area.origin.x, y: area.origin.y, width: self.sideSize, height: self.sideSize)
        if let safeAreaSize = safeAreaSize {
            cornersCoordinates = [
                CGPoint(x: area.origin.x + self.sideSize / 2, y: area.origin.y + self.sideSize / 2),
                CGPoint(x: safeAreaSize.width - self.sideSize / 2, y: area.origin.y + self.sideSize / 2),
                CGPoint(x: safeAreaSize.width - self.sideSize / 2, y: safeAreaSize.height),
                CGPoint(x: area.origin.x + self.sideSize / 2, y: safeAreaSize.height)
            ]
        }
    }

    @IBAction func pushButton(_ sender: Any) {
        pushCounter += 1
        if let cornersCoordinates = cornersCoordinates {
            let n = pushCounter % cornersCoordinates.count
            animate(finishPosition: cornersCoordinates[n], color: colors[n])
        }
    }
    
    func animate(finishPosition: CGPoint, color: CGColor) {
        let motion = CABasicAnimation(keyPath: "position")
        motion.toValue = CGPoint(x: finishPosition.x, y: finishPosition.y)
        motion.duration = 1
        
        let coloring = CABasicAnimation(keyPath: "backgroundColor")
        coloring.toValue = color
        coloring.duration = 1
        
        let rounding = CABasicAnimation(keyPath: "cornerRadius")
        rounding.fromValue = 0.0
        rounding.toValue = self.sideSize / 2
        rounding.duration = 1
        
        let motionAndRadiusAndColor = CAAnimationGroup()
        motionAndRadiusAndColor.animations = [motion, coloring, rounding]
        motionAndRadiusAndColor.duration = 1
        motionAndRadiusAndColor.fillMode = .forwards
        motionAndRadiusAndColor.isRemovedOnCompletion = false
        
        self.square.layer.add(motionAndRadiusAndColor, forKey: "")
        self.square.layer.add(motion, forKey: "to Side")
    }
}
