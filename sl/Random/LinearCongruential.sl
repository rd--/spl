LinearCongruential : [Object, Random] { | state |

	randomFloat { :self |
		let m = 139968;
		let a = 3877;
		let c = 29573;
		let r = (self.state * a + c) \\ m;
		self.state := r;
		r / m
	}

}

+Void {

	LinearCongruential {
		newLinearCongruential().initializeSlots(42)
	}

}
