Arc : [Object] { | center radii angles |

	boundingBox { :self |
	}

	parametricEquation { :self |
		let f:/1 = rescaleBlock([0, 2.pi], self.angles);
		let g:/1 = ellipseCurve(self.center, self.radii, 0);
		{ :theta |
			g(f(theta))
		}
	}

	radius { :self |
		let [rx, ry] = self.radii;
		(rx = ry).if {
			rx
		} {
			self.error('Arc>>radius: unequal radii')
		}
	}

	sectorArea { :self |
		self.radius.square * self.theta * 0.5
	}

	segmentArea { :self |
		self.radius.square * (self.theta - self.theta.sin) * 0.5
	}

	svgFragment { :self :options |
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

	theta { :self |
		let [a, b] = self.angles;
		(b - a).abs
	}

}

+List {

	Arc { :center :radii :angles |
		newArc().initializeSlots(center, radii, angles)
	}

}
