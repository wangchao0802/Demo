//
//  GameScene.swift
//  L04Customsecene
//
//  Created by WangChao on 6/22/14.
//  Copyright (c) 2014 WangChao. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
//        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
//        myLabel.text = "Hello, World!";
//        myLabel.fontSize = 65;
//        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
//        
//        self.addChild(myLabel)
        
        physicsBody = SKPhysicsBody(edgeLoopFromRect:self.frame)
        
   physicsWorld
        
        
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent)
    {
        
        var location = touches.anyObject().locationInNode(self);
        var l = SKLabelNode();
        l.text = "zhpangzi";
        addChild(l);
        l.position = location;
        l.physicsBody = SKPhysicsBody(rectangleOfSize: l.frame.size);
        
        
        SKPhysicsContact
        
        
        /* Called when a touch begins */
//        
//        for touch: AnyObject in touches {
//            let location = touch.locationInNode(self)
//            
//            let sprite = SKSpriteNode(imageNamed:"Spaceship")
//            
//            sprite.xScale = 0.5
//            sprite.yScale = 0.5
//            sprite.position = location
//            
//            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
//            
//            sprite.runAction(SKAction.repeatActionForever(action))
//            
//            self.addChild(sprite)
//        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
