// Sources/LipglossSwift/Core/Position.swift
import CLipgloss

public enum Position {
    case top
    case bottom
    case center
    case left
    case right
    case custom(Double)
    
    var rawValue: Double {
        switch self {
        case .top, .left:
            return 0.0
        case .bottom, .right:
            return 1.0
        case .center:
            return 0.5
        case .custom(let value):
            return value
        }
    }
}

// Convenient static values
public extension Position {
    static var horizontal: Position { .center }
    static var vertical: Position { .center }
}