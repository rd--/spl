+ Array {

	clump { :self :groupSize |
		<primitive: return sc.clump(_self, _groupSize);>
	}

	extendToBeOfEqualSize { :self |
		|
			selfLifted = self.collect(asArray),
			maximumSize = selfLifted.collect(size).detectMax(identity);
		|
		selfLifted.collect({ :each |
			each.extendTo(maximumSize)
		})
	}

}
