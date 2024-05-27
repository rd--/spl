{- Requires: RectangularCoordinates CartesianCoordinates FourVector -}

+RectangularCoordinates {

	asPoint { :self |
		self
	}

	isPoint { :self |
		true
	}

	printString { :self |
		[self.x, '@', self.y].stringJoin
	}

}

+CartesianCoordinates {

	asPoint { :self |
		self
	}

	isPoint { :self |
		true
	}

}

+@Object {

	isPoint { :self |
		false
	}

}

+@Number {

	@ { :x :y |
		RectangularCoordinates(x, y)
	}

	Point { :x :y |
		RectangularCoordinates(x, y)
	}

	Point { :x :y :z |
		CartesianCoordinates(x, y, z)
	}

	Point { :w :x :y :z |
		FourVector(w, x, y, z)
	}

}

+List {

	asPoint { :self |
		self.size.caseOfOtherwise([
			{ 2 } -> { self.asRectangularCoordinates },
			{ 3 } -> { self.asCartesianCoordinates },
			{ 4 } -> { self.asFourVector }
		]) {
			'List>>asPoint: invalid size'.error
		}
	}

}

+Record {

	asPoint { :self |
		self.includesAllIndices(['w','x','y','z']).if {
			self.asFourVector
		} {
			self.includesAllIndices(['x','y','z']).if {
				self.asCartesianCoordinates
			} {
				self.includesAllIndices(['x','y']).if {
					self.asRectangularCoordinates
				} {
					'Record>>asPoint: invalid record'.error
				}
			}
		}
	}

}

+Tuple {

	asPoint { :self |
		self.size.caseOfOtherwise([
			{ 2 } -> { RectangularCoordinates(self.first, self.second) },
			{ 3 } -> { CartesianCoordinates(self.first, self.second, self.third) },
			{ 4 } -> { FourVector(self.first, self.second, self.third, self.fourth) }
		]) {
			'Tuple>>asPoint'.error
		}
	}

}

Point : [Object] { | vector |

	= { :self :anObject |
		self.hasEqualSlots(anObject)
	}

	at { :self :index |
		self.vector[index]
	}

	dimension { :self |
		0
	}

	embeddingDimension { :self |
		self.vector.size
	}

	midpoint { :self :aPoint |
		Point(self.vector.midpoint(aPoint.vector))
	}

	size { :self |
		self.vector.size
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

}

InfiniteLine : [Object] { | point vector |

	= { :self :anObject |
		self.hasEqualSlots(anObject)
	}

	~ { :self :anObject |
		self.hasEqualSlotsBy(anObject, ~)
	}

	includes { :self :aPoint |
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

}

Line : [Object] { | matrix |

	arcLength { :self |
		self[1].euclideanDistance(self[2])
	}

	at { :self :index |
		self.matrix[index]
	}

	centroid { :self |
		self.midpoint
	}

	midpoint { :self |
		self[1].midpoint(self[2])
	}

}

Triangle : [Object] { | coordinates |

	= { :self :anObject |
		self.hasEqualSlots(anObject)
	}

	~ { :self :anObject |
		self.hasEqualSlotsBy(anObject, ~)
	}

	arcLength { :self |
		self.coordinates.polygonArcLength
	}

	area { :self |
		self.coordinates.shoelaceFormula
	}

	centroid { :self |
		self.coordinates.polygonCentroid
	}

	interiorAngles { :self |
		self.coordinates.polygonInteriorAngles
	}

	size { :self |
		3
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

}

Polygon : [Object] { | coordinates |

	= { :self :anObject |
		self.hasEqualSlots(anObject)
	}

	~ { :self :anObject |
		self.hasEqualSlotsBy(anObject, ~)
	}

	arcLength { :self |
		self.coordinates.polygonArcLength
	}

	area { :self |
		self.coordinates.shoelaceFormula
	}

	at { :self :index |
		let n = self.size;
		(index = (n + 1)).if {
			self.coordinates[1]
		} {
			self.coordinates[index]
		}
	}

	centroid { :self |
		self.coordinates.polygonCentroid
	}

	interiorAngles { :self |
		self.coordinates.polygonInteriorAngles
	}

	size { :self |
		self.coordinates.size
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

}

+@Sequence {

	midpoint { :u :v |
		u + ((v - u) / 2)
	}

	InfiniteLine { :aPoint :aVector |
		newInfiniteLine().initializeSlots(aPoint, aVector)
	}

	Line { :u :v |
		newLine().initializeSlots([u, v])
	}

	perpendicularBisector { :u :v |
		let m = (pi / 2).rotationMatrix;
		InfiniteLine(
			u.midpoint(v),
			(v - u).dot(m)
		)
	}

	Point { :vector |
		newPoint().initializeSlots(vector)
	}

	Polygon { :self |
		newPolygon().initializeSlots(self)
	}

	polygonArcLength { :p |
		p.polylineArcLength + p.last.euclideanDistance(p.first)
	}

	polygonCentroid { :p |
		let n = p.size;
		let m = 1 / (p.shoelaceFormula * 6);
		let x = 0;
		let y = 0;
		1.toDo(n) { :i |
			let j = (i = n).if { 1 } { i + 1};
			let d = (p[i][1] * p[j][2]) - (p[j][1] * p[i][2]);
			x := x + ((p[i][1] + p[j][1]) * d);
			y := y + ((p[i][2] + p[j][2]) * d)
		};
		[x y] * m
	}

	polygonInteriorAngles { :p |
		let n = p.size;
		let a = [];
		1.toDo(n) { :i |
			let j = (i + 1).wrapIndex(n);
			let k = (i + 2).wrapIndex(n);
			let r = (p @* [i, j, k]).planarAngle;
			a.add(r)
		};
		a
	}

	polylineArcLength { :p |
		p.adjacentPairsCollect(euclideanDistance:/2).sum
	}

	shoelaceFormula { :p |
		let n = p.size;
		let a = 0;
		1.toDo(n) { :i |
			let j = (i = n).if { 1 } { i + 1};
			let d = (p[i][1] * p[j][2]) - (p[j][1] * p[i][2]);
			a := a + d
		};
		a / 2
	}

	Triangle { :p1 :p2 :p3 |
		newTriangle().initializeSlots([p1, p2, p3])
	}

}

+@Number {

	aasTriangle { :alpha :beta :a |
		let x2 = a * alpha.cosecant * (alpha + beta).sin;
		let x3 = a * alpha.cotangent * beta.sin;
		let y3 = a * beta.sin;
		Triangle([0 0], [x2, 0], [x3, y3])
	}

	asaTriangle { :alpha :c :beta |
		let x = alpha.cos * (alpha + beta).cosecant * beta.sin;
		let y = alpha.sin * (alpha + beta).cosecant * beta.sin;
		Triangle([0 0], [c 0], [c * x, c * y])
	}

	sasTriangle { :a :gamma :b |
		let x = ((a ^ 2) + (b ^ 2) - (2 * a * b * gamma.cos)).sqrt;
		let y = ((b ^ 2) - (a * b * gamma.cos)) / x;
		let z = (a * b * gamma.sin) / x;
		Triangle([0 0], [x 0], [y z])
	}

	sssTriangle { :a :b :c |
		let y = ((a ^ 2).negated + (b ^ 2) + (c ^ 2)) / (2 * c);
		let z = ((a + b - c) * (a - b + c) * (a.negated + b + c) * (a + b + c)).sqrt / (2 * c);
		Triangle([0 0], [c 0], [y z])
	}

}
