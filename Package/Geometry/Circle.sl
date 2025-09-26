Circle : [Object, Geometry] { | center radius |

	= { :self :anObject |
		self.hasEqualSlots(anObject)
	}

	~ { :self :anObject |
		self.hasEqualSlotsBy(anObject, ~)
	}

	asGeneralisedCircle { :self |
		let c = 1;
		let [r, i] = self.center;
		let alpha = Complex(r.negate, i);
		let d = alpha.abs.square - self.radius.square;
		GeneralisedCircle(c, alpha, d)
	}

	arcLength { :self |
		self.circumference
	}

	area { :self |
		self.radius.square.pi
	}

	boundingBox { :self |
		[
			self.center - self.radius,
			self.center + self.radius
		]
	}

	centroid { :self |
		self.center
	}

	circumference { :self |
		(self.radius * 2).pi
	}

	containsPoint { :self :p |
		p.euclideanDistance(self.center) <= self.radius
	}

	curvature { :self |
		1 / self.radius
	}

	diameter { :self |
		self.radius * 2
	}

	dimension { :unused |
		1
	}

	eccentricity { :unused |
		0
	}

	embeddingDimension { :self |
		self.center.size
	}

	implicitEquation { :self |
		let [a, b] = self.center;
		let rSquared = self.radius.square;
		{ :x :y |
			(x - a).square + (y - b).square - rSquared
		}
	}

	inversiveDistance { :c1 :c2 |
		let a = c1.radius;
		let b = c2.radius;
		let c = (c2.center - c1.center).norm;
		(c.square - a.square - b.square) / (2 * a * b)
	}

	inversiveDistanceDelta { :c1 :c2 |
		c1.inversiveDistance(c2).abs.arcCosh
	}

	isOrthogonalCircle { :self :operand |
		let r1 = self.radius;
		let r2 = operand.radius;
		let c1 = self.center;
		let c2 = operand.center;
		(r1.square + r2.square).isVeryCloseTo(
			(c2 - c1).norm.square
		)
	}

	svgFragment { :self :options |
		let precision = options['precision'];
		'<circle cx="%" cy="%" r="%" />'.format([
			self.center[1].printStringToFixed(precision),
			self.center[2].printStringToFixed(precision),
			self.radius.printStringToFixed(precision)
		])
	}

	perimeter { :self |
		self.circumference
	}

	randomPoint { :self :rng :shape |
		let c = self.center;
		let r = self.radius;
		let u = UnitCircle();
		{
			u.randomPoint(rng) * r + c
		} ! shape
	}

	scale { :self :m |
		Circle(self.center, self.radius * m)
	}

	storeString { :self |
		'Circle(%, %)'.format([
			self.center.storeString,
			self.radius.storeString
		])
	}

	translate { :self :factor |
		self.center := self.center + factor
	}

	translate { :self :factor |
		Circle(self.center + factor, self.radius)
	}

	x { :self |
		self.center[1]
	}

	y { :self |
		self.center[2]
	}

}

+List {

	Circle { :center :radius |
		(center.rank > 1).if {
			center.withCollect(radius.nest, Circle:/2)
		} {
			newCircle().initializeSlots(center, radius)
		}
	}

	circleThrough { :self |
		let k = self.size;
		(k < 2 | { k > 3 }).if {
			self.error('circleThrough')
		} {
			k.caseOf([
				2 -> {
					let [a, b] = self;
					let c = (a + b) / 2;
					let r = a.euclideanDistance(b) / 2;
					Circle(c, r)
				},
				3 -> {
					let [z1, z2, z3] = self.collect(asComplex:/1);
					let w = (z3 - z1) / (z2 - z1);
					let c = (z2 - z1) * (w - (w.abs ^ 2)) / (0J2 * w.imaginary) + z1;
					let r = (z1 - c).abs;
					Circle(c.asList, r)
				}
			])
		}
	}

	isDescartesQuadruple { :self |
		self.size = 4 & {
			(2 * self.square.sum) = self.sum.square
		}
	}

	unitCircle { :center |
		Circle(center, 1)
	}

	welzlAlgorithm { :p :r |
		(p.isEmpty | { r.size = 3 }).if {
			r.size.caseOf([
				0 -> { Circle([0 0], 0) },
				1 -> { Circle(r[1], 0) }
			]) {
				r.circleThrough
			}
		} {
			let x = p.first;
			let c = welzlAlgorithm(p.allButFirst, r.copy);
			c.containsPoint(x).if {
				c
			} {
				welzlAlgorithm(p.allButFirst, r ++ [x])
			}
		}
	}

	welzlAlgorithm { :self |
		let p = self.shuffled(system);
		welzlAlgorithm(p, [])
	}

}

UnitCircle : [Object] {

	randomPoint { :self :r |
		var x1, x2, sum, z;
		{
			x1 := r.nextRandomFloat * 2 - 1;
			x2 := r.nextRandomFloat * 2 - 1;
			sum := (x1 * x1) + (x2 * x2)
		}.doWhileTrue {
			sum >= 1
		};
		z := (x1 * x1) - (x2 * x2);
		[
			z / sum,
			2 * x1 * x2 / sum
		]
	}

	randomPoint { :self :r :shape |
		{
			self.randomPoint(r)
		} ! shape
	}

}

+Void {

	UnitCircle {
		newUnitCircle()
	}

}

+Fraction {

	fordCircle { :self |
		let [h, k] = self.asList;
		let r = 1 / (2 * k.square);
		Circle([h / k, r], r)
	}

}

+List {

	fordCircle { :self |
		self.collect(fordCircle:/1)
	}

}


+Circle {

	circleInversion { :self |
		let c = self.center;
		let r = self.radius;
		{ :u |
			u.isVeryCloseTo(c).if {
				Infinity
			} {
				let v = u - c;
				let w = v.norm;
				c + ((r.square * v) / w.square)
			}
		}
	}

	circleInversion { :self :reference |
		let [x, y] = self.center;
		let a = self.radius;
		let [x0, y0] = reference.center;
		let k = reference.radius;
		let s = k.square / ((x - x0).square + (y - y0).square - a.square);
		Circle(
			[
				x0 + (s * (x - x0)),
				y0 + (s * (y - y0))
			],
			s.abs * a
		)
	}

	circlePower { :self |
		let c = self.center;
		let r = self.radius;
		{ :u |
			(u - c).norm.square - r.square
		}
	}

}

+List {

	circleInversion { :self :circle |
		let f:/1 = circle.circleInversion;
		self.isVector.if {
			f(self)
		} {
			self.collect(f:/1)
		}
	}

	circlePower { :self :circle |
		let f:/1 = circle.circlePower;
		self.isVector.if {
			f(self)
		} {
			self.collect(f:/1)
		}
	}

}


+SmallFloat {

	annularSteinerChain { :n :c :r |
		let theta = 1.pi / n;
		let rho = (r * theta.sin) / (1 - theta.sin);
		let rr = (theta.sec + theta.tan).square * r;
		[
			Circle(c, r),
			Circle(c, rr),
			n.circlePoints(c, r + rho, 0)
			.collect { :each |
				Circle(each, rho)
			}
		].GeometryCollection
	}

	circleInversion { :self :circle |
		(self = Infinity).if {
			circle.center
		} {
			self.error('circleInversion?')
		}
	}

}

+Complex {

	circleInversion { :self :circle |
		self.asList.circleInversion(circle).asComplex
	}

}
