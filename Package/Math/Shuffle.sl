+@Sequenceable {

	fisherYatesShuffle { :self :rng |
		self.size.toByDo(2, -1) { :each |
			self.swapWith(
				each,
				rng.nextRandomInteger(1, each)
			)
		};
		self
	}

	fisherYatesShuffle { :self |
		self.fisherYatesShuffle(system)
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
		let i = self.size;
		{
			i > 1
		}.whileTrue {
			let j = rng.nextRandomInteger(1, i - 1);
			self.swapWith(i, j);
			i := i - 1
		};
		self
	}

	sattoloShuffle { :self |
		self.sattoloShuffle(system)
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
