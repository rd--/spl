Simplex : [Object] { | coordinates |

	content { :self |
		self.coordinates.cayleyMengerDeterminant
	}

}

+List {

	Simplex { :self |
		newSimplex().initializeSlots(self)
	}

}

+SmallFloat {

	kuhnTriangulation { :self |
		let basisVector = { :n :m |
			[1 .. n].collect { :each |
				(each = m).boole
			}
		};
		let simplexVector = { :p |
			let k = p.size;
			[
				[0 # k],
				p.collect { :each |
					basisVector(k, each)
				}
			].catenate.prefixSum
		};
		[1 .. self].permutations.collect { :each |
			each.simplexVector
		}
	}

}
