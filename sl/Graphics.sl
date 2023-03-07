@Point {

	= { :self :aPoint |
		self.x = aPoint.x & {
			self.y = aPoint.y
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

	dotProduct { :self :aPoint |
		(self.x * aPoint.x) + (self.y * aPoint.y)
	}

	isPoint { :self |
		true
	}

	max { :self :aPoint |
		self.x.max(aPoint.x) @ self.y.max(aPoint.y)
	}

	min { :self :aPoint |
		self.x.min(aPoint.x) @ self.y.min(aPoint.y)
	}

}

+@Object {

	isPoint { :self |
		false
	}

}

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

+SmallFloat {

	Colour { :self :g :b |
		Colour(self, g, b, 1)
	}

	Colour { :self :g :b :a |
		newColour().initializeSlots(self, g, b, a)
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

PolarPoint : [Object, Point] { | r t |

	PolarPoint { :self |
		self
	}

	x { :self |
		self.r * self.t.cos
	}

	y { :self |
		self.r * self.t.sin
	}

}

+@Number {

	PolarPoint { :self :t |
		newPolarPoint().initializeSlots(self, t)
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

	swallow { :self :aRectangle |
		self.origin := self.origin.min(aRectangle.origin);
		self.corner := self.corner.max(aRectangle.corner)
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
		self.corner.x - self.origin.x
	}

	x { :self |
		origin.x
	}

	y { :self |
		origin.y
	}

}

+@Point {

	Rectangle { :self :aPoint |
		newRectangle().initializeSlots(self, aPoint)
	}

}

+Array {

	computeBoundingBox { :self |
		| box = Rectangle(self[1], self[1]); |
		self.do { :aPoint |
			box.swallow(Rectangle(aPoint, aPoint))
		};
		box
	}

}

Vector2 : [Object, Point] { | x y |

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
		self.x.printString ++ '@' ++ self.y.printString
	}

	Point { :self |
		self
	}

	r { :self |
		(* r = radius = rho *)
		(self.x.squared + self.y.squared).sqrt
	}

	storeString { :self |
		'Point(' ++ self.x.printString ++ ', ' ++ self.y.printString ++ ')'
	}

	t { :self |
		(* t = theta *)
		atan2(self.y, self.x)
	}

}

+@Number {

	adaptToPointAndApply { :self :aPoint :aProcedure:/2 |
		aProcedure(aPoint, self.Point)
	}

	at { :self :y |
		Vector2(self, y)
	}

	Point { :self |
		Point(self, self)
	}

	Point { :self :y |
		Vector2(self, y)
	}

	Vector2 { :self :y |
		newVector2().initializeSlots(self, y)
	}

}

Vector3 : [Object] { | x y z |

	Vector2 { :self |
		Vector2(x, y)
	}

}

+@Number {

	Vector3 { :self :y :z |
		newVector3().initializeSlots(self, y, z)
	}

}

Vector4 : [Object] { | x y z w |

	Vector2 { :self |
		Vector2(x, y)
	}

	Vector3 { :self |
		Vector3(x, y, z)
	}

}

+@Number {

	Vector4 { :self :y :z :w |
		newVector4().initializeSlots(self, y, z, w)
	}

}
