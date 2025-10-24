Arc : [Object, Equatable, Geometry] { | center radii angles |

	apothem { :self |
		let a = self.chordLength;
		let r = self.radius;
		((4 * r.square) - a.square).sqrt / 2
	}

	approximation { :self |
		(0 -- 1).discretize(
			64,
			self.parametricEquation
		)
	}

	arcLength { :self |
		let r = self.radius;
		let theta = self.centralAngle;
		r * theta
	}

	boundingBox { :self |
		/*[
			self.center - self.radii,
			self.center + self.radii
		]*/
		self.approximation.coordinateBoundingBox
	}

	centralAngle { :self |
		let [a, b] = self.angles;
		(b - a) % 2.pi
	}

	centroid { :self |
		let [a, b] = self.angles;
		let r = self.radius;
		let alpha = (b - a) / 2;
		let rho = (4 * r * alpha.sin) / (3 * alpha * 2);
		let theta = a + alpha;
		let d = [rho, theta].fromPolarCoordinates;
		self.center + d
	}

	chordLength { :self |
		let r = self.radius;
		let theta = self.centralAngle;
		2 * r * (theta / 2).sin
	}

	circle { :self |
		Circle(self.center, self.radius)
	}

	ellipse { :self |
		Ellipse(self.center, self.radii)
	}

	embeddingDimension { :self |
		self.center.size
	}

	isCircularArc { :self |
		let [rx, ry] = self.radii;
		rx = ry
	}

	isMajorArc { :self |
		self.centralAngle > 1.pi
	}

	parametricEquation { :self |
		let [a, b] = self.angles;
		let c = (a < b).if { b } { b + 2.pi };
		let f:/1 = rescaleBlock([0, 1], [a, c]);
		let g:/1 = ellipseCurve(self.center, self.radii, 0);
		{ :theta |
			g(f(theta))
		}
	}

	perimeter { :self |
		self.arcLength + (2 * self.radius)
	}

	radius { :self |
		let [rx, ry] = self.radii;
		(rx = ry).if {
			rx
		} {
			self.error('Arc>>radius: unequal radii')
		}
	}

	sagitta { :self |
		self.radius - self.apothem
	}

	sector { :self |
		self.isCircularArc.if {
			CircularSector(self)
		} {
			self.error('sector: not circular arc')
		}
	}

	sectorArea { :self |
		let r = self.radius;
		let theta = self.centralAngle;
		r.square * theta / 2
	}

	segment { :self |
		self.isCircularArc.if {
			CircularSegment(self)
		} {
			self.error('segment: not circular arc')
		}
	}

	segmentArea { :self |
		let theta = self.centralAngle;
		(theta <= 1.pi).if {
			let r = self.radius;
			r.square * (theta - theta.sin) / 2
		} {
			self.error('segmentArea: θ>π')
		}
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

	svgFragment { :self :options |
		let precision = options['precision'];
		let r = self.radii;
		let [c, p, q] = self.vertexCoordinates;
		'<path d="M %,% %" />'.format(
			[
				p[1].printStringToFixed(precision),
				p[2].printStringToFixed(precision),
				svgArcTo(r[1], r[2], 0, self.isMajorArc, true, q[1], q[2], precision)
			]
		)
	}

	vertexCoordinates { :self  |
		let [cx, cy] = self.center;
		let [rx, ry] = self.radii;
		let [startAngle, endAngle] = self.angles;
		let [x1, y1] = [cx, cy] + [rx * startAngle.cos, ry * startAngle.sin];
		let [x2, y2] = [cx, cy] + [rx * endAngle.cos, ry * endAngle.sin];
		[cx cy; x1 y1; x2 y2]
	}

}

+List {

	Arc { :center :radii :angles |
		newArc().initializeSlots(center, radii, angles)
	}

	circularArcThrough { :self |
		let circle = circleThrough(self);
		let c = circle.center;
		let r = circle.radius;
		let [a, _, b] = self;
		let p = counterClockwiseVectorAngle([1 0], a - c);
		let q = counterClockwiseVectorAngle([1 0], b - c);
		Arc(c, [r, r], [p, q])
	}

	poincareDiskArc { :self |
		let [theta1, theta2] = self;
		let dTheta = (theta1 - theta2).abs / 2;
		dTheta.isVeryCloseTo(1/2.pi).if {
			Line([[1, theta1], [1, theta2]].collect(fromPolarCoordinates:/1))
		} {
			let theta = (theta1 + theta2) / 2;
			let r = dTheta.tan;
			let y = dTheta.sin * r;
			let bigR = dTheta.sec;
			let phi = dTheta.cos.arcSin;
			let cx = bigR * theta.cos;
			let cy = bigR * theta.sin;
			let c = [cx, cy];
			let a = [1, theta2].fromPolarCoordinates;
			let b = (c -> [c + [1, 0], a]).planarAngle;
			Arc(c, [r, r], [b, b + (2 * phi)])
		}
	}

}

CircularSector : [Object, Geometry] { | arc |

	boundingBox { :self |
		self.geometry.boundingBox
	}

	embeddingDimension { :self |
		self.arc.embeddingDimension
	}

	geometry { :self |
		let a = self.arc;
		let [c, p, q] = a.vertexCoordinates;
		GeometryCollection(
			[
				Line([c, p]),
				a,
				Line([q, c])
			]
		)
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

	svgFragment { :self :options |
		self.geometry.svgFragment(options)
	}

}

+Arc {

	CircularSector { :self |
		newCircularSector().initializeSlots(self)
	}

}

CircularSegment : [Object, Geometry] { | arc |

	boundingBox { :self |
		self.geometry.boundingBox
	}

	embeddingDimension { :self |
		self.arc.embeddingDimension
	}

	geometry { :self |
		let a = self.arc;
		let [_, p, q] = a.vertexCoordinates;
		GeometryCollection(
			[
				Line([p, q]),
				a
			]
		)
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

	svgFragment { :self :options |
		self.geometry.svgFragment(options)
	}

}

+Arc {

	CircularSegment { :self |
		newCircularSegment().initializeSlots(self)
	}

}
