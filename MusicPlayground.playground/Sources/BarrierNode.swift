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
