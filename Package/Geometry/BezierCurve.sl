BezierCurve : [Object, Cache, Geometry] { | controlPoints splineDegree cache |

	approximation { :self |
		self.cached('approximation') {
			self.componentApproximationList.catenate
		}
	}

	arcLength { :self |
		self.cached('arcLength') {
			self.componentArcLengthList.sum
		}
	}

	boundingBox { :self |
		self.controlPoints.coordinateBoundingBox
	}

	componentArcLengthList { :self |
		self.cached('componentArcLengthList') {
			self.componentDistanceList.collect(last:/1)
		}
	}

	componentApproximationList { :self |
		self.cached('componentApproximationList') {
			let n = self.componentApproximationSize;
			self.componentCoordinatesList.collect { :each |
				each.bezierApproximation(n)
			}
		}
	}

	componentApproximationSize { :self |
		self.splineDegree * 64
	}

	componentCoordinatesList { :self |
		self.cached('componentCoordinatesList') {
			self.controlPoints.partition(
				self.splineDegree + 1,
				self.splineDegree
			)
		}
	}

	componentCount { :self |
		(self.controlPoints.size - 1) / self.splineDegree
	}

	componentDerivativesList { :self |
		self.cached('componentDerivativesList') {
			self.componentCoordinatesList.bezierDerivatives
		}
	}

	componentDistanceList { :self |
		self.cached('componentDistanceList') {
			self.componentApproximationList.collect { :each |
				each
				.adjacentPairsCollect(euclideanDistance:/2)
				.foldList(0, +)
			}
		}
	}

	distance { :self |
		self.cached('distance') {
			let answer = [];
			let sum = 0;
			self.componentDistanceList.collect { :each |
				answer.addAllLast(each + sum);
				sum := answer.last
			};
			answer
		}
	}

	embeddingDimension { :unused |
		2
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
			newBezierCurve().initializeSlots(self, degree, ())
		}
	}

	bezierApproximation { :self :size |
		(0 -- 1).discretize(size).collect(
			self.bezierFunction
		)
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

	bezierDistanceTable { :self :size |
		let muList = (0 -- 1).discretize(size);
		[
			muList,
			muList
			.collect(self.bezierFunction)
			.adjacentPairsCollect(euclideanDistance:/2)
			.foldList(0, +)
		]
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
		self.size.caseOf([
			2 -> { { :x | self.linearBezierFunctionAt(x) } },
			3 -> { { :x | self.quadraticBezierFunctionAt(x) } },
			4 -> { { :x | self.cubicBezierFunctionAt(x) } }
		]) {
			{ :x | self.deCasteljausAlgorithm(x) }
		}
	}

	bezierFunctionAt { :self :x |
		self.bezierFunction.value(x)
	}

	bezierFunctionAtBernsteinBasis { :self :x |
		let n = self.size - 1;
		let b = [0 .. n].collect { :d |
			n.bernsteinBasis(d, x)
		};
		(b * self).sum
	}

	bezierHull { :self :x |
		let p = self;
		let q = p.copy;
		let i = p.size + 1;
		{ p.size > 1 }.whileTrue {
			let r = [];
			let l = p.size - 1;
			1.toDo(p.size - 1) { :j |
				let z = linearInterpolation(p[j], p[j + 1], x);
				q.addLast(z);
				r.addLast(z)
			};
			p := r
		};
		q
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

	bezierTrace { :self :size |
		let [muList, d] = self.bezierDistanceTable(size);
		let arcLength = d.last;
		(0 -- arcLength).discretize(size).collect(
			self.bezierFunction.composeLeft(
				d.linearInterpolator(muList)
			)
		)
	}

	cubicBezierFunctionAt { :self :x |
		let [p1, p2, p3, p4] = self;
		let u = 1 - x;
		let x2 = x * x;
		let x3 = x2 * x;
		let u2 = u * u;
		let u3 = u2 * u;
		(p1 * u3) + (p2 * (3 * u2 * x)) + (p3 * (3 * u * x2)) + (p4 * x3)
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

	linearBezierFunctionAt { :self :x |
		let [p1, p2] = self;
		let u = 1 - x;
		(p1 * u) + (p2 * x)
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
