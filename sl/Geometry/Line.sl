HalfLine : [Object] { | point vector |

}

InfiniteLine : [Object] { | point vector |

	~ { :self :anObject |
		self.hasEqualSlotsBy(anObject, ~)
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

}

Line : [Object] { | vertices |

	arcLength { :self |
		let answer = 0;
		self.vertices.adjacentPairsDo { :u :v |
			answer := answer + u.euclideanDistance(v)
		};
		answer
	}

	asSvg { :self |
		(self.vertices.size = 2).if {
			let [p1, p2] = self.vertices;
			let [x1, y1] = p1;
			let [x2, y2] = p2;
			'<line x1="%" y1="%" x2="%" y2="%" />'.format([
				x1 y1 x2 y2
			])
		} {
			'<polyline points="%" />'.format([
				self.vertices.asSvgPoints
			])
		}
	}

	at { :self :index |
		self.vertices[index]
	}

	boundingBox { :self |
		self.vertices.coordinateBoundingBox
	}

	dimensions { :self |
		1
	}

	embeddingDimension { :self |
		self.vertices.first.size
	}

	midpoint { :self |
		let p = self.vertices;
		let l = self.arcLength;
		let h = l / 2;
		let i = 1;
		let c1 = 0;
		let c2 = c1;
		let _ = {
			c2 < h
		}.whileTrue {
			c1 := c2;
			c2 := c1 + p[i].euclideanDistance(p[i + 1]);
			i := i + 1
		};
		let d = h - c1;
		let v = p[i] - p[i - 1];
		p[i - 1] + (v.normalize * d)
	}

	size { :self |
		self.vertices.size
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

}

LineSegment : [Object] { | u v |

	arcLength { :self |
		self.u.euclideanDistance(self.v)
	}

	at { :self :index |
		index.caseOf([
			1 -> { self.u },
			2 -> { self.v }
		])
	}

	centroid { :self |
		self.midpoint
	}

	dimensions { :self |
		1
	}

	distance { :self :aPoint |
		[self.u, self.v].pointLineDistance(aPoint)
	}

	embeddingDimension { :self |
		self.u.size
	}

	includes { :self :aPoint |
		self.distance(aPoint).isVeryCloseTo(0)
	}

	midpoint { :self |
		self.u.midpoint(self.v)
	}

	nearestPoint { :self :aPoint |
	}

	size { :self |
		2
	}

}

+@Sequence {

	HalfLine { :aPoint :aVector |
		newHalfLine().initializeSlots(aPoint, aVector)
	}

	InfiniteLine { :aPoint :aVector |
		newInfiniteLine().initializeSlots(aPoint, aVector)
	}

	Line { :aMatrix |
		newLine().initializeSlots(aMatrix)
	}

	LineSegment { :u :v |
		newLineSegment().initializeSlots(u, v)
	}

}
