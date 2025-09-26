Disk : [Object, Geometry] { | center radius |

	asCircle { :self |
		Circle(self.center, self.radius)
	}

	boundingBox { :self |
		self.asCircle.boundingBox
	}

	dimension { :unused |
		2
	}

	embeddingDimension { :unused |
		2
	}

	randomPoint { :self :rng :shape |
		let c = self.center;
		let r = self.radius;
		let u = UnitDisk();
		{
			u.randomPoint(rng) * r + c
		} ! shape
	}

	svgFragment { :self :options |
		let precision = options['precision'];
		'<circle cx="%" cy="%" r="%" fill="black" />'.format([
			self.center[1].printStringToFixed(precision),
			self.center[2].printStringToFixed(precision),
			self.radius.printStringToFixed(precision)
		])
	}

}


+List {

	Disk { :center :radius |
		(center.rank > 1).if {
			center.withCollect(radius.nest, Disk:/2)
		} {
			newDisk().initializeSlots(center, radius)
		}
	}

}

UnitDisk : [Object] {

	randomPoint { :self :r |
		var x1, x2;
		{
			x1 := r.nextRandomFloat * 2 - 1;
			x2 := r.nextRandomFloat * 2 - 1
		}.doWhileTrue {
			(x1 * x1) + (x2 * x2) > 1
		};
		[x1 x2]
	}

}

+Void {

	UnitDisk {
		newUnitDisk()
	}

}
