//
//  ViewController.swift
//  AnimationApp
//
//  Created by Александр Ермаков on 29.12.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var square = UIView()
    var safeAreaSize: CGSize?
    var pushCounter = 0
    var cornersCoordinates: [CGPoint] = []
    var startPosition = CGPoint()
    let colors: [CGColor] = [UIColor.blue.cgColor, UIColor.red.cgColor, UIColor.cyan.cgColor, UIColor.magenta.cgColor]
    let sideSize = 100.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.square.backgroundColor = UIColor(red: 0.91, green: 0.4, blue: 0.45, alpha: 1.0)
        view.addSubview(square)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let area = self.view.safeAreaLayoutGuide.layoutFrame
        self.safeAreaSize = area.size
        startPosition.x = area.origin.x
        startPosition.y = area.origin.y
        
        if let safeAreaSize = safeAreaSize {
            self.cornersCoordinates = [
                CGPoint(x: area.origin.x, y: area.origin.y),
                CGPoint(x: safeAreaSize.width - self.sideSize, y: area.origin.y),
                CGPoint(x: safeAreaSize.width - self.sideSize, y: area.origin.y + safeAreaSize.height - self.sideSize),
                CGPoint(x: area.origin.x, y: area.origin.y + safeAreaSize.height - self.sideSize)
            ]
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.square.frame = CGRect(x: startPosition.x, y: startPosition.y, width: self.sideSize, height: self.sideSize)
    }
    
    @IBAction func pushButton(_ sender: Any) {
        self.pushCounter += 1
        let i = self.pushCounter % cornersCoordinates.count
        UIView.animate(withDuration: 1) {
            self.square.frame = CGRect(x: self.cornersCoordinates[i].x,
                                       y: self.cornersCoordinates[i].y,
                                       width: self.sideSize,
                                       height: self.sideSize)
            if i % 2 == 1 {
                self.square.layer.cornerRadius = self.sideSize / 2
            } else {
                self.square.layer.cornerRadius = 0.0
            }
        }
    }
}
