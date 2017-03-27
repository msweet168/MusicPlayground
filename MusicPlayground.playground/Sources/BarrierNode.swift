import Foundation
import SpriteKit


public class BarrierNode: SKShapeNode {
    
    init(path: UIBezierPath) {
        super.init()
        self.path = path.cgPath
        strokeColor = .black
        lineWidth = 10.0
        
        // TODO: Make this work with the line width
        physicsBody = SKPhysicsBody(edgeLoopFrom: path.cgPath)
        physicsBody?.restitution = 1.0
        physicsBody?.linearDamping = 0.0
        physicsBody?.pinned = true
        physicsBody?.categoryType = .barrier
    
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

/*
public class BarrierNode:SKSpriteNode {
    
    init() {
        super.init(texture: SKTexture(imageNamed: "Oval"),
                   color: .orange,
                   size: CGSize(width: 60, height: 60))
        
        physicsBody = SKPhysicsBody (rectangleOf: size)
        //physicsBody = SKPhysicsBody(circleOfRadius: size.width / 2)
        physicsBody?.restitution = 1.0
        physicsBody?.linearDamping = 0.0
        physicsBody?.categoryType = .barrier
        physicsBody?.collisionType = [.scene, .barrier]
        physicsBody?.contactTestType = [.scene, .barrier]

        
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
 */
