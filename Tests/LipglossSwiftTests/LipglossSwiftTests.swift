// Tests/LipglossSwiftTests/LipglossSwiftTests.swift
import XCTest
@testable import LipglossSwift

final class LipglossSwiftTests: XCTestCase {
    override func setUp() {
        super.setUp()
        // Initialize renderer for all tests
        Lipgloss.setDefaultRenderer()
    }
    // MARK: - Style Tests
    func testBold() {
        let style = Lipgloss.newStyle().bold()
        XCTAssertEqual(style.render("Test Bold"), "\u{1B}[1mTest Bold\u{1B}[0m")
    }
    func testItalic() {
        let style = Lipgloss.newStyle().italic()
        XCTAssertEqual(style.render("Test Italic").debugDescription, "\u{1B}[3mTest Italic\u{1B}[0m".debugDescription)
    }
    
    // MARK: - Layout Tests
    func testJoinHorizontal() {
        let result = Layout.joinHorizontal(position: .center, ["Hello", "World"])
        XCTAssertNotEqual(result, "")
    }
    
    func testJoinVertical() {
        let result = Layout.joinVertical(position: .top, ["Line1", "Line2"])
        XCTAssertNotEqual(result, "")
    }
    
    // MARK: - Border Tests
    func testBorderNormal() {
        let border = Border.normal
        XCTAssertNotNil(border)
    }
    
    func testCustomBorder() {
        let border = Border.custom(top: "-", bottom: "-")
        XCTAssertNotNil(border)
    }
    
    // MARK: - Position Tests
    func testPositionRawValues() {
        XCTAssertEqual(Position.top.rawValue, 0.0)
        XCTAssertEqual(Position.center.rawValue, 0.5)
        XCTAssertEqual(Position.bottom.rawValue, 1.0)
    }
    
    // MARK: - Integration Tests
    func testLipglossFacade() {
        let style = Lipgloss.newStyle().bold()
        XCTAssertNotEqual(style.render("Hello").debugDescription, "Hello")
    }

    func testQuickStartExample() {
        let style = Lipgloss.newStyle()
            .bold(true)
            .foreground("#FAFAFA")
            .background("#7D56F4")
            .paddingTop(2)
            .paddingLeft(4)
            .width(22)
        
        let result = style.render("Hello, Lipgloss!")
        XCTAssertNotEqual(result, "Hello, Lipgloss!")
        XCTAssertTrue(result.contains("Hello, Lipgloss!"))
    }
    
    func testStyleExample() {
        let style = Lipgloss.newStyle()
            .bold()
            .italic()
            .underline()
            .foreground("#FF0000")
            .background("#000000")
        
        let result = style.render("Test")
        XCTAssertNotEqual(result.debugDescription, "Test".debugDescription)
        
        // Test creating a clean style
        let cleanStyle = Lipgloss.newStyle()
        let cleanResult = cleanStyle.render("Test")
        XCTAssertEqual(cleanResult, "Test")
        
        // Test that color styles persist (can't be removed)
        let colorStyle = Lipgloss.newStyle()
            .foreground("#FF0000")
            .background("#000000")
        
        // To remove colors, you need to create a new style
        let noColors = Lipgloss.newStyle()
        
        XCTAssertNotEqual(colorStyle.render("Test"), noColors.render("Test"))
    }
    
    func testBorderExamples() {
        // Test predefined borders
        let normalBorder = Border.normal
        let roundedBorder = Border.rounded
        XCTAssertNotNil(normalBorder)
        XCTAssertNotNil(roundedBorder)
        
        // Test custom border
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
        XCTAssertNotNil(customBorder)
        
        // Test border application
        let style = Lipgloss.newStyle().border(normalBorder)
        let result = style.render("Test Border")
        XCTAssertNotEqual(result, "Test Border")
        XCTAssertTrue(result.contains("Test Border"))
    }
    
    func testLayoutExamples() {
        // Test horizontal join
        let horizontal = Lipgloss.joinHorizontal(position: .center, "Left", "Right")
        XCTAssertTrue(horizontal.contains("Left"))
        XCTAssertTrue(horizontal.contains("Right"))
        
        // Test vertical join
        let vertical = Lipgloss.joinVertical(position: .top, "Top", "Bottom")
        XCTAssertTrue(vertical.contains("Top"))
        XCTAssertTrue(vertical.contains("Bottom"))
        
        // Test placed content
        let placed = Lipgloss.place(
            width: 20,
            height: 3,
            horizontal: .center,
            vertical: .center,
            "Centered Text"
        )
        XCTAssertTrue(placed.contains("Centered Text"))
    }
    
    func testPositionExamples() {
        // Test standard positions
        XCTAssertEqual(Position.top.rawValue, 0.0)
        XCTAssertEqual(Position.bottom.rawValue, 1.0)
        XCTAssertEqual(Position.center.rawValue, 0.5)
        XCTAssertEqual(Position.left.rawValue, 0.0)
        XCTAssertEqual(Position.right.rawValue, 1.0)
        
        // Test custom position
        XCTAssertEqual(Position.custom(0.75).rawValue, 0.75)
    }
    
    func testColorExamples() {
        // Test hex colors
        let hexStyle = Lipgloss.newStyle().foreground("#FF0000")
        XCTAssertNotEqual(hexStyle.render("Red"), "Red")
        
        let hexBgStyle = Lipgloss.newStyle().background("#0000FF")
        XCTAssertNotEqual(hexBgStyle.render("Blue Background"), "Blue Background")
        
        // Test ANSI color numbers
        let ansiStyle = Lipgloss.newStyle().foreground("12")  // Light blue
        XCTAssertNotEqual(ansiStyle.render("ANSI Blue"), "ANSI Blue")
        
        let ansiBgStyle = Lipgloss.newStyle().background("196") // Bright red
        XCTAssertNotEqual(ansiBgStyle.render("ANSI Red Background"), "ANSI Red Background")
        
        // Test color profile
        let currentProfile = Lipgloss.colorProfile
        XCTAssertNotNil(currentProfile)
        
        // Test color profile setting
        Lipgloss.setColorProfile("truecolor")
        XCTAssertEqual(Lipgloss.colorProfile, "truecolor")
        
        // Test dark background mode
        Lipgloss.setHasDarkBackground(true)
        XCTAssertTrue(Lipgloss.hasDarkBackground)
        Lipgloss.setHasDarkBackground(false)
        XCTAssertFalse(Lipgloss.hasDarkBackground)
    }
    
    func testCompleteExample() {
        let style = Lipgloss.newStyle()
            .border(Border.rounded)
            .bold(true)
            .foreground("#FAFAFA")
            .background("#7D56F4")
            .padding(1, 2, 1, 2)
            .align(.center)
        
        let result = style.render("Welcome to LipglossSwift!")
        XCTAssertNotEqual(result, "Welcome to LipglossSwift!")
        XCTAssertTrue(result.contains("Welcome to LipglossSwift!"))
    }
}
