+ Array {

	clump { :self :groupSize |
		<primitive: return sc.clump(_self, _groupSize);>
	}

	extendToBeOfEqualSize { :self |
		|
			selfLifted = self.collect(asArray:/1),
			maximumSize = selfLifted.collect(size:/1).detectMax(identity:/1);
		|
		selfLifted.collect { :each |
			each.extendTo(maximumSize)
		}
	}

}
