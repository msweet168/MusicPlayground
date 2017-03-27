import Foundation
import SpriteKit

open class SoundNode: SKSpriteNode {
    
    var soundFileName: String {
        fatalError("Must be overridden by subclasses.")
    }
    
    var hitTextureName: String {
        fatalError("Must be overridden by subclasses.")
    }
    
    func playSound() {
        let oldTexture = texture!
        run(SKAction.sequence([
            SKAction.setTexture(SKTexture(imageNamed: hitTextureName)),
            SKAction.wait(forDuration: 0.1),
            SKAction.setTexture(oldTexture)
        ]))
        run(SKAction.playSoundFileNamed(soundFileName, waitForCompletion: false))
    }
}
