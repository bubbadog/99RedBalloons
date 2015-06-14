//
//  ViewController.swift
//  99RedBalloons
//
//  Created by Justin Karbowski on 6/12/15.
//  Copyright (c) 2015 JMK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var balloonNumberLabel: UILabel!
    
    var myBalloons:[Balloon] = []
    var currentIndex = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.createBalloons()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func nextBarButtonItemPressed(sender: UIBarButtonItem) {
        
        let balloon = myBalloons[currentIndex]
        
        UIView.transitionWithView(self.view, duration: 2, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
            
            // access properties using the 'self' keyword (classes only)
            self.myImageView.image = balloon.image
            if balloon.number == 1 {
                self.balloonNumberLabel.text = "\(balloon.number) balloon!"
            } else {
                self.balloonNumberLabel.text = "\(balloon.number) balloons!"
            }
            }, completion: {
                (finished: Bool) -> () in
        })
        
        currentIndex += 1
        
    }
    
    var balloonNumber = 1
    func createBalloons () {
        for var balloonNumber = 1; balloonNumber < 100; balloonNumber++ {
            var balloon = Balloon()  // creating a balloon instance
            balloon.number = balloonNumber   // assign a number to balloon instance
            
            let randomNumber = Int(arc4random_uniform(UInt32(4)))
            balloon.image = UIImage(named: "RedBalloon\(randomNumber+1).jpg")
            
            self.myBalloons.append(balloon)  // pass balloon instance to myBalloons array (will do 99 times)
        }
    }

}

