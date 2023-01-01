import PlatformGraphics
import Foundation
import Utils

// Create a new image and a graphics context
let ctx = try PlatformGraphicsContext(width: 300, height: 300)

// Draw some shapes
ctx.draw(line: LineSegment(fromX: 20, y: 20, toX: 50, y: 30))
ctx.draw(rect: Rectangle(fromX: 80, y: 90, width: 10, height: 40, color: .yellow))
ctx.draw(text: Text("Test", at: Vec2(x: 0, y: 15)))
ctx.draw(ellipse: Ellipse(centerX: 150, y: 80, radius: 40))

// Encode the image to a byte buffer
let image = try ctx.makeImage()
let data = try image.pngEncoded()

try data.write(to: URL(fileURLWithPath: "Output/shapes.png"))