/* Requires: Polygon */

Triangle : [Object] { | vertexCoordinates |

	~ { :self :anObject |
		self.hasEqualSlotsBy(anObject, ~)
	}

	arcLength { :self |
		self.vertexCoordinates.polygonArcLength
	}

	area { :self |
		self.vertexCoordinates.shoelaceFormula
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
		let [p, q, r] = self.vertexCoordinates;
		{ :lambda |
			[
				(lambda[1] * p[1]) + (lambda[2] * q[1]) + (lambda[3] * r[1]),
				(lambda[1] * p[2]) + (lambda[2] * q[2]) + (lambda[3] * r[2])
			]
		}
	}

	fromBarycentricCoordinates { :self :lambda |
		self.fromBarycentricCoordinates.value(lambda)
	}

	interiorAngles { :self |
		self.vertexCoordinates.polygonInteriorAngles
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

	toBarycentricCoordinates { :self |
		let [a, b, c] = self.vertexCoordinates;
		let t = [
			[a[1] - c[1], b[1] - c[1]],
			[a[2] - c[2], b[2] - c[2]]
		];
		{ :p |
			let [u, v] = t.inverse.dot(p - c);
			[u, v, 1 - u - v]
		}
	}

	toBarycentricCoordinatesVertexApproach { :self |
		let [a, b, c] = self.vertexCoordinates;
		let v0 = b - a;
		let v1 = c - a;
		let d00 = dot(v0, v0);
		let d01 = dot(v0, v1);
		let d11 = dot(v1, v1);
		let m = 1 / ((d00 * d11) - (d01 * d01));
		{ :p |
			let v2 = p - a;
			let d20 = dot(v2, v0);
			let d21 = dot(v2, v1);
			let v = ((d11 * d20) - (d01 * d21)) * m;
			let w = ((d00 * d21) - (d01 * d20)) * m;
			let u = 1 - v - w;
			[u, v, w]
		}
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
