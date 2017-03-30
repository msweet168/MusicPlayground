import Foundation
import SpriteKit

public class Interface: SKScene, SKPhysicsContactDelegate {
    
    
    public override func sceneDidLoad() {
        size = CGSize(width: 640, height: 354)
        backgroundColor = .white
        setUpPhysics()
    }
    
    func setUpPhysics() {
        let body = SKPhysicsBody(edgeLoopFrom: frame)
        body.categoryType = .scene
        physicsWorld.contactDelegate = self
        physicsWorld.gravity = CGVector(dx: 0, dy: -9.8)
        physicsBody?.restitution = 0
        physicsBody?.linearDamping = 0.0
        physicsBody = body
    }

    
    public func didBegin(_ contact: SKPhysicsContact) {

        let barrierNode = (contact.bodyA.node as? BarrierNode) ?? (contact.bodyB.node as? BarrierNode)
        let soundNode = (contact.bodyA.node as? SoundNode) ?? (contact.bodyB.node as? SoundNode)
        
        if barrierNode != nil {
            print("Barrier")
            soundNode?.playSound(octave: .medium)
            
        }
        else if let sound = soundNode {
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
    
    var shapeType: ObjectType = .bass
    
    var path:UIBezierPath?
    
    
    //FIXME: Barriers will disappear if the rectangle around them is touched. This must be limited to the line itself. 
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first!
        let location = touch.location(in: self)
        
        if shapeType == .barrier {
            
            path = UIBezierPath()
            path?.lineWidth = 20.0
            path?.lineCapStyle = .round
            path?.move(to: location)
            
            return
        }
        
        
        let existing = nodes(at: location)
        if existing.isEmpty {
            addObject(point: location)
        } else {
            removeChildren(in: existing)
        }
        
    }
    
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let path = path {
            let touch = touches.first!
            let location = touch.location(in: self)
            path.addLine(to: location)
            let node = BarrierNode(path: path)
            addChild(node)
            self.path = nil
        }
    }
    
    
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
