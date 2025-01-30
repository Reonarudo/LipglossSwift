// Sources/LipglossSwift/Core/Layout.swift
import CLipgloss

public enum Layout {
    public static func joinHorizontal(position: Position, _ strings: [String]) -> String {
        guard strings.count >= 2 else { return strings.first ?? "" }
        
        var result = strings[0]
        for i in 1..<strings.count {
            guard let joined = JoinHorizontal(position.rawValue, result.toCString(), strings[i].toCString()) else { continue }
            defer { FreeString(joined) }
            result = String(cString: joined)
        }
        
        return result
    }
    
    public static func joinVertical(position: Position, _ strings: [String]) -> String {
        guard strings.count >= 2 else { return strings.first ?? "" }
        
        var result = strings[0]
        for i in 1..<strings.count {
            guard let joined = JoinVertical(position.rawValue, result.toCString(), strings[i].toCString()) else { continue }
            defer { FreeString(joined) }
            result = String(cString: joined)
        }
        
        return result
    }
    
    public static func place(width: Int32, height: Int32, horizontal: Position, vertical: Position, _ string: String) -> String {
        guard let placed = Place(width, height, horizontal.rawValue, vertical.rawValue, string.toCString()) else {
            return string
        }
        defer { FreeString(placed) }
        return String(cString: placed)
    }
}