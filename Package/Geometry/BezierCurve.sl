BezierCurve : [Object] { | controlPoints splineDegree |

	boundingBox { :self |
		self.controlPoints.coordinateBoundingBox
	}

	componentCoordinates { :self |
		self.controlPoints.partition(
			self.splineDegree + 1,
			self.splineDegree
		)
	}

	componentCount { :self |
		(self.controlPoints.size - 1) / self.splineDegree
	}

	forSvg { :self :options |
		let n = self.splineDegree;
		(n = 1).if {
			self.controlPoints.Line.forSvg(options)
		} {
			let precision = options['precision'];
			let p = self.controlPoints;
			let z = (n = 2).if {
				'Q '
			} {
				(n = 3).if {
					'C '
				} {
					self.error('not Q or C')
				}
			};
			let c = p.chunksOfFrom(n, 2);
			let d = [
				'M %,%'.format([
					p[1][1].printStringToFixed(precision),
					p[1][2].printStringToFixed(precision)
				]),
				c.collect { :each |
					z ++ each.asSvgPointList(options)
				}
			].stringJoin(' ');
			'<path d="%" />'.format([d])
		}
	}

	isComposite { :self |
		self.isValid & {
			self.isSimple.not
		}
	}

	isSimple { :self |
		self.controlPoints.size = (self.splineDegree + 1)
	}

	isValid { :self |
		self.componentCount.isInteger
	}

	size { :self |
		self.controlPoints.size
	}

}

+List {

	BezierCurve { :self :degree |
		(self.rank > 2).if {
			self.collect { :each |
				BezierCurve(each, degree)
			}
		} {
			newBezierCurve().initializeSlots(self, degree)
		}
	}

	bezierDerivatives { :self |
		let answer = [];
		let p = self;
		p.size.downToDo(2) { :d |
			let c = d - 1;
			let q = [];
			1.toDo(c) { :j |
				q.add(c * (p[j + 1] - p[j]))
			};
			answer.add(q);
			p := q
		};
		answer
	}

	/*
	bezierFunction { :self |
		let [m, n] = self.shape;
		(n = 2).if {
			let [x, y] = self.transposed;
			{ :index |
				[
					x.bezierFunctionAt(index),
					y.bezierFunctionAt(index)
				]
			}
		} {
			self.error('bezierFunction: not two column matrix')
		}
	}
	*/

	bezierFunction { :self |
		{ :index |
			self.bezierFunctionAt(index)
		}
	}

	bezierFunctionAt { :self :x |
		let n = self.size - 1;
		let b = [0 .. n].collect { :d |
			n.bernsteinBasis(d, x)
		};
		(b * self).sum
	}

	bezierSplitAt { :self :x |
		let left = [];
		let right = [];
		let deCasteljaus = { :p :t |
			(p.size = 1).if {
				left.addLast(p[1]);
				right.addFirst(p[1])
			} {
				let k = p.size - 1;
				(1 .. k).collect { :i |
					(i = 1).ifTrue {
						left.addLast(p[i])
					};
					(i = k).ifTrue {
						right.addFirst(p[i + 1])
					};
					((1 - t) * p[i]) + (t * p[i + 1])
				}.deCasteljaus(t)
			}
		};
		deCasteljaus(self, x);
		(left, right)
	}

	cubicBezierFunctionAt { :self :x |
		let [p1, p2, p3, p4] = self;
		let u = 1 - x;
		let x2 = x * x;
		let x3 = x2 * x;
		let u2 = u * u;
		let u3 = u2 * u;
		(p1 * u2) + (p2 * (3 * u2 * x)) + (p3 * (3 * u * x2)) + (p4 * x3)
	}

	deCasteljausAlgorithm { :self :x |
		(self.size = 1).if {
			self[1]
		} {
			(1 .. self.size - 1).collect { :i |
				((1 - x) * self[i]) + (x * self[i + 1])
			}.deCasteljausAlgorithm(x)
		}
	}

	quadraticBezierFunctionAt { :self :x |
		let [p1, p2, p3] = self;
		let x2 = x * x;
		let u = 1 - x;
		let u2 = u * u;
		(p1 * u2) + (p2 * 2 * u * x) + (p3 * x2)
	}

	quadraticBezierToCubicBezier { :self |
		let [q1, q2, q3] = self;
		let c1 = q1;
		let c2 = q1 + ((q2 - q1) * (2 / 3));
		let c3 = q3 + ((q2 - q3) * (2 / 3));
		let c4 = q3;
		[c1, c2, c3, c4]
	}

}
