import Foundation
import SpriteKit

/// DrumsNodes, shaped like rectangles, play the drum sounds of the song. 
public class DrumsNode:SoundNode {
    
     // Initalizes the node with the correct image and size. Also sets up the physics body.
    init() {
        super.init(texture: SKTexture(imageNamed: "Rectangle"),
                   color: .purple,
                   size: CGSize(width: 71, height: 36))
        
        physicsBody = SKPhysicsBody (rectangleOf: size)
        physicsBody?.restitution = 1.0
        physicsBody?.linearDamping = 0.0
        physicsBody?.categoryType = .drum
        // DrumsNodes will collide with the scene and barriers.
        physicsBody?.collisionType = [.scene, .barrier]
        physicsBody?.contactTestType = [.scene, .barrier]
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Variable overrided from SoundNode to set the name of the sound played for each DrumsNode collision.
    override var soundFileName: String {
        return "Drums"
    }
    
    /// Variable overrided from SoundNode to set the name of the image the DrumsNode's texture is changed to during a collision.
    override var hitTextureName: String {
        return "RectangleHit"
    }
    
}


