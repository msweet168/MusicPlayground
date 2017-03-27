import Foundation
import SpriteKit

public class BassNode: SoundNode {
    
    init() {
        super.init(texture: SKTexture(imageNamed: "Square"),
                   color: .red,
                   size: CGSize(width: 60, height: 60))
        
        physicsBody = SKPhysicsBody (rectangleOf: size)
        //physicsBody = SKPhysicsBody(circleOfRadius: size.width / 2)
        physicsBody?.restitution = 1.0
        physicsBody?.linearDamping = 0.0
        physicsBody?.categoryType = .bass
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
        return "SquareHit"
    }
    
}
