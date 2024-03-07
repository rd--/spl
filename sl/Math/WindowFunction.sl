+@Number {

	bartlettFunction { :self |
		(self.abs > 0.5).if {
			0
		}  {
			(self  > 0).if {
				1 - (2 * self)
			} {
				1 + (2 * self)
			}
		}
	}

	blackmanFunction { :self |
		(self.abs > 0.5).if {
			0
		}  {
			(1 / 50) * (25 * (2.pi * self).cos + (4 * (4.pi * self).cos) + 21)
		}
	}

	dirichletFunction { :self |
		(self.abs > 0.5).if {
			0
		}  {
			1
		}
	}

	hammingFunction { :self |
		(self.abs > 0.5).if {
			0
		}  {
			(21 / 46) * (2.pi * self).cos + (25 / 46)
		}
	}

	hannFunction { :self :alpha |
		(self.abs > 0.5).if {
			0
		}  {
			let c = (2.pi * self).cos;
			alpha - (alpha * c) + c
		}
	}

	welchFunction { :self :alpha |
		(self.abs > 0.5).if {
			0
		}  {
			(alpha.squared - (4 * self.squared)) / alpha.squared
		}
	}

	welchFunction { :self |
		self.welchFunction(1)
	}

}

+@Collection {

	bartlettFunction { :self |
		self.collect(bartlettFunction:/1)
	}

	blackmanFunction { :self |
		self.collect(blackmanFunction:/1)
	}

	dirichletFunction { :self |
		self.collect(dirichletFunction:/1)
	}

	hammingFunction { :self |
		self.collect(hammingFunction:/1)
	}

	hannFunction { :self :alpha |
		self.collect { :each |
			each.hannFunction(alpha)
		}
	}

	hannFunction { :self |
		self.hannFunction(0.5)
	}

	welchFunction { :self :alpha |
		self.collect { :each |
			each.welchFunction(alpha)
		}
	}

	welchFunction { :self |
		self.collect(welchFunction:/1)
	}

}

+@Integer {

	hammingWindow { :self |
		let answer = List(self);
		answer.hammingWindow;
		answer
	}

	hanningWindow { :self |
		let answer = List(self);
		answer.hanningWindow;
		answer
	}

	welchWindow { :self |
		let answer = List(self);
		answer.welchWindow;
		answer
	}

}

+@Sequence {

	addSine { :self :harmonicNumber :amplitude :initialPhase |
		let size = self.size;
		let frequency = 1 / harmonicNumber;
		let increment = 2 * pi / size * frequency;
		let phase = initialPhase;
		(1 .. size).do { :each |
			self[each] := self[each] + (phase.sin * amplitude);
			phase := phase + increment
		}
	}

	hammingWindow { :self |
		self.atAllPut(0.53836);
		self.addSine(1, 0.46164, -0.5.pi)
	}

	hanningWindow { :self |
		self.atAllPut(0.5);
		self.addSine(1, 0.5, -0.5.pi)
	}

	welchWindow { :self |
		self.atAllPut(0);
		self.addSine(0.5, 1, 0)
	}

}
