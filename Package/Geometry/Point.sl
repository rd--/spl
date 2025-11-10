/* Requires: CartesianCoordinates */

Point : [Object, Equatable, Geometry, CartesianCoordinates] { | coordinates |

	boundingBox { :self |
		{ self.coordinates } ! 2
	}

	circleInversion { :self :circle |
		self.coordinates.isVeryCloseTo(circle.center).if {
			Infinity
		} {
			self.coordinates.circleInversion(circle).Point
		}
	}

	edgeCount { :self |
		0
	}

	edgeList { :self |
		[]
	}

	isOrigin { :self |
		self.coordinates.isOrigin
	}

	midpoint { :self :aPoint |
		Point([self.coordinates, aPoint.coordinates].midpoint)
	}

	project { :self :projection |
		Point(
			projection.asUnaryBlock.value(self.coordinates)
		)
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

	svgFragment { :self :options |
		let precision = options['precision'];
		let scaleFactor = options['scaleFactor'];
		self.isPlanar.if {
			'<circle cx="%" cy="%" r="%" />'.format([
				self.coordinates[1].printStringToFixed(precision),
				self.coordinates[2].printStringToFixed(precision),
				(0.5 / scaleFactor).printStringToFixed(precision)
			])
		} {
			self.error('svgFragment: not planar')
		}
	}

	vertexCoordinates { :self |
		[self.coordinates]
	}

}

+List {

	anglePath { :angles :distances :origin |
		let answer = [origin];
		let theta = 0;
		let p = origin;
		angles.withIndexDo { :each :index |
			let r = distances.atWrap(index);
			theta := (theta + each) % 2.pi;
			p := p + (theta.angleVector * r);
			answer.add(p)
		};
		answer
	}

	anglePath { :self |
		self.anglePath([1], [0 0])
	}

	coordinateBoundingBox { :self |
		let minimum = self.anyOne.copy;
		let maximum = minimum.copy;
		self.do { :each |
			each.withIndexDo { :n :i |
				(n < minimum[i]).ifTrue {
					minimum[i] := n
				};
				(n > maximum[i]).ifTrue {
					maximum[i] := n
				}
			}
		};
		[minimum, maximum]
	}

	coordinateBounds { :self |
		self.coordinateBoundingBox.transpose
	}

	counterClockwiseVectorAngle { :u :v |
		let theta = signedVectorAngle(u, v);
		(theta < 0).if {
			theta + 2.pi
		} {
			theta
		}
	}

	findShortestTour { :self |
		self
		.distanceMatrix
		.heldKarpAlgorithm
	}

	isOrigin { :self |
		self.allSatisfy(isZero:/1)
	}

	lineEquation { :p1 :p2 |
		let [x1, y1] = p1;
		let [x2, y2] = p2;
		let a = y2 - y1;
		let b = x1 - x2;
		let c = (y1 * (x2 - x1)) - (x1 * (y2 - y1));
		let e = [a, b, c];
		e.allSatisfy(isInteger:/1).if {
			e / e.gcd
		} {
			e
		}
	}

	lineEquationPolynomial { :self |
		let [a, b, c] = self;
		let m = 0 - (c / b);
		let y = 0 - (a / b);
		UnivariatePolynomial([m, y])
	}

	lineLineIntersection { :l1 :l2 |
		let [p1, p2] = l1;
		let [p3, p4] = l2;
		let [x1, y1] = p1;
		let [x2, y2] = p2;
		let [x3, y3] = p3;
		let [x4, y4] = p4;
		let a1 = y2 - y1;
		let b1 = x1 - x2;
		let c1 = (a1 * x1) + (b1 * y1);
		let a2 = y4 - y3;
		let b2 = x3 - x4;
		let c2 = (a2 * x3) + (b2 * y3);
		let delta = (a1 * b2) - (a2 * b1);
		[
			((b2 * c1) - (b1 * c2)) / delta,
			((a1 * c2) - (a2 * c1)) / delta
		]
	}

	linePlaneIntersection { :p0 :n :l0 :l |
		let ln = l.dot(n);
		ln.isVeryCloseTo(0).if {
			nil
		} {
			let d = (p0 - l0).dot(n) / ln;
			l0 + (l * d)
		}
	}

	midpoint { :self |
		let [u, v] = self;
		u + ((v - u) / 2)
	}

	perpendicularBisector { :self |
		let [u, v] = self;
		let m = 0.5.pi.rotationMatrix;
		InfiniteLine(
			[u v].midpoint,
			(v - u).dot(m)
		)
	}

	planarAngle { :self |
		let [q1, p, q2] = self;
		let [x1, y1] = q1;
		let [x0, y0] = p;
		let [x2, y2] = q2;
		let n = ((x1 - x0) * (x2 - x0)) + ((y1 - y0) * (y2 - y0));
		let d = ((x1 - x0).square + (y1 - y0).square).sqrt * ((x2 - x0).square + (y2 - y0).square).sqrt;
		(n / d).arcCos
	}

	Point { :self |
		(self.rank > 1).if {
			self.collect(Point:/1)
		} {
			newPoint().initializeSlots(self)
		}
	}

	pointLineDistance { :aLine :aPoint |
		let [p1, p2] = aLine;
		let p0 = aPoint;
		(p0.size = 2).if {
			(2 * [p0, p1, p2].shoelaceFormula).abs / p1.euclideanDistance(p2).abs
		} {
			(p0 - p1).cross(p0 - p2).norm / (p2 - p1).norm
		}
	}

	pointLineNearest { :l :p |
		let [a, b] = l;
		let u = p - a;
		let v = b - a;
		let r = projection(u, v);
		a + r
	}

	pointLineSegmentNearest { :l :p |
		let [a, b] = l;
		let d = a.euclideanDistance(b);
		(d = 0).if {
			a
		} {
			let u = p - a;
			let v = b - a;
			let r = projection(u, v);
			let t = v.unsignedVectorAngle(r);
			(t ~ 1.pi).if {
				a
			} {
				let i = a + r;
				(a.euclideanDistance(i) > d).if {
					b
				} {
					i
				}
			}
		}
	}

	polylineArcLength { :p |
		p.adjacentPairsCollect(euclideanDistance:/2).sum
	}

	shoelaceFormula { :p |
		let n = p.size;
		let a = 0;
		1.toDo(n) { :i |
			let j = (i = n).if { 1 } { i + 1};
			let d = (p[i][1] * p[j][2]) - (p[j][1] * p[i][2]);
			a := a + d
		};
		a / 2
	}

	signedVectorAngle { :u :v |
		let [u1, u2] = u;
		let [v1, v2] = v;
		atan2(
			(u1 * v2) - (u2 * v1),
			(u1 * v1) + (u2 * v2)
		)
	}

	slopeInterceptForm { :p :q |
		let [x1, y1] = p;
		let [x2, y2] = q;
		let m = (y2 - y1) / (x2 - x1);
		let c = y1 - (m * x1);
		[m, c]
	}

	unsignedVectorAngle { :u :v |
		(u.isVector & { v.isVector }).if {
			(u.dot(v) / (u.norm * v.norm)).arcCos
		} {
			self.error('List>>unsignedVectorAngle: not vectors')
		}
	}

	vectorAngle { :u :v :rule |
		rule.caseOf(
			[
				'CounterClockwise' -> { counterClockwiseVectorAngle(u, v) },
				'Signed' -> { signedVectorAngle(u, v) },
				'Unsigned' -> { unsignedVectorAngle(u, v) }
			]
		)
	}

}

+Association {

	planarAngle { :self |
		let p = self.key;
		let [q1, q2] = self.value;
		counterClockwiseVectorAngle(q1 - p, q2 - p)
	}

}

+CartesianCoordinates {

	asPoint { :self |
		Point(self.coordinates)
	}

}

+Record {

	asPoint { :self |
		self.asCartesianCoordinates.asPoint
	}

}

+[List, Tuple] {

	asPoint { :self |
		Point(self.asList)
	}

	coordinates { :self |
		self.asList
	}

}

+@Integer {

	circlePoints { :n :o :r :theta |
		let m = 2.pi / n;
		0.to(n - 1).collect { :i |
			o + [r, theta + (i * m)].fromPolarCoordinates
		}
	}

	circlePoints { :n :r |
		let theta = (1 / n).pi - (1 / 2).pi;
		n.circlePoints([0 0], r, theta)
	}

	spherePoints { :n :r |
		let a = (4.pi * r.square) / n;
		let d = a.sqrt;
		let mTheta = (1.pi / d).round;
		let dTheta = 1.pi / mTheta;
		let dPhi = a / dTheta;
		let answer = [];
		0.toDo(mTheta - 1) { :m |
			let theta = (m + 0.5).pi / mTheta;
			let mPhi = (2.pi * theta.sin / dPhi).round;
			0.toDo(mPhi - 1) { :n |
				let phi = (2.pi * n) / mPhi;
				answer.add(
					[
						theta.sin * phi.cos,
						theta.sin * phi.sin,
						theta.cos
					] * r
				)
			}
		};
		answer
	}

	spherePointsFibonacci { :n |
		let answer = [];
		let phi = (5.sqrt - 1).pi;
		0.toDo(n - 1) { :i |
			let y = 1 - ((i / (n - 1)) * 2);
			let radius = (1 - (y * y)).sqrt;
			let theta = phi * i;
			let x = theta.cos * radius;
			let z = theta.sin * radius;
			answer.add([x, y, z])
		};
		answer
	}

}

+@Number {

	isOrigin { :self |
		self.isZero
	}

}

+@Indexable {

	staircasePath { :self :aList :origin |
		let c = [origin];
		aList.do { :i |
			let a = c.last;
			let b = self[i];
			c.add(a + b)
		};
		c
	}

}
