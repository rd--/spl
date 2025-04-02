/* Requires: Polygon */

Triangle : [Object] { | vertexCoordinates |

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

	forSvg { :self :options |
		self.asPolygon.forSvg(options)
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

	interiorAngles { :self |
		self.vertexCoordinates.polygonInteriorAngles
	}

	project { :self :projection |
		self
		.vertexCoordinates
		.collect(projection.asUnaryBlock)
		.asTriangle
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

	signedArea { :self |
		let [a, b, c] = self.vertexCoordinates;
		(b - a).cross(c - b) * 0.5
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

	asTriangle { :self |
		let [a, b, c] = self;
		Triangle(a, b, c)
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
		Triangle(0.f, 1.f, 2.f)
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

+[List, Triangle] {

	circumcenter { :self |
		self.circumcircle.center
	}

	circumradius { :self |
		self.circumcircle.radius
	}

}
