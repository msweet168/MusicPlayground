import Foundation
import SpriteKit

public class DrumsNode:SoundNode {
    
    init() {
        super.init(texture: SKTexture(imageNamed: "Rectangle"),
                   color: .purple,
                   size: CGSize(width: 71, height: 36))
        
        physicsBody = SKPhysicsBody (rectangleOf: size)
        physicsBody?.restitution = 1.0
        physicsBody?.linearDamping = 0.0
        physicsBody?.categoryType = .drum
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
        return "RectangleHit"
    }
    
}


