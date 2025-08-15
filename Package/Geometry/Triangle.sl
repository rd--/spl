/* Requires: Polygon */

Triangle : [Object, Geometry] { | vertexCoordinates |

	~ { :self :anObject |
		self.hasEqualSlotsBy(anObject, ~)
	}

	altitudes { :self |
		let [a, b, c] = self.sideLengths;
		let [p, q, r] = self.interiorAngles;
		[b * r.sin, c * p.sin, a * q.sin]
	}

	anticomplementaryTriangle { :self |
		self.antipedalTriangle(self.orthocenter)
	}

	antipedalTriangle { :self :p |
		let [a, b, c] = self.interiorAngles;
		let [alpha, beta, gamma] = self.toTrilinearCoordinates(p);
		self.fromTrilinearVertexMatrix(
			[
				[
					0 - (beta + (alpha * c.cos)) * (gamma + (alpha * b.cos)),
					(gamma + (alpha * b.cos)) * (alpha + (beta * c.cos)),
					(beta + (alpha * c.cos)) * (alpha + (gamma * b.cos))
				],
				[
					(gamma + (beta * a.cos)) * (beta + (alpha * c.cos)),
					0 - (gamma + (beta * a.cos)) * (alpha + (beta * c.cos)),
					(alpha + (beta * c.cos)) * (beta + (gamma * a.cos))
				],
				[
					(beta + (gamma * a.cos)) * (gamma + (alpha * b.cos)),
					(alpha + (gamma * b.cos)) * (gamma + (beta * a.cos)),
					0 - (alpha + (gamma * b.cos)) * (beta + (gamma * a.cos))
				]
			]
		)
	}

	arcLength { :self |
		self.vertexCoordinates.polygonArcLength
	}

	area { :self |
		self.vertexCoordinates.shoelaceFormula.abs
	}

	asPolygon { :self |
		(self.embeddingDimension = 2).if {
			self.vertexCoordinates.Polygon
		} {
			self.error('asPolygon: embeddingDimension not two')
		}
	}

	asPolyhedron { :self |
		(self.embeddingDimension = 3).if {
			self.vertexCoordinates.Polyhedron
		} {
			self.error('asPolyhedron: embeddingDimension not three')
		}
	}

	bevanCircle { :self |
		self.excentralTriangle.circumcircle
	}

	bevanPoint { :self |
		self.triangleCentreA { :a :b :c |
			b.cos + c.cos - a.cos - 1
		}
	}

	boundingBox { :self |
		self.vertexCoordinates.coordinateBoundingBox
	}

	centroid { :self |
		self.vertexCoordinates.polygonCentroid
	}

	cevianTriangle { :self :p |
		let [alpha, beta, gamma] = self.toTrilinearCoordinates(p);
		self.fromTrilinearVertexMatrix(
			[
				0 beta gamma;
				alpha 0 gamma;
				alpha beta 0
			]
		)
	}

	circumcircle { :self |
		self.vertexCoordinates.circumcircle
	}

	clawsonPoint { :self |
		self.triangleCentreA { :a :b :c |
			a.tan
		}
	}

	contactTriangle { :self |
		self.cevianTriangle(self.gergonnePoint)
	}

	deLongchampsPoint { :self |
		self.triangleCentreA { :a :b :c |
			a.cos - (b.cos * c.cos)
		}
	}

	dimension { :self |
		2
	}

	embeddingDimension { :self |
		self.vertexCoordinates.anyOne.size
	}

	equalDetourPoint { :self |
		self.triangleCentreA { :a :b :c |
			1 + (((0.5 * b).cos * (0.5 * c).cos) / (0.5 * a).cos)
		}
	}

	excenters { :self |
		[-1 1 1; 1 -1 1; 1 1 -1].collect { :c |
			self.fromTrilinearCoordinates(c)
		}
	}

	excentralTriangle { :self |
		self.fromTrilinearVertexMatrix(
			[
				-1 1 1;
				1 -1 1;
				1 1 -1
			]
		)
	}

	excircles { :self |
		let c = self.excenters;
		let r = self.exradii;
		Circle(c, r)
	}

	exeterPoint { :self |
		self.triangleCentreL { :a :b :c |
			a * ((b ^ 4) + (c ^ 4) - (a ^ 4))
		}
	}

	exradii { :self |
		let s = self.semiperimeter;
		let l = self.sideLengths;
		let f = { :x |
			let [a, b, c] = x;
			((s * (s - b) * (s - c)) / (s - a)).sqrt
		};
		[0 2 1].collect { :r |
			l.rotated(r).f
		}
	}

	extangentsTriangle { :self |
		let [x, y, z] = self.interiorAngles.cos;
		self.fromTrilinearVertexMatrix(
			[
				[0 - (x + 1), x + z, x + y],
				[y + z, 0 - (y + 1), y + x],
				[z + y, z + x, 0 - (z + 1)]
			]
		)
	}

	extouchTriangle { :self |
		self.cevianTriangle(self.nagelPoint)
	}

	faceCount { :self |
		1
	}

	faceIndices { :self |
		[[1 .. 3]]
	}

	feuerbachPoint { :self |
		self.triangleCentreA { :a :b :c |
			1 - (b - c).cos
		}
	}

	firstBrocardTriangle { :self |
		let [a, b, c] = self.sideLengths;
		self.fromTrilinearVertexMatrix(
			[
				[a * b * c, c.cubed, b.cubed],
				[c.cubed, a * b * c, a.cubed],
				[b.cubed, a.cubed, a * b * c]
			]
		)
	}

	firstFermatPoint { :self |
		self.triangleCentreA { :a :b :c |
			(a + 1/3.pi).cosecant
		}
	}

	firstIsodynamicPoint { :t |
		t.triangleCentreA { :a :b :c |
			(a + 1/3.pi).sin
		}
	}

	firstNapoleonPoint { :t |
		t.triangleCentreA { :a :b :c |
			(a + 1/6.pi).cosecant
		}
	}

	fromBarycentricCoordinates { :self |
		let v = self.vertexCoordinates;
		{ :lambda |
			(v * lambda).sum
		}
	}

	fromBarycentricCoordinates { :self :lambda |
		self.fromBarycentricCoordinates.value(lambda)
	}

	fromTrilinearCoordinates { :self |
		let l = self.sideLengths;
		{ :c |
			let b = (c * l).normalizeSum;
			self.fromBarycentricCoordinates(b)
		}
	}

	fromTrilinearCoordinates { :self :c |
		self.fromTrilinearCoordinates.value(c)
	}

	fromTrilinearVertexMatrix { :self :matrix |
		matrix.collect(
			self.fromTrilinearCoordinates
		).Triangle
	}

	gergonnePoint { :self |
		self.triangleCentreL { :a :b :c |
			(a * (b + c - a)) ^ -1
		}
	}

	heronsFormula { :self |
		let [a, b, c] = self.sideLengths;
		let s = (a + b + c) * 0.5;
		(s * (s - a) * (s - b) * (s - c)).sqrt
	}

	incenter { :self |
		let v = self.vertexCoordinates;
		let l = self.sideLengths.rotatedRight(3);
		(v * l).sum / l.sum
	}

	incircle { :self |
		Circle(self.incenter, self.inradius)
	}

	inradius { :self |
		let [a, b, c] = self.sideLengths;
		let s = (a + b + c) * 0.5;
		(((s - a) * (s - b) * (s - c)) / s).sqrt
	}

	interiorAngles { :self |
		self.vertexCoordinates.polygonInteriorAngles
	}

	isoperimetricPoint { :self |
		self.triangleCentreA { :a :b :c |
			(((0.5 * a).secant * (0.5 * b).cos) / (0.5 * c).cos) - 1
		}
	}

	kimberlingCenter { :self :n |
		n.kimberlingCenter.value(self)
	}

	medialTriangle { :self |
		self.vertexCoordinates.medialTriangle.Triangle
	}

	mittenpunkt { :self |
		self.triangleCentreL { :a :b :c |
			b + c - a
		}
	}

	nagelPoint { :self |
		self.triangleCentreL { :a :b :c |
			(b + c - a) / a
		}
	}

	ninePointCenter { :self |
		self.triangleCentreA { :a :b :c |
			(b - c).cos
		}
	}

	ninePointCircle { :self |
		self.vertexCoordinates.ninePointCircle
	}

	orthicTriangle { :self |
		let [a, b, c] = self.interiorAngles;
		self.fromTrilinearVertexMatrix(
			[
				[0, b.secant, c.secant],
				[a.secant, 0, c.secant],
				[a.secant, b.secant, 0]
			]
		)
	}

	orthocenter { :self |
		let a = self.interiorAngles;
		let c = a.tan.normalizeSum;
		self.fromBarycentricCoordinates(c)
	}

	pedalTriangle { :self :p |
		let [a, b, c] = self.interiorAngles;
		let [alpha, beta, gamma] = self.toTrilinearCoordinates(p);
		self.fromTrilinearVertexMatrix(
			[
				[0, beta + (alpha * c.cos), gamma + (alpha * b.cos)],
				[alpha + (beta * c.cos), 0, gamma + (beta * a.cos)],
				[alpha + (gamma * b.cos), beta + (gamma * a.cos), 0]
			]
		)
	}

	perimeter { :self |
		self.sideLengths.sum
	}

	project { :self :projection |
		self
		.vertexCoordinates
		.collect(projection.asUnaryBlock)
		.Triangle
	}

	rotated { :self :theta :center |
		self.asPolygon.rotated(theta, center).vertexCoordinates.Triangle
	}

	rotated { :self :theta |
		self.asPolygon.rotated(theta).vertexCoordinates.Triangle
	}

	scaled { :self :factor |
		self.asPolygon.scaled(factor).vertexCoordinates.Triangle
	}

	schifflerPoint { :self |
		self.triangleCentreA { :a :b :c |
			1 / (b.cos - c.cos)
		}
	}

	secondFermatPoint { :self |
		self.triangleCentreA { :a :b :c |
			(a - 1/3.pi).cosecant
		}
	}

	secondIsodynamicPoint { :t |
		t.triangleCentreA { :a :b :c |
			(a - 1/3.pi).sin
		}
	}

	secondNapoleonPoint { :t |
		t.triangleCentreA { :a :b :c |
			(a - 1/6.pi).cosecant
		}
	}

	semiperimeter { :self |
		self.perimeter * 0.5
	}

	sideLengths { :self |
		let [a, b, c] = self.vertexCoordinates;
		[
			b.euclideanDistance(c),
			c.euclideanDistance(a),
			a.euclideanDistance(b)
		]
	}

	signedArea { :self |
		let [a, b, c] = self.vertexCoordinates;
		(b - a).cross(c - b) * 0.5
	}

	spiekerCenter { :self |
		self.triangleCentreL { :a :b :c |
			(b + c) / a
		}
	}

	spiekerCircle { :self |
		self.medialTriangle.incircle
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

	surfaceNormal { :self |
		let [p1, p2, p3] = self.vertexCoordinates;
		let u = p2 - p1;
		let v = p3 - p1;
		u.cross(v)
	}

	svgFragment { :self :options |
		self.asPolygon.svgFragment(options)
	}

	symmedianPoint { :self |
		self.triangleCentreL { :a :b :c |
			a
		}
	}

	symmedialTriangle { :self |
		let [a, b, c] = self.sideLengths;
		self.fromTrilinearVertexMatrix(
			[
				0 b c;
				a 0 c;
				a b 0
			]
		)
	}

	tangentialTriangle { :self |
		let [a, b, c] = self.interiorAngles;
		self.fromTrilinearVertexMatrix(
			[
				[0 - a, b, c],
				[a, 0 - b, c],
				[a, b, 0 - c]
			]
		)
	}

	toBarycentricCoordinates { :self :c |
		self.toBarycentricCoordinates.value(c)
	}

	toBarycentricCoordinates { :self |
		let [a, b, c] = self.vertexCoordinates;
		toBarycentricCoordinates(a, b, c)
	}

	toTrilinearCoordinates { :self |
		let [a, b, c] = self.vertexCoordinates;
		let v = self.sideLengths;
		let f:/1 = toBarycentricCoordinates(a, b, c);
		{ :x |
			f(x) / v
		}
	}

	toTrilinearCoordinates { :self :c |
		self.toTrilinearCoordinates.value(c)
	}

	translated { :self :operand |
		self.asPolygon.translated(operand).vertexCoordinates.Triangle
	}

	triangleCentre { :self :p:/1 :f:/3 |
		let [a, b, c] = p(self);
		let alpha = f(a, b, c);
		let beta = f(b, c, a);
		let gamma = f(c, a, b);
		self.fromTrilinearCoordinates([alpha, beta, gamma])
	}

	triangleCentreA { :self :f:/3 |
		self.triangleCentre(interiorAngles:/1, f:/3)
	}

	triangleCentreL { :self :f:/3 |
		self.triangleCentre(sideLengths:/1, f:/3)
	}

	vertexCount { :self |
		3
	}

	unitNormal { :self |
		self.surfaceNormal.normalize
	}

}

+List {

	angleBisector { :self |
		let [_, p, _] = self;
		let a = self.planarAngle;
		InfiniteLine(p, [1, a / 2].fromPolarCoordinates)
	}

	circumcircle { :self |
		let [a, b, c] = self;
		let [ax, ay] = a;
		let [bx, by] = b;
		let [cx, cy] = c;
		let ad = (ax * ax) + (ay * ay);
		let bd = (bx * bx) + (by * by);
		let cd = (cx * cx) + (cy * cy);
		let d = 2 * ((ax * (by - cy)) + (bx * (cy - ay)) + (cx * (ay - by)));
		let center = [
			1 / d * ((ad * (by - cy)) + (bd * (cy - ay)) + (cd * (ay - by))),
			1 / d * ((ad * (cx - bx)) + (bd * (ax - cx)) + (cd * (bx - ax)))
		];
		let radius = center.euclideanDistance(self.anyOne);
		Circle(center, radius)
	}

	equilateralTriangle { :center :radius :angle |
		let f = { :n |
			center + [
				radius,
				angle + (2.pi * n / 3)
			].fromPolarCoordinates
		};
		Triangle([0.f 1.f 2.f])
	}

	medialTriangle { :self |
		let [a, b, c] = self;
		[
			[b c].midpoint,
			[c a].midpoint,
			[a b].midpoint
		]
	}

	ninePointCircle { :self |
		self.medialTriangle.circleThrough
	}

	Triangle { :self |
		(
			self.size = 3 & {
				self.isMatrix
			}
		).if {
			newTriangle().initializeSlots(self)
		} {
			self.error('Triangle: invalid matrix')
		}
	}

	Triangle { :a :b :c |
		Triangle([a b c])
	}

}

+@Number {

	aasTriangle { :alpha :beta :a |
		let x2 = a * alpha.cosecant * (alpha + beta).sin;
		let x3 = a * alpha.cotangent * beta.sin;
		let y3 = a * beta.sin;
		Triangle([0 0; x2 0; x3 y3])
	}

	asaTriangle { :alpha :c :beta |
		let x = alpha.cos * (alpha + beta).cosecant * beta.sin;
		let y = alpha.sin * (alpha + beta).cosecant * beta.sin;
		Triangle([0 0], [c 0], [c * x, c * y])
	}

	sasTriangle { :a :gamma :b |
		let x = ((a ^ 2) + (b ^ 2) - (2 * a * b * gamma.cos)).sqrt;
		let y = ((b ^ 2) - (a * b * gamma.cos)) / x;
		let z = (a * b * gamma.sin) / x;
		Triangle([0 0; x 0; y z])
	}

	sssTriangle { :a :b :c |
		let z = a + b + c;
		let m = [a, b, c].max;
		(m < (z - m)).if {
			let x = ((b ^ 2) + (c ^ 2) - (a ^ 2)) / (2 * c);
			let y = ((a + b - c) * (a - b + c) * (b + c - a) * (a + b + c)).sqrt / (2 * c);
			Triangle([0 0], [c 0], [x y])
		} {
			[a, b, c].error('sssTriangle: invalid triangle')
		}
	}

}

+[List, Triangle] {

	circumcenter { :self |
		self.circumcircle.center
	}

	circumradius { :self |
		self.circumcircle.radius
	}

	sssTriangle { :self |
		let [a, b, c] = self;
		sssTriangle(a, b, c)
	}

}

+SmallFloat {

	kimberlingCenter { :n |
		{ :t |
			n.caseOf([
				1 -> {
					t.triangleCentreL { :a :b :c |
						1
					}
				},
				2 -> {
					t.triangleCentreA { :a :b :c |
						a.cosecant
					}
				},
				3 -> {
					t.triangleCentreA { :a :b :c |
						a.cos
					}
				},
				4 -> {
					t.triangleCentreA { :a :b :c |
						a.secant
					}
				},
				5 -> {
					t.triangleCentreA { :a :b :c |
						(b - c).cos
					}
				},
				6 -> {
					t.triangleCentreL { :a :b :c |
						a
					}
				},
				7 -> {
					t.triangleCentreL { :a :b :c |
						(b * c) / (b + c - a)
					}
				},
				8 -> {
					t.triangleCentreL { :a :b :c |
						(b + c - a) / a
					}
				},
				9 -> {
					t.triangleCentreL { :a :b :c |
						b + c - a
					}
				},
				10 -> {
					t.triangleCentreL { :a :b :c |
						b * c * (b + c)
					}
				},
				11 -> {
					t.triangleCentreA { :a :b :c |
						1 - (b - c).cos
					}
				},
				12 -> {
					t.triangleCentreA { :a :b :c |
						1 + (b - c).cos
					}
				},
				13 -> {
					t.triangleCentreA { :a :b :c |
						(a + 1/3.pi).cosecant
					}
				},
				14 -> {
					t.triangleCentreA { :a :b :c |
						(a - 1/3.pi).cosecant
					}
				},
				15 -> {
					t.triangleCentreA { :a :b :c |
						(a + 1/3.pi).sin
					}
				},
				16 -> {
					t.triangleCentreA { :a :b :c |
						(a - 1/3.pi).sin
					}
				},
				17 -> {
					t.triangleCentreA { :a :b :c |
						(a + 1/6.pi).cosecant
					}
				},
				18 -> {
					t.triangleCentreA { :a :b :c |
						(a - 1/6.pi).cosecant
					}
				},
				19 -> {
					t.triangleCentreA { :a :b :c |
						a.tan
					}
				},
				20 -> {
					t.triangleCentreA { :a :b :c |
						a.cos - (b.cos * c.cos)
					}
				},
				21 -> {
					t.triangleCentreA { :a :b :c |
						1 / (b.cos - c.cos)
					}
				},
				22 -> {
					t.triangleCentreL { :a :b :c |
						a * ((b ^ 4) + (c ^ 4) - (a ^ 4))
					}
				},
				40 -> {
					t.triangleCentreA { :a :b :c |
						b.cos + c.cos - a.cos - 1
					}
				},
				175 -> {
					t.triangleCentreA { :a :b :c |
						(((0.5 * a).secant * (0.5 * b).cos) / (0.5 * c).cos) - 1
					}
				},
				176 -> {
					t.triangleCentreA { :a :b :c |
						1 + (((0.5 * b).cos * (0.5 * c).cos) / (0.5 * a).cos)
					}
				}
			]) {
				n.error('kimberlingCenter: unknown n')
			}
		}
	}

}
