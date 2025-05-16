Circle : [Object] { | center radius |

	= { :self :anObject |
		self.hasEqualSlots(anObject)
	}

	~ { :self :anObject |
		self.hasEqualSlotsBy(anObject, ~)
	}

	arcLength { :self |
		self.circumference
	}

	area { :self |
		self.radius.squared.pi
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

	diameter { :self |
		self.radius * 2
	}

	dimension { :self |
		1
	}

	embeddingDimension { :self |
		2
	}

	forSvg { :self :options |
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

	storeString { :self |
		'Circle(%, %)'.format([
			self.center.storeString,
			self.radius.storeString
		])
	}

	translateBy { :self :factor |
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

	unitCircle { :center |
		Circle(center, 1)
	}

	welzlAlgorithm { :p :r |
		(p.isEmpty | { r.size = 3 }).if {
			r.size.caseOfOtherwise([
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

+SmallFloat {

	epitrochoid { :b :a :h |
		{ :theta |
			let p = a + b;
			let q = p / b;
			[
				(p * theta.cos) - (h * (q * theta).cos),
				(p * theta.sin) - (h * (q * theta).sin)
			]
		}
	}

}
