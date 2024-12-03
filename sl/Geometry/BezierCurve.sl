BezierCurve : [Object] { | controlPoints |

	boundingBox { :self |
		self.controlPoints.coordinateBoundingBox
	}

	forSvg { :self :options |
		let precision = options::precision;
		let p = self.controlPoints;
		let c = p.chunksOfFrom(3, 2);
		let d = [
			'M %,%'.format([
				p[1][1].printStringToFixed(precision),
				p[1][2].printStringToFixed(precision)
			]),
			c.collect { :each |
				'C ' ++ each.asSvgPointList(options)
			}
		].stringJoin(' ');
		'<path d="%" />'.format([d])
	}

}

+List {

	BezierCurve { :self |
		(self.rank > 2).if {
			self.collect(BezierCurve:/1)
		} {
			newBezierCurve().initializeSlots(self)
		}
	}

}
