/* Requires: Polygon */

Triangle : [Object, Geometry] { | vertexCoordinates |

	~ { :self :anObject |
		self.hasEqualSlotsBy(anObject, ~)
	}

	arcLength { :self |
		self.vertexCoordinates.polygonArcLength
	}

	area { :self |
		self.vertexCoordinates.shoelaceFormula.abs
	}

	asPolygon { :self |
		(self.embeddingDimension = 2).if {
			self.vertexCoordinates.Polygon
		} {
			self.error('asPolygon: embeddingDimension not two')
		}
	}

	asPolyhedron { :self |
		(self.embeddingDimension = 3).if {
			self.vertexCoordinates.Polyhedron
		} {
			self.error('asPolyhedron: embeddingDimension not three')
		}
	}

	boundingBox { :self |
		self.vertexCoordinates.coordinateBoundingBox
	}

	centroid { :self |
		self.vertexCoordinates.polygonCentroid
	}

	circumcircle { :self |
		self.vertexCoordinates.circumcircle
	}

	dimension { :self |
		2
	}

	embeddingDimension { :self |
		self.vertexCoordinates.anyOne.size
	}

	faceCount { :self |
		1
	}

	faceIndices { :self |
		[[1 .. 3]]
	}

	svgFragment { :self :options |
		self.asPolygon.svgFragment(options)
	}

	fromBarycentricCoordinates { :self |
		let v = self.vertexCoordinates;
		{ :lambda |
			(v * lambda).sum
		}
	}

	fromBarycentricCoordinates { :self :lambda |
		self.fromBarycentricCoordinates.value(lambda)
	}

	fromTrilinearCoordinates { :self |
		let l = self.sideLengths;
		{ :c |
			let b = (c * l).normalizeSum;
			self.fromBarycentricCoordinates(b)
		}
	}

	fromTrilinearCoordinates { :self :c |
		self.fromTrilinearCoordinates.value(c)
	}

	heronsFormula { :self |
		let [a, b, c] = self.sideLengths;
		let s = (a + b + c) * 0.5;
		(s * (s - a) * (s - b) * (s - c)).sqrt
	}

	incenter { :self |
		let v = self.vertexCoordinates;
		let l = self.sideLengths.rotatedRight(3);
		(v * l).sum / l.sum
	}

	incircle { :self |
		Circle(self.incenter, self.inradius)
	}

	inradius { :self |
		let [a, b, c] = self.sideLengths;
		let s = (a + b + c) * 0.5;
		(((s - a) * (s - b) * (s - c)) / s).sqrt
	}

	interiorAngles { :self |
		self.vertexCoordinates.polygonInteriorAngles
	}

	medialTriangle { :self |
		self.vertexCoordinates.medialTriangle.Triangle
	}

	ninePointCircle { :self |
		self.vertexCoordinates.ninePointCircle
	}

	orthocenter { :self |
		let a = self.interiorAngles;
		let c = a.tan.normalizeSum;
		self.fromBarycentricCoordinates(c)
	}

	perimeter { :self |
		self.sideLengths.sum
	}

	project { :self :projection |
		self
		.vertexCoordinates
		.collect(projection.asUnaryBlock)
		.Triangle
	}

	semiperimeter { :self |
		self.perimeter * 0.5
	}

	sideLengths { :self |
		let [a, b, c] = self.vertexCoordinates;
		[
			b.euclideanDistance(c),
			c.euclideanDistance(a),
			a.euclideanDistance(b)
		]
	}

	signedArea { :self |
		let [a, b, c] = self.vertexCoordinates;
		(b - a).cross(c - b) * 0.5
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

	surfaceNormal { :self |
		let [p1, p2, p3] = self.vertexCoordinates;
		let u = p2 - p1;
		let v = p3 - p1;
		u.cross(v)
	}

	toBarycentricCoordinates { :self :c |
		self.toBarycentricCoordinates.value(c)
	}

	toBarycentricCoordinates { :self |
		let [a, b, c] = self.vertexCoordinates;
		toBarycentricCoordinates(a, b, c)
	}

	vertexCount { :self |
		3
	}

	unitNormal { :self |
		self.surfaceNormal.normalize
	}

}

+List {

	angleBisector { :self |
		let [_, p, _] = self;
		let a = self.planarAngle;
		InfiniteLine(p, [1, a / 2].fromPolarCoordinates)
	}

	circumcircle { :self |
		let [a, b, c] = self;
		let [ax, ay] = a;
		let [bx, by] = b;
		let [cx, cy] = c;
		let ad = (ax * ax) + (ay * ay);
		let bd = (bx * bx) + (by * by);
		let cd = (cx * cx) + (cy * cy);
		let d = 2 * ((ax * (by - cy)) + (bx * (cy - ay)) + (cx * (ay - by)));
		let center = [
			1 / d * ((ad * (by - cy)) + (bd * (cy - ay)) + (cd * (ay - by))),
			1 / d * ((ad * (cx - bx)) + (bd * (ax - cx)) + (cd * (bx - ax)))
		];
		let radius = center.euclideanDistance(self.anyOne);
		Circle(center, radius)
	}

	equilateralTriangle { :center :radius :angle |
		let f = { :n |
			center + [
				radius,
				angle + (2.pi * n / 3)
			].fromPolarCoordinates
		};
		Triangle([0.f 1.f 2.f])
	}

	medialTriangle { :self |
		let [a, b, c] = self;
		[
			[a b].midpoint,
			[a c].midpoint,
			[b c].midpoint
		]
	}

	ninePointCircle { :self |
		self.medialTriangle.circleThrough
	}

	Triangle { :self |
		(
			self.size = 3 & {
				self.isMatrix
			}
		).if {
			newTriangle().initializeSlots(self)
		} {
			self.error('Triangle: invalid matrix')
		}
	}

	Triangle { :a :b :c |
		Triangle([a b c])
	}

}

+@Number {

	aasTriangle { :alpha :beta :a |
		let x2 = a * alpha.cosecant * (alpha + beta).sin;
		let x3 = a * alpha.cotangent * beta.sin;
		let y3 = a * beta.sin;
		Triangle([0 0; x2 0; x3 y3])
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
		Triangle([0 0; x 0; y z])
	}

	sssTriangle { :a :b :c |
		let y = ((a ^ 2).negated + (b ^ 2) + (c ^ 2)) / (2 * c);
		let z = ((a + b - c) * (a - b + c) * (a.negated + b + c) * (a + b + c)).sqrt / (2 * c);
		Triangle([0 0], [c 0], [y z])
	}

}

+[List, Triangle] {

	circumcenter { :self |
		self.circumcircle.center
	}

	circumradius { :self |
		self.circumcircle.radius
	}

}
