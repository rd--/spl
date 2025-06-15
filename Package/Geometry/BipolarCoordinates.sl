+SmallFloat {

	fromBipolarCoordinates { :a :v |
		v.isVector.if {
			let [sigma, tau] = v;
			let x = a * (tau.sinh / (tau.cosh - sigma.cos));
			let y = a * (sigma.sin / (tau.cosh - sigma.cos));
			[x, y]
		} {
			v.collect { :each |
				fromBipolarCoordinates(a, each)
			}
		}
	}

}
