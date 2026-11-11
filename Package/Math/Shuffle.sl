+@RandomNumberGenerator {

	fisherYatesShuffle! { :self :aList |
		aList.size.toByDo(2, -1) { :each |
			aList.swapWith!(
				each,
				self.nextRandomSmallInteger(1.0, each)
			)
		};
		aList
	}

	sattoloShuffle! { :self :aList |
		let i = aList.size;
		{
			i > 1L
		}.whileTrue {
			let j = self.nextRandomSmallInteger(1.0, i - 1.0);
			aList.swapWith!(i, j);
			i := i - 1L
		};
		aList
	}

}

+@Sequence {

	fisherYatesShuffle! { :self :rng |
		rng.fisherYatesShuffle!(self)
	}

	fisherYatesShuffle! { :self |
		system.fisherYatesShuffle!(self)
	}

	guyShuffle { :c |
		let n = c.size;
		let d = c ++ (n + [1L, 2L]);
		d.partition(n // 2L + 1L).reverse.transpose.catenate
	}

	inShuffle { :self |
		let n = self.size;
		let m = n.isOdd.if { (n - 1L) // 2L } { n // 2L };
		let p = self.copyFromTo(1L, m);
		let q = self.copyFromTo(m + 1L, n);
		q.riffle(p)
	}

	inShuffle { :self :n |
		let x = self;
		{
			n > 0L
		}.whileTrue {
			x := x.inShuffle;
			n := n - 1L
		};
		x
	}

	klondikeShuffle { :self |
		let r = [];
		let i = 1L;
		let j = self.size;
		{
			i < j
		}.whileTrue {
			r.addFirst!(self[j]);
			r.addFirst!(self[i]);
			i := i + 1L;
			j := j - 1L
		};
		(i = j).ifTrue {
			r.addFirst!(self[i])
		};
		r
	}

	klondikeShuffle { :self :n |
		let x = self;
		{
			n > 0L
		}.whileTrue {
			x := x.klondikeShuffle;
			n := n - 1L
		};
		x
	}

	milkShuffle { :self |
		self.atAll(
			self.size.milkShuffleIndices
		)
	}

	mongesShuffle { :self |
		let answer = [];
		let top = false;
		self.do { :each |
			top.if {
				answer.addFirst!(each)
			} {
				answer.addLast!(each)
			};
			top := top.not
		};
		answer
	}

	mongesShuffle { :self :n |
		let x = self;
		{
			n > 0L
		}.whileTrue {
			x := x.mongesShuffle;
			n := n - 1L
		};
		x
	}

	outShuffle { :self |
		let n = self.size;
		let m = n.isOdd.if { (n + 1L) // 2 } { n // 2 };
		let p = self.copyFromTo(1L, m);
		let q = self.copyFromTo(m + 1L, n);
		p.riffle(q)
	}

	outShuffle { :self :n |
		let x = self;
		{
			n > 0L
		}.whileTrue {
			x := x.outShuffle;
			n := n - 1L
		};
		x
	}

	sattoloShuffle! { :self :rng |
		rng.sattoloShuffle!(self)
	}

	sattoloShuffle! { :self |
		system.sattoloShuffle!(self)
	}

	shuffle { :self :rng |
		self.copy.fisherYatesShuffle!(rng)
	}

	shuffle { :self |
		self.copy.fisherYatesShuffle!
	}

	shuffle! { :self :rng |
		self.fisherYatesShuffle!(rng)
	}

	shuffle! { :self |
		self.fisherYatesShuffle!
	}

	spiralShuffle { :self |
		let a = self.copyList;
		let b = [];
		let c = true;
		{
			a.isEmpty
		}.whileFalse {
			let x = a.removeFirst!;
			c.if {
				b.addFirst!(x)
			} {
				a.addLast!(x)
			};
			c := c.not
		};
		b
	}

	spiralShuffle { :self :n |
		let x = self;
		{
			n > 0L
		}.whileTrue {
			x := x.spiralShuffle;
			n := n - 1L
		};
		x
	}

}

+@Integer {

	milkShuffleIndices { :n |
		let m = n // 2;
		let a = [1L .. m].reverse;
		let b = [m + 1L .. n];
		(a.size >= b.size).if {
			a.riffle(b)
		} {
			b.riffle(a)
		}
	}

}
