// Sources/LipglossSwift/LipglossSwift.swift
import CLipgloss

// Re-export core types
@_exported import struct Foundation.Data
@_exported import struct Foundation.URL

// MARK: - Public API

public final class Lipgloss {
    // Version information
    public static let version = "1.0.0"
    
    // MARK: - Factory Methods
    
    /// Creates a new style
    public static func newStyle() -> Style {
        return Style()
    }
    
    // MARK: - Border Factories
    
    public static func normalBorder() -> Border {
        return Border.normal
    }
    
    public static func roundedBorder() -> Border {
        return Border.rounded
    }
    
    public static func doubleBorder() -> Border {
        return Border.double
    }
    
    public static func thickBorder() -> Border {
        return Border.thick
    }
    
    public static func hiddenBorder() -> Border {
        return Border.hidden
    }
    
    // MARK: - Layout Helpers
    
    public static func joinHorizontal(position: Position, _ strings: String...) -> String {
        return Layout.joinHorizontal(position: position, strings)
    }
    
    public static func joinVertical(position: Position, _ strings: String...) -> String {
        return Layout.joinVertical(position: position, strings)
    }
    
    public static func place(width: Int32, height: Int32, 
                           horizontal: Position, vertical: Position, 
                           _ string: String) -> String {
        return Layout.place(width: width, height: height, 
                          horizontal: horizontal, vertical: vertical, 
                          string)
    }
    
    // MARK: - Color Profile Management
    
    public static func setColorProfile(_ profile: String) {
        SetColorProfile(profile.toCString())
    }
    
    public static func setHasDarkBackground(_ isDark: Bool) {
        SetHasDarkBackground(isDark)
    }
    
    public static var hasDarkBackground: Bool {
        HasDarkBackground()
    }

    public static var colorProfile: String {
        String(cString: ColorProfile())
    }

    public static func height(of text: String) -> Int32 {
        Int32(Height(text.toCString()))
    }

    public static func width(of text: String) -> Int32 {
        Int32(Width(text.toCString()))
    }
}

extension Lipgloss {
    public static func setDefaultRenderer() {
        DefaultRenderer()
    }

}
