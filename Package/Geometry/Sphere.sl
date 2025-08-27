Sphere : [Object] { | center radius |

	= { :self :anObject |
		anObject.isSphere & {
			self.center = anObject.center & {
				self.radius = anObject.radius
			}
		}
	}

	area { :self |
		(self.radius.square * 4).pi
	}

	diameter { :self |
		self.radius * 2
	}

	dimension { :self |
		2
	}

	embeddingDimension { :self |
		self.center.size
	}

	randomPoint { :self :aRandom :shape |
		let c = self.center;
		let r = self.radius;
		let u = UnitSphere();
		{
			u.randomPoint(aRandom) * r + c
		} ! shape
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

	translateBy { :self :factor |
		Sphere(self.center + factor, self.radius)
	}

	x { :self |
		self.center[1]
	}

	y { :self |
		self.center[2]
	}

	z { :self |
		self.center[3]
	}

}

+List {

	Sphere { :center :radius |
		newSphere().initializeSlots(center, radius)
	}

}

UnitSphere : [Object] {

	randomPoint { :self :r |
		let x1 = r.nextRandomFloat * 2 - 1;
		let x2 = r.nextRandomFloat * 2 - 1;
		let sum = (x1 * x1) + (x2 * x2);
		(sum >= 1).if {
			self.randomPoint(r)
		} {
			let z = 2 * (1 - sum).sqrt;
			[x1 * z, x2 * z, 1 - (2 * sum)]
		}
	}

	randomPoint { :self :r :shape |
		{ self.randomPoint(r) } ! shape
	}

}

+Void {

	UnitSphere {
		newUnitSphere()
	}

}
