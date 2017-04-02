import Foundation
import SpriteKit

/// LeadNodes, shaped like a circle, play the melody of a song.
public class LeadNode:SoundNode {
    
    // Initalizes the node with the correct image and size. Also sets up the physics body.
    init() {
        super.init(texture: SKTexture(imageNamed: "Oval"),
                   color: .orange,
                   size: CGSize(width: 60, height: 60))
        
        // LeadNodes will collide with the scene and barriers.
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
    
    /// Variable overrided from SoundNode to set the name of the sound played for each LeadNode collision.
    override var soundFileName: String {
        return "Lead"
    }

    /// Variable overrided from SoundNode to set the name of the image the LeadNode's texture is changed to during a collision.
    override var hitTextureName: String {
        return "OvalHit"
    }
    
}

