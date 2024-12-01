BezierCurve : [Object] { | controlPoints |

	boundingBox { :self |
		self.controlPoints.coordinateBoundingBox
	}

	forSvg { :self :scaleFactor |
		let precision = 2;
		let p = self.controlPoints;
		let c = p.chunksOfFrom(3, 2);
		let d = [
			'M %,%'.format([
				p[1][1].printStringToFixed(precision),
				p[1][2].printStringToFixed(precision)
			]),
			c.collect { :each |
				'C ' ++ each.asSvgPointList
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
