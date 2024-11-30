Circle : [Object] { | center radius |

	= { :self :anObject |
		anObject.isCircle & {
			self.center = anObject.center & {
				self.radius = anObject.radius
			}
		}
	}

	asSvg { :self |
		'<circle cx="%" cy="%" r="%" />'.format([
			self.center[1],
			self.center[2],
			self.radius
		])
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

	perimeter { :self |
		self.circumference
	}

	r { :self |
		self.radius
	}

	randomPoint { :self :shape |
		{
			let theta = system.randomReal(0, 2.pi, []);
			self.center + [self.radius, theta].fromPolarCoordinates
		} ! shape
	}

	storeString { :self |
		[
			'Circle(',
			self.center.storeString,
			', ',
			self.radius.storeString,
			')'
		].join('')
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

+@Sequence {

	Circle { :center :radius |
		newCircle().initializeSlots(center, radius)
	}

}

Ellipse : [Object] { | center radii |

	area { :self |
		let [rx, ry] = self.radii;
		pi * rx * ry
	}

	asSvg { :self |
		let [cx, cy] = self.center;
		let [rx, ry] = self.radii;
		'<ellipse cx="%" cy="%" rx="%" ry="%" />'.format([
			cx cy rx ry
		])
	}

	eccentricity { :self |
		let [a, b] = self.radii;
		(1 - (b / a).squared).sqrt
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


+@Sequence {

	Ellipse { :center :radii |
		(radii.size = 2).if {
			newEllipse().initializeSlots(center, radii)
		} {
			'Sequence>>Ellipse: invalid radii'.error
		}
	}

}
