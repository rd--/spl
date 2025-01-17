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

	basicBezierFunctionAt { :self :x |
		let n = self.size - 1;
		let b = [0 .. n].collect { :d |
			n.bernsteinBasis(d, x)
		};
		(b * self).sum
	}

	BezierCurve { :self |
		(self.rank > 2).if {
			self.collect(BezierCurve:/1)
		} {
			newBezierCurve().initializeSlots(self)
		}
	}

	bezierFunction { :self |
		let [m, n] = self.shape;
		(n = 2).if {
			let [x, y] = self.transposed;
			{ :index |
				[
					x.basicBezierFunctionAt(index),
					y.basicBezierFunctionAt(index)
				]
			}
		} {
			self.error('bezierFunction: not two column matrix')
		}
	}

}
