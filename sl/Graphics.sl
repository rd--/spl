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

	abs { :self |
		self.x.abs @ self.y.abs
	}

	closeTo { :self :aPoint |
		self.x.closeTo(aPoint.x) & {
			self.y.closeTo(aPoint.y)
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
		|( [r, g, b, a] = self )|
		Colour(r, g, b, a)
	}

}

+String {

	parseHexColour { :self |
		(self.size = 7).if {
			|(
				r = self.copyFromTo(2, 3),
				g = self.copyFromTo(4, 5),
				b = self.copyFromTo(6, 7)
			)|
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
		|( h = self.height, w = self.width )|
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

	ceiling { :self |
		self.isIntegral.if {
			self
		} {
			self.x.ceiling @ self.y.ceiling
		}
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

	floor { :self |
		self.isIntegral.if {
			self
		} {
			self.x.floor @ self.y.floor
		}
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

	isIntegral { :self |
		self.x.isInteger & {
			self.y.isInteger
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

	rounded { :self |
		self.isIntegral.if {
			self
		} {
			self.x.rounded @ self.y.rounded
		}
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
		|( box = Rectangle(self[1], self[1]) )|
		self.do { :aPoint |
			box.swallow(Rectangle(aPoint, aPoint))
		};
		box
	}

}

Vector2 : [Object, Number, Point] { | x y |

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

	// { :self :anObject |
		anObject.isPoint.if {
			Point(self.x // anObject.x, self.y // anObject.y)
		} {
			anObject.adaptToPointAndApply(self, dividedByDividedBy:/2)
		}
	}

	% { :self :anObject |
		anObject.isPoint.if {
			Point(self.x % anObject.x, self.y % anObject.y)
		} {
			anObject.adaptToPointAndApply(self, modulo:/2)
		}
	}

	adaptToNumberAndApply { :self :aNumber :aProcedure:/2 |
		aProcedure(aNumber @ aNumber, self)
	}

	Array { :self |
		[self.x, self.y]
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

	@ { :self :y |
		Vector2(self, y)
	}

	adaptToPointAndApply { :self :aPoint :aProcedure:/2 |
		aProcedure(aPoint, self.Point)
	}

	Point { :self :y |
		Vector2(self, y)
	}

	Vector2 { :self :y |
		newVector2().initializeSlots(self, y)
	}

}

Vector3 : [Object] { | x y z |

	= { :self :anObject |
		anObject.isVector3.if {
			(self.x = anObject.x) & { self.y = anObject.y } & { self.z = anObject.z }
		} {
			false
		}
	}

	Array { :self |
		[self.x, self.y, self.z]
	}

	xy { :self |
		Vector2(self.x, self.y)
	}

	xz { :self |
		Vector2(self.x, self.z)
	}

	yz { :self |
		Vector2(self.y, self.z)
	}

}

+@Number {

	Vector3 { :self :y :z |
		newVector3().initializeSlots(self, y, z)
	}

}

+Array {

	Vector3 { :self |
		(self.size ~= 3).if {
			'Array>>Vector3: not 3-element array'.error
		} {
			|( [x, y, z] = self )|
			Vector3(x, y, z)
		}
	}

}

Vector4 : [Object] { | x y z w |

	Array { :self |
		[self.x, self.y, self.z, self.w]
	}

	xy { :self |
		Vector2(self.x, self.y)
	}

	xyz { :self |
		Vector3(self.x, self.y, self.z)
	}

}

+@Number {

	Vector4 { :self :y :z :w |
		newVector4().initializeSlots(self, y, z, w)
	}

}

+Array {

	Vector4 { :self |
		(self.size ~= 4).if {
			'Array>>Vector4: not 4-element array'.error
		} {
			|( [x, y, z, w] = self )|
			Vector4(x, y, z, w)
		}
	}

}

Matrix22 : [Object] { | a b c d |

	= { :self :aMatrix |
		aMatrix.isMatrix22 & {
			self.a = aMatrix.a & {
				self.b = aMatrix.b & {
					self.c = aMatrix.c & {
						self.d = aMatrix.d
					}
				}
			}
		}
	}

	applyTo { :self :vector |
		Vector2(
			(self.a * vector.x) + (self.b * vector.y),
			(self.c * vector.x) + (self.d * vector.y)
		)
	}

	Array { :self |
		[self.a, self.b, self.c, self.d]
	}

	copy { :self |
		Matrix22(self.a, self.b, self.c, self.d)
	}

	determinant { :self |
		(self.a * self.d) - (self.b * self.c)
	}

	identity { :self |
		self.initializeSlots(
			1, 0,
			0, 1
		)
	}

	inverse { :self |
		self.copy.invert
	}

	invert { :self |
		|( m = 1 / self.determinant )|
		self.initializeSlots(
			self.d * m, self.b.negated * m,
			self.c.negated * m, self.a * m
		)
	}

	rotation { :self :n |
		self.initializeSlots(
			n.cos, n.sin,
			n.sin.negated, n.cos
		)
	}

	transpose { :self |
		|( b = self.b, c = self.c )|
		self.b := c;
		self.c := b
	}

	transposed { :self |
		Matrix22(self.a, self.c, self.b, self.d)
	}

}

+Void {

	Matrix22 {
		newMatrix22()
	}

}

+@Number {

	Matrix22 { :self :b :c :d |
		newMatrix22().initializeSlots(self, b, c, d)
	}

}

+Array {

	Matrix22 { :self |
		(self.size ~= 4).if {
			'Array>>Matrix22: not 4-element array'.error
		} {
			|( [a, b, c, d] = self )|
			Matrix22(a, b, c, d)
		}
	}

}

Matrix33 : [Object] { | elements |

	= { :self :aMatrix |
		aMatrix.isMatrix33 & {
			self.elements = aMatrix.elements
		}
	}

	applyTo { :self :vector |
		|( [a, b, c, d, e, f, g, h, i] = self.elements, [x, y, z] = vector.Array )|
		Vector3(
			(a * x) + (b * y) + (c * z),
			(d * x) + (e * y) + (f * z),
			(g * x) + (h * y) + (i * z)
		)
	}

	Array { :self |
		self.elements.copy
	}

	copy { :self |
		self.elements.copy.Matrix33
	}

	determinant { :self |
		|( [a, b, c, d, e, f, g, h, i] = self.elements )|
		(a * e * i) + (b * f * g) + (c * d * h) - (c * e * g) - (b * d * i) - (a * f * h)
	}

	inverse { :self |
		self.copy.invert
	}

	invert { :self |
		|( [a, b, c, d, e, f, g, h, i] = self.elements )|
		self.elements := self.determinant * [
			(e * i) - (f * h), ((b * i) - (c * h)).negated, (b * f) - (c * e),
			((d * i) - (f * g)).negated, (a * i) - (c * g), ((a * f) - (c * d)).negated,
			(d * h) - (e * g), ((a * h).negated - (b * g)), (a * e) - (b * d)
		];
		self
	}

	identity { :self |
		self.elements := [
			1, 0, 0,
			0, 1, 0,
			0, 0, 1
		]
	}

	xy { :self |
		self.elements := [
			1, 0, 0,
			0, 1, 0,
			0, 0, 0
		]
	}

	xz { :self |
		self.elements := [
			1, 0, 0,
			0, 0, 1,
			0, 0, 0
		]
	}

	yz { :self |
		self.elements := [
			0, 1, 0,
			0, 0, 1,
			0, 0, 0
		]
	}

}

+@Number {

	Matrix33 { :self :b :c :d :e :f :g :h :i |
		[self, b, c, d, e, f, g, h, i].Matrix33
	}

}

+Array {

	Matrix33 { :self |
		(self.size ~= 9).if {
			'Array>>Matrix33: not 9-element array'.error
		} {
			newMatrix33().initializeSlots(self)
		}
	}

}

Projection3 : [Object] { | alpha beta x y z |

	applyTo { :self :vector |
		self.Matrix33.applyTo(vector).xy
	}

	chinese { :self |
		self.initializeSlots(pi / 6, 0, 1, 1, 1 / 2)
	}

	identity { :self |
		self.initializeSlots(0, 0, 1, 1, 1)
	}

	isometric { :self |
		self.initializeSlots(pi / 6, pi / 6, 1, 1, 1)
	}

	Matrix33 { :self |
		Matrix33(
			self.x * self.beta.cos.negated, 0, self.z * self.alpha.cos,
			self.x * self.beta.sin, self.y , self.z * self.alpha.sin,
			0, 0, 0
		)
	}

	procedure { :self |
		|( matrix = self.Matrix33 )|
		{ :aVector |
			matrix.applyTo(aVector).xy
		}
	}

}

+Void {

	Projection3 {
		newProjection3().identity
	}

}
