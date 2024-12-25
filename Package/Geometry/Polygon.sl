Polygon : [Object] { | vertices |

	~ { :self :anObject |
		self.hasEqualSlotsBy(anObject, ~)
	}

	arcLength { :self |
		self.vertices.polygonArcLength
	}

	area { :self |
		self.vertices.shoelaceFormula
	}

	at { :self :index |
		let n = self.size;
		(index = (n + 1)).if {
			self.vertices[1]
		} {
			self.vertices[index]
		}
	}

	boundingBox { :self |
		self.vertices.coordinateBoundingBox
	}

	centroid { :self |
		self.vertices.polygonCentroid
	}

	forSvg { :self :options |
		'<polygon points="%" />'.format([
			self.vertices.asSvgPointList(options)
		])
	}

	interiorAngles { :self |
		self.vertices.polygonInteriorAngles
	}

	rotated { :self :theta |
		let matrix = theta.rotationMatrix;
		let center = self.centroid;
		self.vertices.collect { :each |
			matrix.dot(each - center) + center
		}.Polygon
	}

	size { :self |
		self.vertices.size
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
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

}

+SmallFloat {

	regularPolygon { :n :center :radius |
		let theta = 0;
		Polygon(n.circlePoints(radius, theta) + center)
	}

}
