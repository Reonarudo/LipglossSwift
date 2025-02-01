# LipglossSwift

A Swift wrapper for [Lipgloss](https://github.com/charmbracelet/lipgloss), the elegant terminal styling library.

LipglossSwift brings Lipgloss's powerful terminal styling capabilities to Swift applications, making it easy to create beautiful terminal user interfaces with style inheritance, borders, layout, and more.

## Features

- 🎨 Rich text styling (bold, italic, underline, strikethrough, colors)
- 📏 Flexible layouts with padding and margins
- 🖼️ Multiple border styles (normal, rounded, thick, double)
- 🎯 Precise positioning and alignment
- 🎭 Dark/light background adaptation
- 🌈 Full color support (basic colors, 256 colors, truecolor)

## Installation

Add LipglossSwift to your Swift package dependencies:

```swift
dependencies: [
    .package(url: "https://github.com/Reonarudo/LipglossSwift.git", from: "1.0.0")
]
```

The package includes all necessary dependencies, including the Lipgloss library bindings.

## Quick Start

```swift
import LipglossSwift

// Initialize the renderer
Lipgloss.setDefaultRenderer()

// Create a styled text
let style = Lipgloss.newStyle()
    .bold(true)
    .foreground("#FAFAFA")
    .background("#7D56F4")
    .paddingTop(2)
    .paddingLeft(4)
    .width(22)

print(style.render("Hello, Lipgloss!"))
```

## Core Components

### Style

The Style class provides methods for text styling:

```swift
let style = Lipgloss.newStyle()
    .bold()
    .italic()
    .underline()
    .foreground("#FF0000")
    .background("#000000")
```

### Border

Create and customize borders:

```swift
// Use predefined borders
let normalBorder = Border.normal
let roundedBorder = Border.rounded

// Create custom borders
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

// Apply border to style
let style = Lipgloss.newStyle().border(normalBorder)
```

### Layout

Position and align content:

```swift
// Join strings horizontally
let horizontal = Lipgloss.joinHorizontal(position: .center, "Left", "Right")

// Join strings vertically
let vertical = Lipgloss.joinVertical(position: .top, "Top", "Bottom")

// Place content with specific dimensions
let placed = Lipgloss.place(
    width: 20,
    height: 3,
    horizontal: .center,
    vertical: .center,
    "Centered Text"
)
```

## Position

Control alignment and positioning:

```swift
// Standard positions
Position.top
Position.bottom
Position.center
Position.left
Position.right

// Custom position
Position.custom(0.75) // 75% from start
```

## Color Support

LipglossSwift supports various color formats:

```swift
// Hex colors (recommended)
style.foreground("#FF0000")
style.background("#0000FF")

// ANSI color numbers (0-255)
style.foreground("12")  // Light blue
style.background("196") // Bright red

// Color profile management
print(Lipgloss.colorProfile) // Check current color profile
Lipgloss.setColorProfile("truecolor") // Set specific profile: "ascii", "ansi", "ansi256", or "truecolor"

// Dark/Light mode support
Lipgloss.setHasDarkBackground(true)
```

Note: While some terminal styling libraries support named colors like "blue", LipglossSwift follows Lipgloss's convention of using hex colors and ANSI color numbers. Use hex colors for the most consistent results.

## Examples

Here's a complete example creating a styled box with content:

```swift
let style = Lipgloss.newStyle()
    .border(Border.rounded)
    .bold(true)
    .foreground("#FAFAFA")
    .background("#7D56F4")
    .padding(1, 2, 1, 2)
    .align(.center)

print(style.render("Welcome to LipglossSwift!"))
```

## Credits

LipglossSwift is a Swift wrapper around [Lipgloss](https://github.com/charmbracelet/lipgloss), created by [Charm](https://charm.sh). All credit for the underlying styling engine goes to the Lipgloss team:

- [All Lipgloss contributors](https://github.com/charmbracelet/lipgloss/graphs/contributors)

## License

This project is licensed under MIT License - see the LICENSE file for details.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## Support

If you encounter any issues or have questions:

1. Check the [Issues](https://github.com/Reonarudo/LipglossSwift/issues) section
2. For Lipgloss-specific questions, refer to the [Lipgloss documentation](https://github.com/charmbracelet/lipgloss)
3. Open a new issue if needed