Ball : [Object] { | center radius |

	dimension { :self |
		3
	}

	embeddingDimension { :self |
		self.center.size
	}

	randomPoint { :self :aRandom :shape |
		let c = self.center;
		let r = self.radius;
		let u = UnitBall();
		{
			u.randomPoint(aRandom) * r + c
		} ! shape
	}

	volume { :self |
		(self.radius.cube * 4 / 3).pi
	}

}

+List {

	Ball { :center :radius |
		newBall().initializeSlots(center, radius)
	}

}

UnitBall : [Object] {

	randomPoint { :self :r |
		let x1 = r.nextRandomFloat * 2 - 1;
		let x2 = r.nextRandomFloat * 2 - 1;
		let x3 = r.nextRandomFloat * 2 - 1;
		((x1 * x1) + (x2 * x2) + (x3 * x3) <= 1).if {
			[x1 x2 x3]
		} {
			self.randomPoint(r)
		}
	}

	randomPoint { :self :r :shape |
		{ self.randomPoint(r) } ! shape
	}

}

+Void {

	UnitBall {
		newUnitBall()
	}

}
