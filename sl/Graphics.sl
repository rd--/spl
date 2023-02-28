Colour : [Object] { | red green blue alpha |

	hexString { :self |
		'#' ++ [self.red, self.green, self.blue].collect { :each |
			(each * 255).rounded.byteHexString
		}.join
	}

	printString { :self |
		[
			'Colour(',
			[
				self.red,
				self.green,
				self.blue,
				self.alpha
			].collect(printString:/1).joinSeparatedBy(','),
			')'
		].join
	}

}

+Number {

	Colour { :r :g :b |
		Colour(r, g, b, 1)
	}

	Colour { :r :g :b :a |
		newColour().initializeSlots(r, g, b, a)
	}

}

+Array {

	Colour { :self |
		| [r, g, b, a] = self; |
		Colour(r, g, b, a)
	}

}

+String {

	parseHexColour { :self |
		(self.size = 7).if {
			|
				r = self.copyFromTo(2, 3),
				g = self.copyFromTo(4, 5),
				b = self.copyFromTo(6, 7);
			|
			[r, g, b, 'ff'].collect { :each |
				each.parseInteger(16) / 255
			}.Colour
		} {
			('String>>parseHexColour: ' ++ self).error
		}
	}

}

@Point {

	= { :self :anObject |
		self.x = anObject.x & {
			self.y = anObject.y
		}
	}

	< { :self :aPoint |
		self.x < aPoint.x & {
			self.y < aPoint.y
		}
	}

	<= { :self :aPoint |
		self.x <= aPoint.x & {
			self.y <= aPoint.y
		}
	}

	max { :self :aPoint |
		self.x.max(aPoint.x) @ self.y.max(aPoint.y)
	}

	min { :self :aPoint |
		self.x.min(aPoint.x) @ self.y.min(aPoint.y)
	}

	r { :self |
		(* r = radius = rho *)
		(self.x.squared + self.y.squared).sqrt
	}

	t { :self |
		(* t = theta *)
		atan2(self.y, self.x)
	}

	x { :self |
		self.r * self.t.cos
	}

	y { :self |
		self.r * self.t.sin
	}

}

Point : [Object, Point] { | x y |

	= { :self :anObject |
		anObject.isPoint.if {
			(self.x = anObject.x) & { self.y = anObject.y }
		} {
			false
		}
	}

	+ { :self :anObject |
		anObject.isPoint.if {
			Point(self.x + anObject.x, self.y + anObject.y)
		} {
			anObject.adaptToPointAndApply(self, plus:/2)
		}
	}

	- { :self :anObject |
		anObject.isPoint.if {
			Point(self.x - anObject.x, self.y - anObject.y)
		} {
			anObject.adaptToPointAndApply(self, minus:/2)
		}
	}

	* { :self :anObject |
		anObject.isPoint.if {
			Point(self.x * anObject.x, self.y * anObject.y)
		} {
			anObject.adaptToPointAndApply(self, times:/2)
		}
	}

	/ { :self :anObject |
		anObject.isPoint.if {
			Point(self.x / anObject.x, self.y / anObject.y)
		} {
			anObject.adaptToPointAndApply(self, dividedBy:/2)
		}
	}

	adaptToNumberAndApply { :self :aNumber :aProcedure:/2 |
		aProcedure(aNumber.Point, self)
	}

	collect { :self :aProcedure:/1 |
		Point(self.x.aProcedure, self.y.aProcedure)
	}

	negate { :self |
		self.collect(negate:/1)
	}

	printString { :self |
		'Point(' ++ self.x.printString ++ ', ' ++ self.y.printString ++ ')'
	}

	Point { :self |
		self
	}

}

+@Number {

	adaptToPointAndApply { :self :aPoint :aProcedure:/2 |
		aProcedure(aPoint, self.Point)
	}

	at { :self :aNumber |
		Point(self, aNumber)
	}

	Point { :self |
		Point(self, self)
	}

	Point { :self :aNumber |
		newPoint().initializeSlots(self, aNumber)
	}

}

Rectangle : [Object] { | origin corner |

	= { :self :aRectangle |
		aRectangle.isRectangle & {
			self.origin = aRectangle.origin
		} & {
			self.corner = aRectangle.corner
		}
	}

	area { :self |
		| h = self.height, w = self.width; |
		(h <= 0 | { w <= 0 }).if {
			0
		} {
			w * h
		}
	}

	bottomLeft { :self |
		self.origin.x @ self.corner.y
	}

	bottomRight { :self |
		self.corner
	}

	center { :self |
		self.topLeft + self.bottomRight / 2
	}

	containsPoint { :self :aPoint |
		self.origin <= aPoint & {
			aPoint < self.corner
		}
	}

	encompass { :self :aPoint |
		Rectangle(
			self.origin.min(aPoint),
			self.corner.max(aPoint)
		)
	}

	extent { :self |
		self.corner - self.origin
	}

	height { :self |
		self.corner.y - self.origin.y
	}

	intersect { :self :aRectangle |
		Rectangle(
			self.origin.max(aRectangle.origin),
			self.corner.min(aRectangle.corner)
		)
	}

	intersects { :self :aRectangle |
		self.origin.max(aRectangle.origin) < self.corner.min(aRectangle.corner)
	}

	intersectsAny { :self :rectangleList |
		withReturn {
			rectangleList.do { :r |
				self.intersects(r).ifTrue {
					true.return
				}
			};
			false
		}
	}

	left { :self |
		self.origin.x
	}

	merge { :self :aRectangle |
		Rectangle(
			self.origin.min(aRectangle.origin),
			self.corner.max(aRectangle.corner)
		)
	}

	printString { :self |
		'Rectangle(' ++ self.origin.printString ++ ', ' ++ self.corner.printString ++ ')'
	}

	scaleBy { :self :scale |
		Rectangle(self.origin * scale, self.corner * scale)
	}

	topLeft { :self |
		self.origin
	}

	topRight { :self |
		self.corner.x @ self.origin.y
	}

	translateBy { :self :factor |
		Rectangle(self.origin + factor, self.corner + factor)
	}

	width { :self |
		self.corner.y - self.origin.y
	}

	x { :self |
		origin.x
	}

	y { :self |
		origin.y
	}

}

+Point {

	Rectangle { :self :aPoint |
		newRectangle().initializeSlots(self, aPoint)
	}

}
