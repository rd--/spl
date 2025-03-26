Circle : [Object] { | center radius |

	= { :self :anObject |
		anObject.isCircle & {
			self.center = anObject.center & {
				self.radius = anObject.radius
			}
		}
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

	unitCircle { :center |
		Circle(center, 1)
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
		{ self.randomPoint(r) } ! shape
	}

}

+Void {

	UnitCircle {
		newUnitCircle()
	}

}
