+@Sequence {

	addCosine { :self :harmonicNumber :amplitude :initialPhase :offset |
		self.addSine(harmonicNumber, amplitude, initialPhase + 0.5.pi, offset)
	}

	addSine { :self :harmonicNumber :amplitude :initialPhase :offset |
		let size = self.size;
		let increment = 2.pi * harmonicNumber / size;
		let phase = initialPhase;
		(1 .. size).do { :each |
			self[each] := self[each] + (phase.sin * amplitude + offset);
			phase := phase + increment
		}
	}

	hammingWindow { :self |
		self.atAllPut(0.53836);
		self.addSine(1, 0.46164, -0.5.pi, 0)
	}

	hannWindow { :self |
		self.atAllPut(0.5);
		self.addSine(1, 0.5, -0.5.pi, 0)
	}

	sineFill { :self :amplitudes :phases |
		self.atAllPut(0);
		amplitudes.withIndexDo { :each :index |
			self.addSine(index, each, phases.atWrap(index), 0)
		}
	}

	welchWindow { :self |
		self.atAllPut(0);
		self.addSine(0.5, 1, 0, 0)
	}

}


+@Integer {

	gen05 { :self :aSequence |
		let answer = [];
		let y1 = aSequence[1];
		2.toByDo(aSequence.size, 2) { :i |
			let n = aSequence[i];
			let y2 = aSequence[i + 1];
			let z = (y2 / y1) ^ (1 / n);
			n.timesRepeat {
				answer.add(y1);
				y1 := y1 * z
			};
			y1 := y2

		};
		answer
	}

	gen07 { :self :aSequence |
		let answer = [];
		let y1 = aSequence[1];
		2.toByDo(aSequence.size, 2) { :i |
			let n = aSequence[i];
			let y2 = aSequence[i + 1];
			let z = (y2 - y1) / n;
			n.timesRepeat {
				answer.add(y1);
				y1 := y1 + z
			};
			y1 := y2
		};
		answer
	}

	gen09 { :self :aMatrix |
		let answer = List(self, 0);
		aMatrix.do { :each |
			answer.addSine(each[1], each[2], each[3].degreesToRadians, 0)
		};
		answer / answer.absMax
	}

	gen10 { :self :amplitudes |
		let answer = List(self, 0);
		let partial = 1;
		amplitudes.do { :each |
			answer.addSine(partial, each, 0, 0);
			partial := partial + 1
		};
		answer / answer.absMax
	}

	gen11 { :self :numberOfHarmonics :lowestHarmonic :multiplier |
		let answer = List(self, 0);
		let partial = lowestHarmonic;
		let amplitude = 1;
		1.toDo(numberOfHarmonics) { :each |
			answer.addCosine(partial, amplitude, 0, 0);
			partial := partial + 1;
			amplitude := multiplier ^ each
		};
		answer / answer.absMax
	}

	gen16 { :self :aSequence |
		let answer = [];
		let y1 = aSequence[1];
		2.toByDo(aSequence.size, 3) { :i |
			let n = aSequence[i];
			let alpha = aSequence[i + 1];
			let y2 = aSequence[i + 2];
			(alpha = 0).if {
				let z = (y2 - y1) / n;
				n.timesRepeat {
					answer.add(y1);
					y1 := y1 + z
				}
			} {
				let z = (y2 - y1) / (1 - alpha.exp);
				let beta = alpha / n;
				let x = beta;
				n.timesRepeat {
					answer.add(y1 + (z * (1 - x.exp)));
					x := x + beta
				}
			};
			y1 := y2
		};
		answer
	}

	gen19 { :self :aMatrix |
		let answer = List(self, 0);
		aMatrix.do { :each |
			answer.addSine(each[1], each[2], each[3].degreesToRadians, each[4])
		};
		answer / answer.absMax
	}

	sineTable { :self :amplitudes :phases |
		let answer = List(self, 0);
		answer.sineFill(amplitudes, phases);
		answer
	}

}
