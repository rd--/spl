Point : [Object] { | vector |

	asList { :self |
		self.vector
	}

	asSvg { :self |
		self.isPlanar.if {
			'<circle cx="%" cy="%" r="2" fill="black" stroke="none" />'.format([
				self.vector[1],
				self.vector[2]
			])
		} {
			self.error('asSvg: not planar')
		}
	}

	at { :self :index |
		self.vector[index]
	}

	boundingBox { :self |
		self.vector ! 2
	}

	dimension { :self |
		0
	}

	embeddingDimension { :self |
		self.vector.size
	}

	isPlanar { :self |
		self.vector.size = 2
	}

	midpoint { :self :aPoint |
		Point(self.vector.midpoint(aPoint.vector))
	}

	size { :self |
		self.vector.size
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

	x { :self |
		self.vector[1]
	}

	y { :self |
		let v = self.vector;
		(v.size < 2).if {
			self.error('Point>>y: no y')
		} {
			v[2]
		}
	}

	z { :self |
		let v = self.vector;
		(v.size < 3).if {
			self.error('Point>>z: no z')
		} {
			v[3]
		}
	}

}

PointCloud : [Object] { | pointList |

	asSvg { :self |
		self.pointList.collect(asSvg:/1).unlines
	}

}

+List {

	asSvgPoints { :self |
		self.collect { :each |
			let [x, y] = each;
			'%,%'.format([x, y])
		}.join(' ')
	}

}

+@Sequence {

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
		let m = (pi / 2).rotationMatrix;
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

	Point { :vector |
		newPoint().initializeSlots(vector)
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
			(t ~ pi).if {
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

	x { :self |
		self.size.betweenAnd(2, 3).if {
			self[1]
		} {
			self.error('@Sequence>>x: not two- three-vector')
		}
	}

	y { :self |
		self.size.betweenAnd(2, 3).if {
			self[2]
		} {
			self.error('@Sequence>>y: not two- three-vector')
		}
	}

	z { :self |
		(self.size = 3).if {
			self[3]
		} {
			self.error('@Sequence>>z: not three-vector')
		}
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

}
