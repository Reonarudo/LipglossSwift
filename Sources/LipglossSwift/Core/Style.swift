// Sources/LipglossSwift/Core/Style.swift
import CLipgloss

public final class Style {
    private var id: UInt64
    
    public init() {
        id = NewStyle()
    }
    
    deinit {
        FreeStyle(id)
    }
    
    // MARK: - Text Properties
    
    @discardableResult
    public func bold(_ enabled: Bool = true) -> Style {
        id = StyleBold(id, enabled ? 1 : 0)
        return self
    }
    
    @discardableResult
    public func italic(_ enabled: Bool = true) -> Style {
        id = StyleItalic(id, enabled ? 1 : 0)
        return self
    }
    
    @discardableResult
    public func underline(_ enabled: Bool = true) -> Style {
        id = StyleUnderline(id, enabled ? 1 : 0)
        return self
    }
    
    @discardableResult
    public func strikethrough(_ enabled: Bool = true) -> Style {
        id = StyleStrikethrough(id, enabled ? 1 : 0)
        return self
    }
    
    @discardableResult
    public func faint(_ enabled: Bool = true) -> Style {
        id = StyleFaint(id, enabled ? 1 : 0)
        return self
    }

    @discardableResult
    public func blink(_ enabled: Bool = true) -> Style {
        id = StyleBlink(id, enabled ? 1 : 0)
        return self
    }

    @discardableResult
    public func reverse(_ enabled: Bool = true) -> Style {
        id = StyleReverse(id, enabled ? 1 : 0)
        return self
    }
    
    // MARK: - Colors
    
    @discardableResult
    public func foreground(_ color: String) -> Style {
        id = StyleForeground(id, color.toCString())
        return self
    }
    
    @discardableResult
    public func background(_ color: String) -> Style {
        id = StyleBackground(id, color.toCString())
        return self
    }
    
    @discardableResult
    public func borderForeground(_ color: String) -> Style {
        id = StyleBorderForeground(id, color.toCString())
        return self
    }
    
    @discardableResult
    public func borderBackground(_ color: String) -> Style {
        id = StyleBorderBackground(id, color.toCString())
        return self
    }
    
    // MARK: - Layout
    
    @discardableResult
    public func padding(_ top: Int32, _ right: Int32, _ bottom: Int32, _ left: Int32) -> Style {
        id = StylePadding(id, top, right, bottom, left)
        return self
    }

    @discardableResult
    public func paddingTop(_ top: Int32) -> Style {
        id = StylePaddingTop(id, top)
        return self
    }

    @discardableResult
    public func paddingRight(_ right: Int32) -> Style {
        id = StylePaddingRight(id, right)
        return self
    }

    @discardableResult
    public func paddingBottom(_ bottom: Int32) -> Style {
        id = StylePaddingBottom(id, bottom)
        return self
    }

    @discardableResult
    public func paddingLeft(_ left: Int32) -> Style {
        id = StylePaddingLeft(id, left)
        return self
    }
    
    @discardableResult
    public func margin(_ top: Int32, _ right: Int32, _ bottom: Int32, _ left: Int32) -> Style {
        id = StyleMargin(id, top, right, bottom, left)
        return self
    }
    
    @discardableResult
    public func width(_ width: Int32) -> Style {
        id = StyleWidth(id, width)
        return self
    }
    
    @discardableResult
    public func height(_ height: Int32) -> Style {
        id = StyleHeight(id, height)
        return self
    }
    
    @discardableResult
    public func maxWidth(_ width: Int32) -> Style {
        id = StyleMaxWidth(id, width)
        return self
    }
    
    @discardableResult
    public func maxHeight(_ height: Int32) -> Style {
        id = StyleMaxHeight(id, height)
        return self
    }
    
    // MARK: - Border
    
    @discardableResult
    public func border(_ border: Border) -> Style {
        id = StyleBorder(id, border.cBorder)
        return self
    }
    
    // MARK: - Alignment
    
    @discardableResult
    public func align(_ position: Position) -> Style {
        id = StyleAlignHorizontal(id, position.rawValue)
        return self
    }
    
    @discardableResult
    public func alignVertical(_ position: Position) -> Style {
        id = StyleAlignVertical(id, position.rawValue)
        return self
    }
    
    // MARK: - Rendering
    
    public func render(_ text: String) -> String {
        guard let rendered:UnsafeMutablePointer<CChar> = StyleRender(id, text.toCString()) else { return "" }
        defer { FreeString(rendered) }
        let result = String(cString: rendered)
        return result
    }

    
    // MARK: - Copy
    
    public func copy() -> Style {
        let style = Style()
        style.id = CopyStyle(id)
        return style
    }
}