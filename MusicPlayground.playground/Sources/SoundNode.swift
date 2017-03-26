import Foundation
import SpriteKit

open class SoundNode:SKSpriteNode {
    
    var soundFileName: String {
        fatalError("Must be overridden by subclasses.")
    }
    
    func playSound() {
        run(SKAction.playSoundFileNamed(soundFileName, waitForCompletion: false))
    }
}
