// Source/LipglossDemo/LipglossSwiftDemo.swift
import Foundation
import LipglossSwift

@main
struct LipglossSwiftDemo {
    static func printSection(_ title: String) {
        print("\n=== \(title) ===\n")
    }
    
    static func testBasicUtilities() {
        printSection("Basic Utilities")
        
        // Initialize renderer
        Lipgloss.setDefaultRenderer()
        
        let profile = Lipgloss.colorProfile
        print("Color Profile: \(profile)")
        
        print("Has Dark Background: \(Lipgloss.hasDarkBackground ? "true" : "false")")
        
        let testStr = "Hello\nWorld"
        print("Height of multiline string: \(Lipgloss.height(of: testStr))")
        print("Width of multiline string: \(Lipgloss.width(of: testStr))")
    }
    
    static func demoQuickStart() {
        printSection("Quick Start Example")
        
        let style = Lipgloss.newStyle()
            .bold(true)
            .foreground("#FAFAFA")
            .background("#7D56F4")
            .paddingTop(2)
            .paddingLeft(4)
            .width(22)
        
        print(style.render("Hello, Lipgloss!"))
    }
    
    static func demoStyles() {
        printSection("Style Examples")
        
        // Basic styling
        let style = Lipgloss.newStyle()
            .bold()
            .italic()
            .underline()
            .foreground("#FF0000")
            .background("#000000")
        
        print(style.render("Styled Text"))
        
        // Style removal
        let removedStyle = style
            .bold(false)
            .italic(false)
            .underline(false)
        
        print(removedStyle.render("Styles Removed"))
        
        // Clean style
        let cleanStyle = Lipgloss.newStyle()
        print(cleanStyle.render("Clean Style"))
    }
    
    static func demoBorders() {
        printSection("Border Examples")
        
        // Predefined borders
        print("Normal Border:")
        let normalStyle = Lipgloss.newStyle().border(Border.normal)
        print(normalStyle.render("Hello with normal border"))
        
        print("\nRounded Border:")
        let roundedStyle = Lipgloss.newStyle().border(Border.rounded)
        print(roundedStyle.render("Hello with rounded border"))
        
        print("\nCustom Border:")
        let customBorder = Border.custom(
            top: "-",
            bottom: "-",
            left: "|",
            right: "|",
            topLeft: "+",
            topRight: "+",
            bottomLeft: "+",
            bottomRight: "+"
        )
        let customStyle = Lipgloss.newStyle().border(customBorder)
        print(customStyle.render("Hello with custom border"))
    }
    
    static func demoLayout() {
        printSection("Layout Examples")
        
        // Horizontal join
        print("Horizontal Join:")
        let horizontal = Lipgloss.joinHorizontal(position: .center, "Left", "Right")
        print(horizontal)
        
        // Vertical join
        print("\nVertical Join:")
        let vertical = Lipgloss.joinVertical(position: .top, "Top", "Bottom")
        print(vertical)
        
        // Placed content
        print("\nPlaced Content:")
        let placed = Lipgloss.place(
            width: 20,
            height: 3,
            horizontal: .center,
            vertical: .center,
            "Centered Text"
        )
        print(placed)
    }
    
    static func demoColors() {
        printSection("Color Examples")
        
        // Hex colors
        let redStyle = Lipgloss.newStyle().foreground("#FF0000")
        print(redStyle.render("Red text"))
        
        let blueBgStyle = Lipgloss.newStyle().background("#0000FF")
        print(blueBgStyle.render("Blue background"))
        
        // ANSI colors
        let ansiStyle = Lipgloss.newStyle().foreground("12")
        print(ansiStyle.render("ANSI blue text"))
        
        // Color profile
        print("\nCurrent color profile:", Lipgloss.colorProfile)
        
        // Try different color profiles
        let profiles = ["ascii", "ansi", "ansi256", "truecolor"]
        let coloredStyle = Lipgloss.newStyle()
            .foreground("#FF0000")
            .background("#0000FF")
            .bold()
        
        print("\nSame style in different color profiles:")
        for profile in profiles {
            Lipgloss.setColorProfile(profile)
            print("Profile \(profile):", coloredStyle.render("Colored Text"))
        }
    }
    
    static func demoCompleteExample() {
        printSection("Complete Styling Example")
        
        let style = Lipgloss.newStyle()
            .border(Border.rounded)
            .bold(true)
            .foreground("#FAFAFA")
            .background("#7D56F4")
            .padding(1, 2, 1, 2)
            .align(.center)
        
        print(style.render("Welcome to LipglossSwift!"))
    }
    
    static func main() {
        testBasicUtilities()
        demoQuickStart()
        demoStyles()
        demoBorders()
        demoLayout()
        demoColors()
        demoCompleteExample()
        
        print("\n=== Demo completed ===\n")
    }
}