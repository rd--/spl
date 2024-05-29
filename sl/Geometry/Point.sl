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

	anglePath { :angles :distances :origin |
		let answer = [origin];
		let theta = 0;
		let p = origin;
		angles.withIndexDo { :each :index |
			let r = distances.atWrap(index);
			theta := (theta + each) % 2.pi;
			p := p + (theta.angleVector * r);
			answer.add(p)
		};
		answer
	}

	anglePath { :self |
		self.anglePath([1], [0 0])
	}

	InfiniteLine { :aPoint :aVector |
		newInfiniteLine().initializeSlots(aPoint, aVector)
	}

	Line { :u :v |
		newLine().initializeSlots([u, v])
	}

	lineEquation { :p1 :p2 |
		let [x1, y1] = p1;
		let [x2, y2] = p2;
		let a = y2 - y1;
		let b = x1 - x2;
		let c = (y1 * (x2 - x1)) - (x1 * (y2 - y1));
		[a, b, c]
	}

	lineLineIntersection { :l1 :l2 |
		let [p1, p2] = l1;
		let [p3, p4] = l2;
		let [x1, y1] = p1;
		let [x2, y2] = p2;
		let [x3, y3] = p3;
		let [x4, y4] = p4;
		let a1 = y2 - y1;
		let b1 = x1 - x2;
		let c1 = (a1 * x1) + (b1 * y1);
		let a2 = y4 - y3;
		let b2 = x3 - x4;
		let c2 = (a2 * x3) + (b2 * y3);
		let delta = (a1 * b2) - (a2 * b1);
		[
			((b2 * c1) - (b1 * c2)) / delta,
			((a1 * c2) - (a2 * c1)) / delta
		]
	}

	midpoint { :u :v |
		u + ((v - u) / 2)
	}

	perpendicularBisector { :u :v |
		let m = (pi / 2).rotationMatrix;
		InfiniteLine(
			u.midpoint(v),
			(v - u).dot(m)
		)
	}

	planarAngle { :self |
		let [q1, p, q2] = self;
		let [x1, y1] = q1;
		let [x0, y0] = p;
		let [x2, y2] = q2;
		let n = ((x1 - x0) * (x2 - x0)) + ((y1 - y0) * (y2 - y0));
		let d = ((x1 - x0).squared + (y1 - y0).squared).sqrt * ((x2 - x0).squared + (y2 - y0).squared).sqrt;
		(n / d).arcCos
	}

	Point { :vector |
		newPoint().initializeSlots(vector)
	}

	pointLineDistance { :line :point |
		let [p1, p2] = line;
		let p0 = point;
		(p0.size = 2).if {
			(2 * [p0, p1, p2].shoelaceFormula).abs / p1.euclideanDistance(p2).abs
		} {
			(p0 - p1).cross(p0 - p2).norm / (p2 - p1).norm
		}
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
		1.toDo(n) { :j |
			let i = (j - 1).wrapIndex(n);
			let k = (j + 1).wrapIndex(n);
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

	x { :self |
		self.size.betweenAnd(2, 3).if {
			self[1]
		} {
			self.error('@Sequence>>x: not two- three-vector')
		}
	}

	y { :self |
		self.size.betweenAnd(2, 3).if {
			self[2]
		} {
			self.error('@Sequence>>y: not two- three-vector')
		}
	}

	z { :self |
		(self.size = 3).if {
			self[3]
		} {
			self.error('@Sequence>>z: not three-vector')
		}
	}

}

+@Dictionary {

	asPoint { :self |
		self.includesAllIndices(['x','y','z']).if {
			Point([self::x, self::y, self::z])
		} {
			self.includesAllIndices(['x','y']).if {
				Point([self::x, self::y])
			} {
				self.error('@Dictionary>>asPoint: invalid dictionary')
			}
		}
	}

	x { :self |
		self.includesAllIndices(['x' 'y']).if {
			self['x']
		} {
			self.error('@Dictionary>>x: incorrect keys')
		}
	}

	y { :self |
		self.includesAllIndices(['x' 'y']).if {
			self['y']
		} {
			self.error('@Dictionary>>y: incorrect keys')
		}
	}

	z { :self |
		self.includesAllIndices(['x' 'y' 'z']).if {
			self['z']
		} {
			self.error('@Dictionary>>z: incorrect keys')
		}
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
