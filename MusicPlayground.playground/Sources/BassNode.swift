import Foundation
import SpriteKit

/// BassNodes, shaped like squares, play the lower octaves of the song.
public class BassNode: SoundNode {
    
    // Initalizes the node with the correct image and size. Also sets up the physics body.
    init() {
        super.init(texture: SKTexture(imageNamed: "Square"),
                   color: .red,
                   size: CGSize(width: 60, height: 60))
        
        physicsBody = SKPhysicsBody (rectangleOf: size)
        physicsBody?.restitution = 1.0
        physicsBody?.linearDamping = 0.0
        
        // BassNodes will collide with the scene and barriers.
        physicsBody?.categoryType = .bass
        physicsBody?.collisionType = [.scene, .barrier]
        physicsBody?.contactTestType = [.scene, .barrier]
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Variable overrided from SoundNode to set the name of the sound played for each BassNode collision.
    override var soundFileName: String {
        return "Bass"
    }
    
    /// Variable overrided from SoundNode to set the name of the image the BassNode's texture is changed to during a collision. 
    override var hitTextureName: String {
        return "SquareHit"
    }
    
}
