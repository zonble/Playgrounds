import Cocoa
import XCPlayground

struct Point {
	var x :Double = 0
	var y :Double = 0
}

struct Circle {
	var center :Point
	var radius :Double
	init(center :Point, radius :Double) {
		self.center = center
		self.radius = radius
	}

	init(p1 :Point, p2 :Point, p3: Point) {
		let offset = pow(p2.x, 2) + pow(p2.y, 2)
		let bc = (pow(p1.x, 2) + pow(p1.y, 2) - offset) / 2.0
		let cd = (offset - pow(p3.x, 2) - pow(p3.y, 2)) / 2.0
		let det = (p1.x - p2.x) * (p2.y - p3.y) - (p2.x - p3.x) * (p1.y - p2.y)

		if abs(det) <= 0 {
			self =  Circle(center: Point(x: 0,y: 0), radius: 0)
			return
		}

		let idet = 1/det
		let centerx = (bc * (p2.y - p3.y) - cd * (p1.y - p2.y)) * idet
		let centery = (cd * (p1.x - p2.x) - bc * (p2.x - p3.x)) * idet
		let radius = sqrt(pow(p2.x - centerx, 2) + pow(p2.y - centery, 2))
		self = Circle(center: Point(x: centerx, y: centery), radius: radius)
	}
}

class MyView : NSView {
	var p1: Point? {
	didSet {
		self.setNeedsDisplayInRect(self.bounds)
	}}
	var p2: Point? {
	didSet {
		self.setNeedsDisplayInRect(self.bounds)
	}}
	var p3: Point? {
	didSet {
		self.setNeedsDisplayInRect(self.bounds)
	}}
	var circle :Circle? {
	didSet {
	self.setNeedsDisplayInRect(self.bounds)
	}}
	override func drawRect(dirtyRect: NSRect) {
		if let c = circle {
			let rect = NSMakeRect(c.center.x - c.radius, c.center.y - c.radius, c.radius * 2, c.radius * 2)
			let path = NSBezierPath(ovalInRect: rect);
			NSColor.redColor().set()
			path.stroke()
		}
		func drawPoint(point :Point?) {
			if let p = point {
				let rect = NSMakeRect(p.x - 5, p.y - 5, 10, 10)
				let path = NSBezierPath(ovalInRect: rect);
				NSColor.redColor().set()
				path.fill()
			}
		}
		drawPoint(self.p1)
		drawPoint(self.p2)
		drawPoint(self.p3)
	}
}

var view : MyView = MyView(frame: NSMakeRect(0, 0, 400, 400))
let p1 = Point(x: 20, y: 20)
let p2 = Point(x: 300, y: 200)
let p3 = Point(x: 400, y: 30)
view.p1 = p1
view.p2 = p2
view.p3 = p3
view.circle = Circle(p1:p1, p2:p2, p3:p3)

XCPShowView("circle", view)





