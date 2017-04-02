import Foundation
import SpriteKit

/// SKSpriteNode which plays a sound. Super for all shape nodes.
open class SoundNode: SKSpriteNode {
    
    // Variable that is overridden by subclass to set the name of the sound file.
    var soundFileName: String {
        fatalError("Must be overridden by subclasses.")
    }
    
    // Variable that is overriden by subclass to set the name of the image the node's texture is changed to during a collision.
    var hitTextureName: String {
        fatalError("Must be overridden by subclasses.")
    }
    
    /// Plays a sound and runs a sequence to change node's image when in a collision.
    func playSound(octave: SoundModifier) {
        let oldTexture = texture!
        run(SKAction.sequence([
            SKAction.setTexture(SKTexture(imageNamed: hitTextureName)),
            SKAction.wait(forDuration: 0.1),
            SKAction.setTexture(oldTexture)
            ]))
        
        // Retreive first part of sound file from soundFileName and finish the second part with SoundModifier enum.
        var soundString:String
        switch octave {
        case .high:
            soundString = "\(soundFileName)_high"
        case .medium:
            soundString = "\(soundFileName)_medium"
        case .low:
            soundString = "\(soundFileName)_low"
        }
        
        // Play the sound file via SKAction. 
        run(SKAction.playSoundFileNamed(soundString, waitForCompletion: false))
        
    }
}
