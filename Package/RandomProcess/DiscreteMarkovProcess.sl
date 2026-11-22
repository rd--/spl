DiscreteMarkovProcess : [Object] {

	| p0 m | <List>

	Stream { :self :r |
		let p0 = AliasMethod(self.p0);
		let m = self.m.collect(
			AliasMethod/1
		);
		let x = p0.nextRandom(r);
		FunctionStream {
			let h = x;
			x := m[x].nextRandom(r);
			h
		} {
			x := p0.nextRandom(r)
		}
	}

	randomFunction { :self :r :t :n |
		Stream(self, r).valueSeriesRandomFunction(t, n)
	}

}

+List {

	DiscreteMarkovProcess { :p0 :m |
		uncheckedDiscreteMarkovProcess(p0, m)
	}

}

+List {

	stochasticMatrix { :self |
		let stateList = self.catenate.nub.sort;
		let k = stateList.size;
		(stateList = [1L .. k]).if {
			let m = [k, k].zeroMatrix;
			self.do { :each |
				each.adjacentPairsDo { :i :j |
					m[i][j] := m[i][j] + 1L
				}
			};
			m / m.collect(sum/1)
		} {
			self.error('stochasticMatrix: invalid observations')
		}
	}

}

+TemporalData {

	estimatedDiscreteMarkovProcess { :self |
		let v = self.valueList;
		let m = v.stochasticMatrix;
		let k = m.size;
		let i = v.collect(first/1);
		let p0 = i.stochasticVector(k);
		DiscreteMarkovProcess(p0, m)
	}

}
