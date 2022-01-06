//
//  ViewController.swift
//  AnimationApp
//
//  Created by Александр Ермаков on 29.12.2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var textLabel: UILabel?
    //var pushCounter = 0
    
    func action() -> (()->Int){
         
        var val = 0
        return {
            val = val+1
            return val
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func pushButton(_ sender: Any) {
        //pushCounter += 1
        let inc = action()
        self.textLabel?.text = String(inc())
    }
}
