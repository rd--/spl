StadiumShape : [Object, Equatable, Geometry] { | c r |

	a { :self |
		let [p, q] = self.c;
		let [r, _] = (q - p).toPolarCoordinates;
		r
	}

	area { :self |
		let r = self.r;
		let a = self.a;
		(1.pi * r.square) + (2 * r * a)
	}

	boundingBox { :self |
		let [p, q] = self.c;
		let r = self.r;
		let w = (r.square * 2).sqrt;
		let theta = self.theta;
		let a = p + [w, theta - 3/4.pi].fromPolarCoordinates;
		let b = q + [w, theta - 1/4.pi].fromPolarCoordinates;
		let c = q + [w, theta + 1/4.pi].fromPolarCoordinates;
		let d = p + [w, theta + 3/4.pi].fromPolarCoordinates;
		[a, b, c, d].Polygon.boundingBox
	}

	embeddingDimension { :self |
		let [p, q] = self.c;
		p.size
	}

	svgFragment { :self :options |
		let r = self.r;
		let [a, b, c, d] = self.vertexCoordinates;
		let precision = options['precision'];
		'<path d="M %,% L %,% % L %,% %" />'.format(
			[
				a[1], a[2],
				b[1], b[2],
				svgArcTo(r, r, 0, false, true, c[1], c[2], precision),
				d[1], d[2],
				svgArcTo(r, r, 0, false, true, a[1], a[2], precision)
			]
		)
	}

	theta { :self |
		let [p, q] = self.c;
		let [_, theta] = (q - p).toPolarCoordinates;
		theta
	}

	vertexCoordinates { :self |
		let [p, q] = self.c;
		let r = self.r;
		let theta = self.theta;
		let a = p + [r, theta - 1/2.pi].fromPolarCoordinates;
		let b = q + [r, theta - 1/2.pi].fromPolarCoordinates;
		let c = q + [r, theta + 1/2.pi].fromPolarCoordinates;
		let d = p + [r, theta + 1/2.pi].fromPolarCoordinates;
		[a, b, c, d]
	}

}

+List {

	StadiumShape { :c :r |
		newStadiumShape().initializeSlots(c, r)
	}

}
