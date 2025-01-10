Polygon : [Object] { | vertexCoordinates |

	~ { :self :anObject |
		self.hasEqualSlotsBy(anObject, ~)
	}

	arcLength { :self |
		self.vertexCoordinates.polygonArcLength
	}

	area { :self |
		self.vertexCoordinates.shoelaceFormula
	}

	at { :self :index |
		let n = self.vertexCount;
		(index = (n + 1)).if {
			self.vertexCoordinates[1]
		} {
			self.vertexCoordinates[index]
		}
	}

	boundingBox { :self |
		self.vertexCoordinates.coordinateBoundingBox
	}

	centroid { :self |
		self.vertexCoordinates.polygonCentroid
	}

	edgeCount { :self |
		self.vertexCount
	}

	forSvg { :self :options |
		'<polygon points="%" />'.format([
			self.vertexCoordinates.asSvgPointList(options)
		])
	}

	interiorAngles { :self |
		self.vertexCoordinates.polygonInteriorAngles
	}

	rotated { :self :theta |
		let matrix = theta.rotationMatrix;
		let center = self.centroid;
		self.vertexCoordinates.collect { :each |
			matrix.dot(each - center) + center
		}.Polygon
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

	vertexCount { :self |
		self.vertexCoordinates.size
	}

}

+List {

	Polygon { :self |
		(self.depth > 3).if {
			self.collect(Polygon:/1)
		} {
			newPolygon().initializeSlots(self)
		}
	}

	polygonArcLength { :self |
		self.polylineArcLength + self.last.euclideanDistance(self.first)
	}

	polygonCentroid { :self |
		let n = self.size;
		let m = 1 / (self.shoelaceFormula * 6);
		let p = self;
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

	polygonInteriorAngles { :self |
		let n = self.size;
		let a = [];
		1.toDo(n) { :j |
			let i = (j - 1).wrapIndex(n);
			let k = (j + 1).wrapIndex(n);
			let r = (self @* [i, j, k]).planarAngle;
			a.add(r)
		};
		a
	}

}

+SmallFloat {

	regularPolygon { :self :center :radius :theta |
		Polygon(
			self.circlePoints(center, radius, theta)
		)
	}

}
