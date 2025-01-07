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

	dimension { :self |
		2
	}

	embeddingDimension { :self |
		self.vertexCoordinates.anyOne.size
	}

	forSvg { :self :options |
		self.asPolygon.forSvg(options)
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

	vertexCount { :self |
		3
	}

	unitNormal { :self |
		self.surfaceNormal.normalize
	}

}

+List {

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

+SmallFloat {

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
