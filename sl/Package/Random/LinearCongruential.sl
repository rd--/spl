LinearCongruential : [Object, Random] { | state |

	randomFloat { :self |
		|(
			m = 139968,
			a = 3877,
			c = 29573,
			r = (self.state * a + c) \\ m
		)|
		self.state := r;
		r / m
	}

}

+Void {

	LinearCongruential {
		newLinearCongruential().initializeSlots(42)
	}

}
