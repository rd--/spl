Arc : [Object] { | center radii angles |

	boundingBox { :self |
		/*[
			self.center - self.radii,
			self.center + self.radii
		]*/
		(0 -- 1).discretize(
			50,
			self.parametricEquation
		).coordinateBoundingBox
	}

	circle { :self |
		Circle(self.center, self.radius)
	}

	ellipse { :self |
		Ellipse(self.center, self.radii)
	}

	parametricEquation { :self |
		let f:/1 = rescaleBlock([0, 1], self.angles);
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

	poincareDiskArc { :self |
		let [theta1, theta2] = self;
		let theta = (theta1 + theta2) / 2;
		let dTheta = (theta1 - theta2).abs / 2;
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
