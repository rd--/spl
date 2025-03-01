Circle : [Object] { | center radius |

	= { :self :anObject |
		anObject.isCircle & {
			self.center = anObject.center & {
				self.radius = anObject.radius
			}
		}
	}

	arcLength { :self |
		self.circumference
	}

	area { :self |
		self.radius.squared.pi
	}

	boundingBox { :self |
		[
			self.center - self.radius,
			self.center + self.radius
		]
	}

	centroid { :self |
		self.center
	}

	circumference { :self |
		(self.radius * 2).pi
	}

	diameter { :self |
		self.radius * 2
	}

	dimension { :self |
		1
	}

	embeddingDimension { :self |
		2
	}

	forSvg { :self :options |
		let precision = options['precision'];
		'<circle cx="%" cy="%" r="%" />'.format([
			self.center[1].printStringToFixed(precision),
			self.center[2].printStringToFixed(precision),
			self.radius.printStringToFixed(precision)
		])
	}

	perimeter { :self |
		self.circumference
	}

	randomPoint { :self :rng :shape |
		{
			let theta = rng.randomReal(0, 2.pi, []);
			self.center + [self.radius, theta].fromPolarCoordinates
		} ! shape
	}

	storeString { :self |
		'Circle(%, %)'.format([
			self.center.storeString,
			self.radius.storeString
		])
	}

	translateBy { :self :factor |
		Circle(self.center + factor, self.radius)
	}

	x { :self |
		self.center[1]
	}

	y { :self |
		self.center[2]
	}

}

+List {

	Circle { :center :radius |
		(center.rank > 1).if {
			center.withCollect(radius.nest, Circle:/2)
		} {
			newCircle().initializeSlots(center, radius)
		}
	}

	unitCircle { :center |
		Circle(center, 1)
	}

}

Ellipse : [Object] { | center radii |

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

	eccentricity { :self |
		let [a, b] = self.radii;
		(1 - (b / a).squared).sqrt
	}

	forSvg { :self :options |
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

	linearEccentricity { :self |
		let [a, b] = self.radii;
		(a.squared - b.squared).sqrt
	}

	semiLatusRectum { :self |
		let [a, b] = self.radii;
		b.squared / a
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

Arc : [Object] { | center radii angles |

	boundingBox { :self |
		[
			self.center - self.radii,
			self.center + self.radii
		]
	}

	forSvg { :self :options |
		let precision = options['precision'];
		let [cx, cy] = self.center;
		let [rx, ry] = self.radii;
		let [startAngle, endAngle] = self.angles;
		let [x1, y1] = [cx, cy] + [rx * startAngle.cos, ry * startAngle.sin];
		let [x2, y2] = [cx, cy] + [rx * endAngle.cos, ry * endAngle.sin];
		let largeArcFlag = (((endAngle - startAngle) % 2.pi) > 1.pi).boole;
		'<path d="M %,% A % % 0 % 1 %,%" />'.format([
			x1.printStringToFixed(precision), y1.printStringToFixed(precision),
			rx.printStringToFixed(precision), ry.printStringToFixed(precision),
			largeArcFlag,
			x2.printStringToFixed(precision), y2.printStringToFixed(precision)
		])
	}

}

+List {

	Arc { :center :radii :angles |
		newArc().initializeSlots(center, radii, angles)
	}

}
