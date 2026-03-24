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
