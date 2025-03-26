Disk : [Object] { | center radius |

	randomPoint { :self :rng :shape |
		let c = self.center;
		let r = self.radius;
		let u = UnitDisk();
		{
			u.randomPoint(rng) * r + c
		} ! shape
	}

}


+List {

	Disk { :center :radius |
		newDisk().initializeSlots(center, radius)
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
