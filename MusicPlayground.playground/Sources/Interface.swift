import Foundation
import SpriteKit

/// Main section of the playground, where all nodes are added.
public class Interface: SKScene, SKPhysicsContactDelegate {
    
    // Sets the size and background color of the scene.
    public override func sceneDidLoad() {
        size = CGSize(width: 640, height: 354)
        backgroundColor = .white
        
        setUpPhysics()
    }
    
    // Creates a physicsBody and sets up the physicsWorld
    func setUpPhysics() {
        let body = SKPhysicsBody(edgeLoopFrom: frame)
        body.categoryType = .scene
        physicsWorld.contactDelegate = self
        physicsWorld.gravity = CGVector(dx: 0, dy: -9.8)
        physicsBody?.restitution = 0
        physicsBody?.linearDamping = 0.0
        physicsBody = body
    }

    // Called when contact between two nodes begins.
    public func didBegin(_ contact: SKPhysicsContact) {
        
        // Checks if a barrierNode was part of the collision.
        let barrierNode = (contact.bodyA.node as? BarrierNode) ?? (contact.bodyB.node as? BarrierNode)
        // Checks if a soundNode was part of the colision, will always be true.
        let soundNode = (contact.bodyA.node as? SoundNode) ?? (contact.bodyB.node as? SoundNode)
        
        // If one node of the collision was a barrierNode, a medium octave will be played.
        if barrierNode != nil {
            soundNode?.playSound(octave: .medium)
            
        }
        else if let sound = soundNode {
            // Checks node's position in the scene and requests that the appropriate octave be played.
            if sound.position.x <= 213 {
                sound.playSound(octave: .low)
            }
            else if (sound.position.x > 213) && (sound.position.x <= 426) {
                sound.playSound(octave: .medium)
            }
            else {
                sound.playSound(octave: .high)
            }

        }
        
    }
    
    // Property which tells what the current selected object is.
    var shapeType: ObjectType = .bass
    
    var path:UIBezierPath?
    
    // Called when scene is touched anywhere.
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first!
        let location = touch.location(in: self)
        
        // If a barrier is the current selected object, a path will be created.
        if shapeType == .barrier {
            
            path = UIBezierPath()
            path?.lineWidth = 20.0
            path?.lineCapStyle = .round
            path?.move(to: location)
            
            return
        }
        
        // If there is a node at the location touched, it will be deleted. If not, a new node will be added at that point.
        let existing = nodes(at: location)
        if existing.isEmpty {
            addObject(point: location)
        } else {
            removeChildren(in: existing)
        }
        
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        // If a barrier path was started, it is created once the user releases.
        if let path = path {
            let touch = touches.first!
            let location = touch.location(in: self)
            path.addLine(to: location)
            let node = BarrierNode(path: path)
            addChild(node)
            self.path = nil
        }
    }
    
    /// Function which adds the selected object to the scene. 
    func addObject(point: CGPoint) {
        let node: SKSpriteNode

        switch shapeType {
        case .bass:
            node = BassNode()
        case .lead:
            node = LeadNode()
        case .drums:
            node = DrumsNode()
        case .barrier:
            fatalError("This shouldn't happen")
        }
        
        node.position = point
        addChild(node)
    }
}
