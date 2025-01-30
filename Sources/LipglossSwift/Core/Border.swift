// Sources/LipglossSwift/Core/Border.swift
import CLipgloss

public final class Border {
    internal let cBorder: CBorder
    
    internal init(cBorder: CBorder) {
        self.cBorder = cBorder
    }
    
    deinit {
        FreeBorder(cBorder)
    }
    
    public static var normal: Border {
        return Border(cBorder: NormalBorder())
    }
    
    public static var rounded: Border {
        return Border(cBorder: RoundedBorder())
    }
    
    public static var double: Border {
        return Border(cBorder: DoubleBorder())
    }
    
    public static var thick: Border {
        return Border(cBorder: ThickBorder())
    }
    
    public static var block: Border {
        return Border(cBorder: BlockBorder())
    }
    
    public static var hidden: Border {
        return Border(cBorder: HiddenBorder())
    }
    
    public static func custom(
        top: String = "",
        bottom: String = "",
        left: String = "",
        right: String = "",
        topLeft: String = "",
        topRight: String = "",
        bottomLeft: String = "",
        bottomRight: String = "",
        middleLeft: String = "",
        middleRight: String = "",
        middle: String = "",
        middleTop: String = "",
        middleBottom: String = ""
    ) -> Border {
        return Border(cBorder: CreateCustomBorder(
            top.toCString(),
            bottom.toCString(),
            left.toCString(),
            right.toCString(),
            topLeft.toCString(),
            topRight.toCString(),
            bottomLeft.toCString(),
            bottomRight.toCString(),
            middleLeft.toCString(),
            middleRight.toCString(),
            middle.toCString(),
            middleTop.toCString(),
            middleBottom.toCString()
        ))
    }
}
