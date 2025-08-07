Polygon : [Object, Geometry] { | vertexCoordinates |

	~ { :self :anObject |
		self.hasEqualSlotsBy(anObject, ~)
	}

	arcLength { :self |
		self.vertexCoordinates.polygonArcLength
	}

	area { :self |
		self.vertexCoordinates.shoelaceFormula.abs
	}

	at { :self :index |
		let n = self.vertexCount;
		(index = (n + 1)).if {
			self.vertexCoordinates[1]
		} {
			self.vertexCoordinates[index]
		}
	}

	boundingBox { :self |
		self.vertexCoordinates.coordinateBoundingBox
	}

	centroid { :self |
		self.vertexCoordinates.polygonCentroid
	}

	containsPoint { :self :aPoint |
		self.vertexCoordinates.crossingNumber(aPoint).isOdd
	}

	dimension { :self |
		2
	}

	downsample { :self :anInteger |
		let c = self.vertexCoordinates;
		((c.size // anInteger) < 3).if {
			Point(c.polygonCentroid)
		} {
			Polygon(
				c.downsample(anInteger)
			)
		}
	}

	edgeCount { :self |
		self.vertexCount
	}

	edgeList { :self |
		let k = self.vertexCount;
		let answer = [];
		1.toDo(k - 1) { :i |
			answer.add([i, i + 1])
		};
		answer.add([1, k]);
		answer
	}

	embeddingDimension { :self |
		self.vertexCoordinates.anyOne.size
	}

	faceCount { :self |
		1
	}

	faceIndices { :self |
		[self.vertexList]
	}

	svgFragment { :self :options |
		'<polygon points="%" />'.format([
			self.vertexCoordinates.asSvgPointList(options)
		])
	}

	innerPolygons { :self |
		[]
	}

	interiorAngles { :self |
		self.vertexCoordinates.polygonInteriorAngles
	}

	isConvex { :self |
		self.interiorAngles.allSatisfy { :each |
			each < 1.pi
		}
	}

	midpointPolygon { :self |
		self.vertexCoordinates.midpointPolygon.Polygon
	}

	outerPolygon { :self |
		self
	}

	project { :self :projection |
		Polygon(
			self.vertexCoordinates.collect(projection.asUnaryBlock)
		)
	}

	rotated { :self :theta :center |
		let matrix = theta.rotationMatrix;
		self.vertexCoordinates.collect { :each |
			matrix.dot(each - center) + center
		}.Polygon
	}

	rotated { :self :theta |
		self.rotated(theta, self.centroid)
	}

	scaled { :self :scale |
		let c = self.centroid;
		self.vertexCoordinates.collect { :each |
			((each - c) * scale) + c
		}.Polygon
	}

	sideLengths { :self |
		let v = self.vertexCoordinates;
		(2 .. v.size + 1).collect { :i |
			v.atWrap(i).euclideanDistance(v.atWrap(i + 1))
		}
	}

	signedArea { :self |
		self.vertexCoordinates.shoelaceFormula
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

	translated { :self :operand |
		self.vertexCoordinates.collect { :each |
			each + operand
		}.Polygon
	}

	vertexAngle { :self :i |
		self.vertexCoordinates.polygonVertexAngle(i)
	}

	vertexCount { :self |
		self.vertexCoordinates.size
	}

	vertexList { :self |
		[1 .. self.vertexCoordinates.size]
	}

}

+List {

	crossingNumber { :self :aPoint |
		self.includes(aPoint).if {
			0
		} {
			let [x, y] = aPoint;
			let answer = 0;
			1.toDo(self.size) { :i |
				let [x1, y1] = self.at(i);
				let [x2, y2] = self.atWrap(i + 1);
				(
					(((y2 <= y) & { y < y1 }) | { (y1 <= y) & { y < y2 } })
					&
					{ x < ((x1 - x2) * (y - y2) / (y1 - y2) + x2) }
				).ifTrue {
					answer := answer + 1
				}
			};
			answer
		}
	}

	midpointPolygon { :self |
		(1 .. self.size).collect { :i |
			[self.at(i), self.atWrap(i + 1)].midpoint
		}
	}

	parallelogram { :p :v |
		let [v1, v2] = v;
		Polygon([p, p + v1, p + v1 + v2, p + v2])
	}

	Polygon { :self |
		(self.depth > 3).if {
			self.collect(Polygon:/1)
		} {
			newPolygon().initializeSlots(self)
		}
	}

	polygonArcLength { :self |
		self.polylineArcLength + self.last.euclideanDistance(self.first)
	}

	polygonCentroid { :self |
		let n = self.size;
		let m = 1 / (self.shoelaceFormula * 6);
		let p = self;
		let x = 0;
		let y = 0;
		1.toDo(n) { :i |
			let j = (i = n).if { 1 } { i + 1};
			let d = (p[i][1] * p[j][2]) - (p[j][1] * p[i][2]);
			x := x + ((p[i][1] + p[j][1]) * d);
			y := y + ((p[i][2] + p[j][2]) * d)
		};
		[x y] * m
	}

	polygonInteriorAngles { :self |
		let n = self.size;
		let answer = [];
		(1 .. self.size).collect { :i |
			self.polygonVertexAngle(i)
		}
	}

	polygonVertexAngle { :self :j |
		let n = self.size;
		let p = self.at(j);
		let q1 = self.at((j + 1).wrapIndex(n));
		let q2 = self.at((j - 1).wrapIndex(n));
		(p -> [q1, q2]).planarAngle
	}

	windingNumber { :self :aPoint |
		let answer = 0;
		let isLeft = { :x1 :y1 :x2 :y2 :x :y |
			((x2 - x1) * (y - y1)) - ((x - x1) * (y2 - y1))
		};
		let [x, y] = aPoint;
		1.toDo(self.size) { :i |
			let [x1, y1] = self.at(i);
			let [x2, y2] = self.atWrap(i + 1);
			(y1 <= y).if {
				(y2 > y & { isLeft(x1, y1, x2, y2, x, y) > 0 }).ifTrue {
					answer := answer + 1
				}
			} {
				(y2 <= y & { isLeft(x1, y1, x2, y2, x, y) < 0 }).ifTrue {
					answer := answer - 1
				}
			}
		};
		answer
	}

}

+SmallFloat {

	regularPolygon { :self :center :radius :theta |
		Polygon(
			self.circlePoints(center, radius, theta)
		)
	}

}

+@RandomNumberGenerator {

	randomConvexHullPolygon { :r :d :n :shape |
		{
			r.randomConvexHullPolygon(d, n)
		} ! shape
	}

	randomConvexHullPolygon { :r :d :n |
		d.randomVariate(r, [n]).convexHull.Polygon
	}

	randomSimplePolygon { :r :n :shape |
		{
			r.randomSimplePolygon(n)
		} ! shape
	}

	randomSimplePolygon { :r :n |
		let p = r.randomReal([0 1], [n 2]);
		let [_, i] = p.findShortestTour;
		(p @* i).Polygon
	}

	randomStarConvexPolygon { :self :k :minRadius :maxRadius |
		let d = 2;
		let r = self.randomReal([minRadius, maxRadius], [k]);
		(d = 2).if {
			let theta = self.randomReal([0, 2.pi], [k]).sort;
			r.withCollect(theta) { :i :j |
				[i j].fromPolarCoordinates
			}.Polygon
		} {
			(d = 3).if {
				self.error('randomStarConvexPolygon: d=3 not implemented')
			} {
				self.error('randomStarConvexPolygon: d={2,3}')
			}
		}
	}

}
