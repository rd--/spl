Point : [Object] { | coordinates |

	asList { :self |
		self.coordinates
	}

	at { :self :index |
		self.coordinates[index]
	}

	boundingBox { :self |
		self.coordinates ! 2
	}

	dimension { :self |
		0
	}

	edgeCount { :self |
		0
	}

	edgeList { :self |
		[]
	}

	embeddingDimension { :self |
		self.coordinates.size
	}

	forSvg { :self :options |
		let precision = options['precision'];
		let scaleFactor = options['scaleFactor'];
		self.isPlanar.if {
			'<circle cx="%" cy="%" r="%" />'.format([
				self.coordinates[1].printStringToFixed(precision),
				self.coordinates[2].printStringToFixed(precision),
				(0.5 / scaleFactor).printStringToFixed(precision)
			])
		} {
			self.error('forSvg: not planar')
		}
	}

	isPlanar { :self |
		self.coordinates.size = 2
	}

	midpoint { :self :aPoint |
		Point(self.coordinates.midpoint(aPoint.coordinates))
	}

	project { :self :projection |
		Point(
			projection.asUnaryBlock.value(self.coordinates)
		)
	}

	size { :self |
		self.coordinates.size
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

	vertexCoordinates { :self |
		[self.coordinates]
	}

	x { :self |
		self.coordinates[1]
	}

	y { :self |
		let v = self.coordinates;
		(v.size < 2).if {
			self.error('Point>>y: no y')
		} {
			v[2]
		}
	}

	z { :self |
		let v = self.coordinates;
		(v.size < 3).if {
			self.error('Point>>z: no z')
		} {
			v[3]
		}
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
		self.coordinateBoundingBox.transposed
	}

	lineEquation { :p1 :p2 |
		let [x1, y1] = p1;
		let [x2, y2] = p2;
		let a = y2 - y1;
		let b = x1 - x2;
		let c = (y1 * (x2 - x1)) - (x1 * (y2 - y1));
		[a, b, c]
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

	midpoint { :u :v |
		u + ((v - u) / 2)
	}

	perpendicularBisector { :u :v |
		let m = 0.5.pi.rotationMatrix;
		InfiniteLine(
			u.midpoint(v),
			(v - u).dot(m)
		)
	}

	planarAngle { :self |
		let [q1, p, q2] = self;
		let [x1, y1] = q1;
		let [x0, y0] = p;
		let [x2, y2] = q2;
		let n = ((x1 - x0) * (x2 - x0)) + ((y1 - y0) * (y2 - y0));
		let d = ((x1 - x0).squared + (y1 - y0).squared).sqrt * ((x2 - x0).squared + (y2 - y0).squared).sqrt;
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
			let t = v.vectorAngle(r);
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

}

+@Dictionary {

	asPoint { :self |
		self.includesAllIndices(['x','y','z']).if {
			Point([self['x'], self['y'], self['z']])
		} {
			self.includesAllIndices(['x','y']).if {
				Point([self['x'], self['y']])
			} {
				self.error('@Dictionary>>asPoint: invalid dictionary')
			}
		}
	}

	/*
	x { :self |
		self.includesAllIndices(['x' 'y']).if {
			self['x']
		} {
			self.error('@Dictionary>>x: incorrect keys')
		}
	}

	y { :self |
		self.includesAllIndices(['x' 'y']).if {
			self['y']
		} {
			self.error('@Dictionary>>y: incorrect keys')
		}
	}

	z { :self |
		self.includesAllIndices(['x' 'y' 'z']).if {
			self['z']
		} {
			self.error('@Dictionary>>z: incorrect keys')
		}
	}
	*/

}

+[List, Tuple] {

	asPoint { :self |
		Point(self.asList)
	}

	/*
	x { :self |
		self.size.betweenAnd(2, 3).if {
			self[1]
		} {
			self.error('List>>x: not two- three-vector')
		}
	}

	y { :self |
		self.size.betweenAnd(2, 3).if {
			self[2]
		} {
			self.error('List>>y: not two- three-vector')
		}
	}

	z { :self |
		(self.size = 3).if {
			self[3]
		} {
			self.error('List>>z: not three-vector')
		}
	}
	*/

}
