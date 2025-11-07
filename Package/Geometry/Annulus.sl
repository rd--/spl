Annulus : [Object, Equatable, Geometry] { | center radii |

	area { :self |
		let [r, bigR] = self.radii;
		1.pi * (bigR + r) * (bigR - r)
	}

	boundingBox { :self |
		self.outerCircle.boundingBox
	}

	embeddingDimension { :self |
		self.center.size
	}

	geometry { :self |
		GeometryCollection(
			[
				self.innerCircle,
				self.outerCircle
			]
		)
	}

	innerCircle { :self |
		Circle(self.center, self.innerRadius)
	}

	innerRadius { :self |
		let [r, _] = self.radii;
		r
	}

	outerCircle { :self |
		Circle(self.center, self.outerRadius)
	}

	outerRadius { :self |
		let [_, bigR] = self.radii;
		bigR
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

	svgFragment { :self :options |
		self.geometry.svgFragment(options)
	}

}

+List {

	Annulus { :center :radii |
		newAnnulus().initializeSlots(center, radii)
	}

}

AnnulusSector : [Object, Equatable, Geometry] { | center radii angles |

	area { :self |
		let [r, bigR] = self.radii;
		let [a, b] = self.angles;
		((b - a) / 2) * (bigR.square - r.square)
	}

	boundingBox { :self |
		self.geometry.boundingBox
	}

	embeddingDimension { :self |
		self.center.size
	}

	geometry { :self |
		let a1 = self.innerArc;
		let a2 = self.outerArc;
		let [_, p1, q1] = a1.vertexCoordinates;
		let [_, p2, q2] = a2.vertexCoordinates;
		GeometryCollection(
			[a1, a2, Line([p1, p2]), Line([q1, q2])]
		)
	}

	innerArc { :self |
		let r = self.innerRadius;
		Arc(self.center, [r, r], self.angles)
	}

	innerRadius { :self |
		let [r, _] = self.radii;
		r
	}

	outerArc { :self |
		let bigR = self.outerRadius;
		Arc(self.center, [bigR, bigR], self.angles)
	}

	outerRadius { :self |
		let [_, r] = self.radii;
		r
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

	svgFragment { :self :options |
		let precision = options['precision'];
		let [r1, r2] = self.radii;
		let a1 = self.innerArc;
		let a2 = self.outerArc;
		let [_, p1, q1] = a1.vertexCoordinates;
		let [_, p2, q2] = a2.vertexCoordinates;
		'<path d="M %,% % L %,% % Z" />'.format(
			[
				p1[1].printStringToFixed(precision),
				p1[2].printStringToFixed(precision),
				svgArcTo(r1, r1, 0, a1.isMajorArc, true, q1[1], q1[2], precision),
				q2[1].printStringToFixed(precision),
				q2[2].printStringToFixed(precision),
				svgArcTo(r2, r2, 0, a2.isMajorArc, false, p2[1], p2[2], precision)
			]
		)
	}

}

+List {

	AnnulusSector { :center :radii :angles |
		newAnnulusSector().initializeSlots(center, radii, angles)
	}

}
