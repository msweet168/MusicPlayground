import Foundation
import SpriteKit

public class LeadNode:SoundNode {
    
    init() {
        super.init(texture: SKTexture(imageNamed: "Oval"),
                   color: .orange,
                   size: CGSize(width: 60, height: 60))
        
        physicsBody = SKPhysicsBody (circleOfRadius: size.width/2)
        physicsBody?.restitution = 1.0
        physicsBody?.linearDamping = 0.0
        physicsBody?.categoryType = .lead
        physicsBody?.collisionType = [.scene, .barrier]
        physicsBody?.contactTestType = [.scene, .barrier]
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var soundFileName: String {
        return "Bing"
    }

    override var hitTextureName: String {
        return "OvalHit"
    }
    
}

