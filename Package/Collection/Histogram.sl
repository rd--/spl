+@Collection {

	binCounts { :self :b |
		self.binLists(b).collect(size:/1)
	}

	binCounts { :self :b1 :b2 |
		self.binLists(b1, b2).collect { :each |
			each.collect(size:/1)
		}
	}

	binListsFor { :self :b |
		let n = b.size;
		let c = { [] } ! (n - 1);
		self.do { :e |
			(e >= b[1] & { e <= b[n] }).ifTrue {
				let i = b.binarySearchLeftmost(e).min(n - 1);
				c[i].add(e)
			}
		};
		c
	}

	binListsFor { :self :b1 :b2 |
		let [m, n] = [b1.size, b2.size];
		let c = { [] } ! [m - 1, n - 1];
		self.do { :e |
			let [e1, e2] = e;
			(
				e1 >= b1[1] & {
					e1 <= b1[m] & {
						e2 >= b2[1] & {
							e2 <= b2[n]
						}
					}
				}
			).ifTrue {
				let i = b1.binarySearchLeftmost(e1).min(m - 1);
				let j = b2.binarySearchLeftmost(e2).min(n - 1);
				c[i][j].add(e)
			}
		};
		c
	}

	binLists { :self :b |
		let [start, stop, step] = b;
		self.binListsFor(
			Range(start, stop, step).asList
		)
	}

	binLists { :self :b1 :b2 |
		let [start1, stop1, step1] = b1;
		let [start2, stop2, step2] = b2;
		self.binListsFor(
			Range(start1, stop1, step1).asList,
			Range(start2, stop2, step2).asList
		)
	}

	freedmanDiaconisRule { :self |
		let n = self.size;
		2 * (self.interquartileRange / (n ^ (1 / 3)))
	}

	histogramOf { :self |
		self.histogramOf { :each |
			each
		}
	}

	histogramListFor { :self :b |
		[b, self.binListsFor(b).collect(size:/1)]
	}

	histogramList { :self :b |
		let [start, stop, step] = b;
		self.histogramListFor(
			Range(start, stop, step).asList
		)
	}

	histogramList { :self |
		let k = self.size.sqrt.ceiling + 1;
		let [min, max] = self.minMax;
		let b = (min -- max).findDivisions(k);
		self.histogramListFor(b.asList)
	}

	scottsRule { :self |
		let n = self.size;
		self.standardDeviation * ((24 * 1.pi.sqrt) / n).cubeRoot
	}

	sturgesRule { :self |
		let n = self.size;
		n.log(2).floor + 1
	}

}
