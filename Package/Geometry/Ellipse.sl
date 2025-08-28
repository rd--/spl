Ellipse : [Object, Geometry] { | center radii |

	area { :self |
		let [rx, ry] = self.radii;
		(rx * ry).pi
	}

	boundingBox { :self |
		[
			self.center - self.radii,
			self.center + self.radii
		]
	}

	covertex { :self |
		self.vertexCoordinates.at(2)
	}

	eccentricity { :self |
		let [a, b] = self.majorMinorAxes;
		(1 - (b / a).square).sqrt
	}

	foci { :self |
		let c = self.center;
		let e = self.linearEccentricity;
		let f1 = c + [e, 0];
		let f2 = c - [e, 0];
		[f1, f2]
	}

	implicitEquation { :self |
		let [x0, y0] = self.center;
		let [a, b] = self.radii;
		{ :x :y |
			((x - x0).square / a.square) + ((y - y0).square / b.square) - 1
		}
	}

	linearEccentricity { :self |
		let [a, b] = self.majorMinorAxes;
		(a.square - b.square).sqrt
	}

	majorMinorAxes { :self |
		let [b, a] = self.radii.sorted;
		[a, b]
	}

	semiLatusRectum { :self |
		let [a, b] = self.radii;
		b.square / a
	}

	svgFragment { :self :options |
		let precision = options['precision'];
		let [cx, cy] = self.center;
		let [rx, ry] = self.radii;
		'<ellipse cx="%" cy="%" rx="%" ry="%" />'.format([
			cx.printStringToFixed(precision),
			cy.printStringToFixed(precision),
			rx.printStringToFixed(precision),
			ry.printStringToFixed(precision)
		])
	}

	vertex { :self |
		self.vertexCoordinates.at(1)
	}

	vertices { :self |
		self.vertexCoordinates.first(2)
	}

	vertexCoordinates { :self |
		let [x, y] = self.center;
		let [a, b] = self.radii;
		[
			[x + a, y],
			[x, y + b],
			[x - a, y],
			[x, y - b]
		]
	}

}

+List {

	Ellipse { :center :radii |
		(center.rank > 1).if {
			center.withCollect(radii, Ellipse:/2)
		} {
			(radii.size = 2).if {
				newEllipse().initializeSlots(center, radii)
			} {
				'Sequence>>Ellipse: invalid radii'.error
			}
		}
	}

}
