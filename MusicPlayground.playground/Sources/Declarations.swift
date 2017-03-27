import Foundation
import SpriteKit

struct NodeType: OptionSet {
    let rawValue: UInt32
    static let scene = NodeType(rawValue: 1 << 0)
    static let bass = NodeType(rawValue: 1 << 1)
    static let lead = NodeType(rawValue: 1 << 2)
    static let drum = NodeType(rawValue: 1 << 3)
    static let barrier = NodeType(rawValue: 1 << 4)
}

/// Support on SKPhysicsBody for option-set based bitmasks
/// to replace the bug-prone integer bitmasks.
extension SKPhysicsBody {
    /// The "category" of this node.
    var categoryType: NodeType {
        get { return NodeType(rawValue: categoryBitMask) }
        set { categoryBitMask = newValue.rawValue }
    }
    /// The categories of nodes that will cause a collision with this node.
    var collisionType: NodeType {
        get { return NodeType(rawValue: collisionBitMask) }
        set { collisionBitMask = newValue.rawValue }
    }
    /// The categories of nodes that will cause a call to didBegin/didEndContact.
    var contactTestType: NodeType {
        get { return NodeType(rawValue: contactTestBitMask) }
        set { contactTestBitMask = newValue.rawValue }
    }
}

enum ObjectType {
    case bass
    case lead
    case drums
    case barrier
}
