Simplex : [Object, Equal] {

	| coordinates | <List>

	content { :self |
		self.coordinates.cayleyMengerDeterminant
	}

}

+List {

	Simplex { :self |
		uncheckedSimplex(self)
	}

}

+[Integer, @SmallInteger] {

	kuhnTriangulation { :self |
		let basisVector = { :n :m |
			[1L .. n].collect { :each |
				(each = m).boole
			}
		};
		let simplexVector = { :p |
			let k = p.size;
			[
				[List(k, 0L)],
				p.collect { :each |
					basisVector(k, each)
				}
			].catenate.prefixSum
		};
		[1L .. self].permutations.collect { :each |
			each.simplexVector
		}
	}

}
