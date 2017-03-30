import Foundation
import SpriteKit

open class SoundNode: SKSpriteNode {
    
    var soundFileName: String {
        fatalError("Must be overridden by subclasses.")
    }
    
    var hitTextureName: String {
        fatalError("Must be overridden by subclasses.")
    }
    
    func playSound(octave: SoundModifier) {
        let oldTexture = texture!
        run(SKAction.sequence([
            SKAction.setTexture(SKTexture(imageNamed: hitTextureName)),
            SKAction.wait(forDuration: 0.1),
            SKAction.setTexture(oldTexture)
            ]))
        
        var soundString:String
        switch octave {
        case .high:
            soundString = "\(soundFileName)_high"
        case .medium:
            soundString = "\(soundFileName)_medium"
        case .low:
            soundString = "\(soundFileName)_low"
        }
        
        run(SKAction.playSoundFileNamed(soundString, waitForCompletion: false))
        
    }
}
