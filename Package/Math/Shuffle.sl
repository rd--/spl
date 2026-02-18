+@RandomNumberGenerator {

	fisherYatesShuffle { :self :aList |
		aList.size.toByDo(2, -1) { :each |
			aList.swapWith(
				each,
				self.nextRandomInteger(1, each)
			)
		};
		aList
	}

	sattoloShuffle { :self :aList |
		let i = aList.size;
		{
			i > 1
		}.whileTrue {
			let j = self.nextRandomInteger(1, i - 1);
			aList.swapWith(i, j);
			i := i - 1
		};
		aList
	}

}

+@Sequenceable {

	fisherYatesShuffle { :self :rng |
		rng.fisherYatesShuffle(self)
	}

	fisherYatesShuffle { :self |
		system.fisherYatesShuffle(self)
	}

	guyShuffle { :c |
		let n = c.size;
		let d = c ++ (n + [1, 2]);
		d.partition(n // 2 + 1).reverse.transpose.catenate
	}

	inShuffle { :self |
		let n = self.size;
		let m = n.isOdd.if { (n - 1) / 2 } { n / 2 };
		let p = self.copyFromTo(1, m);
		let q = self.copyFromTo(m + 1, n);
		q.riffle(p)
	}

	inShuffle { :self :n |
		let x = self;
		{ n > 0 }.whileTrue {
			x := x.inShuffle;
			n := n - 1
		};
		x
	}

	klondikeShuffle { :self |
		let r = [];
		let i = 1;
		let j = self.size;
		{ i < j }.whileTrue {
			r.addFirst(self[j]);
			r.addFirst(self[i]);
			i := i + 1;
			j := j - 1
		};
		(i = j).ifTrue {
			r.addFirst(self[i])
		};
		r
	}

	klondikeShuffle { :self :n |
		let x = self;
		{ n > 0 }.whileTrue {
			x := x.klondikeShuffle;
			n := n - 1
		};
		x
	}

	mongesShuffle { :self |
		let answer = [];
		let top = false;
		self.do { :each |
			top.if {
				answer.addFirst(each)
			} {
				answer.addLast(each)
			};
			top := top.not
		};
		answer
	}

	mongesShuffle { :self :n |
		let x = self;
		{ n > 0 }.whileTrue {
			x := x.mongesShuffle;
			n := n - 1
		};
		x
	}

	outShuffle { :self |
		let n = self.size;
		let m = n.isOdd.if { (n + 1) / 2 } { n / 2 };
		let p = self.copyFromTo(1, m);
		let q = self.copyFromTo(m + 1, n);
		p.riffle(q)
	}

	outShuffle { :self :n |
		let x = self;
		{ n > 0 }.whileTrue {
			x := x.outShuffle;
			n := n - 1
		};
		x
	}

	sattoloShuffle { :self :rng |
		rng.sattoloShuffle(self)
	}

	sattoloShuffle { :self |
		system.sattoloShuffle(self)
	}

	shuffle { :self :rng |
		self.fisherYatesShuffle(rng)
	}

	shuffle { :self |
		self.fisherYatesShuffle
	}

	shuffled { :self :rng |
		self.copy.fisherYatesShuffle(rng)
	}

	shuffled { :self |
		self.copy.fisherYatesShuffle
	}

	spiralShuffle { :self |
		let a = self.copyList;
		let b = [];
		let c = true;
		{ a.isEmpty }.whileFalse {
			let x = a.removeFirst;
			c.if {
				b.addFirst(x)
			} {
				a.addLast(x)
			};
			c := c.not
		};
		b
	}

	spiralShuffle { :self :n |
		let x = self;
		{ n > 0 }.whileTrue {
			x := x.spiralShuffle;
			n := n - 1
		};
		x
	}

}
