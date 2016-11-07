//
//  GameViewController.swift
//  ZombieConga
//
//  Created by qiuhong on 14/10/2016.
//  Copyright © 2016 CETCME. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    var scene: GameScene!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scene = GameScene(size: CGSize(width: 2048, height: 1536))
        let skView = self.view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .aspectFill
        skView.presentScene(scene)
        
        //beans
        addBeans(number: 50)
        
        //time label 
        let timeLabelWidth: CGFloat = 60
        let timeLabel = UILabel(frame: CGRect(x: self.view.center.x - timeLabelWidth / 2, y: 5, width: timeLabelWidth, height: 20))
        timeLabel.backgroundColor = UIColor.clear
        timeLabel.text = "12:00"
        timeLabel.textColor = UIColor.colorFromRGB(rgbValue: 0xFFFFFF, alpha: 0.7)
        timeLabel.textAlignment = .center
        timeLabel.font = UIFont.systemFont(ofSize: 13)
        self.view.addSubview(timeLabel)
        
        
        // button
        let buttonSize: CGFloat = 70
        let buttonSpace: CGFloat = 10
        let button1 = UIButton(frame: CGRect(x: self.view.bounds.width - buttonSize * 2 - buttonSpace * 2 , y: self.view.bounds.height - buttonSize - buttonSpace, width: buttonSize, height: buttonSize))
        let button2 = UIButton(frame: CGRect(x: self.view.bounds.width - buttonSize - buttonSpace , y: self.view.bounds.height - buttonSize - buttonSpace, width: buttonSize, height: buttonSize))
        button1.setImage(UIImage(named: "button1"), for: .normal)
        button2.setImage(UIImage(named: "button2"), for: .normal)
        button1.layer.cornerRadius = buttonSize / 2
        button2.layer.cornerRadius = buttonSize / 2
        button1.layer.masksToBounds = true
        button2.layer.masksToBounds = true
        button1.addTarget(self, action: #selector(GameViewController.tubaozi), for: .touchUpInside)
        button2.addTarget(self, action: #selector(GameViewController.fenshen), for: .touchUpInside)
        self.view.addSubview(button1)
        self.view.addSubview(button2)
        
        
        
        //self ball
        let ballSize: CGFloat = 100
        let label = UILabel(frame: CGRect(x: self.view.center.x - ballSize / 2, y: self.view.center.y - ballSize / 2, width: ballSize, height: ballSize))
        label.backgroundColor = UIColor.colorFromRGB(rgbValue: 0xFDC934, alpha: 1)
        label.layer.cornerRadius = ballSize / 2
        label.layer.masksToBounds = true
        label.font = UIFont.systemFont(ofSize: 15)
        label.text = "大白球"
        label.textAlignment = .center
        label.textColor = UIColor.white
        self.view.addSubview(label)
        
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func addBeans(number: Int) {
        let beanWidth: CGFloat = 10
        for _ in 0 ... number {
            let bean = Bean(frame: CGRect(
            x: CGFloat(arc4random_uniform(UInt32(self.view.bounds.width))),
            y: CGFloat(arc4random_uniform(UInt32(self.view.bounds.height))),
            width: beanWidth,
            height: beanWidth)
            )
            self.view.addSubview(bean)
          
        }
    }
    
    func tubaozi() {
        scene.tubaozi()
        
    }
    
    func fenshen() {
        scene.fenshen()
    }
}
