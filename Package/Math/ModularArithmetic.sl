+@Integer {

	modularDistance { :i :j :m |
		(i - j).abs.min(m - (i - j).abs)
	}

}

+List {

	isErdosDeep { :a :m |
		let n = a.size - 1;
		n > 0 & {
			let d = a.modularDistanceMultiset(m);
			let k = d.sortedCounts.keys;
			k = [n, n - 1 .. 1]
		}
	}

	isWinogradDeep { :a :m |
		let n = m // 2;
		n > 0 & {
			let d = a.modularDistanceMultiset(m);
			let k = d.sortedCounts.keys;
			k = [n, n - 1 .. 1]
		}
	}

	modularDistanceMultiset { :a :m |
		let k = a.size;
		let d = List();
		a.do { :p |
			a.do { :q |
				(p < q).ifTrue {
					d.add(p.modularDistance(q, m))
				}
			}
		};
		d.Multiset
	}

}

+@Collection {

	isPerfectDifferenceSet { :self :modulus |
		let k = self.size - 1;
		(modulus = (k.square + k + 1)) & {
			let a = self.tuples(2).select { :t | t[1] != t[2] };
			let b = a.collect { :t | t[1] - t[2] % modulus }.sort;
			b = [1 .. modulus - 1]
		}
	}

	perfectDifferenceSetGraph { :self :modulus |
		self.isPerfectDifferenceSet(modulus).if {
			let v = [1 .. modulus];
			let e = v.tuples(2).select { :t |
				t[1] < t[2] & {
					let d = t[1] + t[2] % modulus;
					self.includes(d)
				}
			};
			let g = Graph(v, e);
			/* g.vertexLabels := v % modulus; */
			g
		} {
			self.error('perfectDifferenceSetGraph')
		}
	}

}
