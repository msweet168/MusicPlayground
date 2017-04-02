import Foundation
import SpriteKit

/// BarrierNodes are added to manipulate shape nodes within the playground. 
public class BarrierNode: SKShapeNode {
    
    init(path: UIBezierPath) {
        super.init()
        self.path = path.cgPath
        
        // Sets the appearence of each barrier.
        strokeColor = .black
        lineWidth = 10.0
        
        // physicsbody settings of each barrier. 
        physicsBody = SKPhysicsBody(edgeLoopFrom: path.cgPath)
        physicsBody?.restitution = 0.5
        physicsBody?.linearDamping = 0.0
        physicsBody?.pinned = true
        physicsBody?.categoryType = .barrier
    
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
