/* Requires: Polygon */

Triangle : [Object] { | vertices |

	~ { :self :anObject |
		self.hasEqualSlotsBy(anObject, ~)
	}

	arcLength { :self |
		self.vertices.polygonArcLength
	}

	area { :self |
		self.vertices.shoelaceFormula
	}

	asPolygon { :self |
		self.vertices.Polygon
	}

	asSvg { :self |
		self.asPolygon.asSvg
	}

	boundingBox { :self |
		self.vertices.coordinateBoundingBox
	}

	centroid { :self |
		self.vertices.polygonCentroid
	}

	interiorAngles { :self |
		self.vertices.polygonInteriorAngles
	}

	size { :self |
		3
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

}

+List {

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
