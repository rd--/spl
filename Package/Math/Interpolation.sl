+[SmallFloat, List] {

	blend { :y1 :y2 :mu |
		y1.blend(y2, mu) { :y1 :y2 :mu |
			y1 + (mu * (y2 - y1))
		}
	}

	blend { :y1 :y2 :mu :aBlock:/3 |
		mu.isSequence.if {
			mu.collect { :each |
				y1.blend(y2, each, aBlock:/3)
			}
		} {
			aBlock(y1, y2, mu)
		}
	}

	catmullRomInterpolation { :y0 :y1 :y2 :y3 :mu |
		let a0 = (-0.5 * y0) + (1.5 * y1) - (1.5 * y2) + (0.5 * y3);
		let a1 = y0 - (2.5 * y1) + (2 * y2) - (0.5 * y3);
		let a2 = (-0.5 * y0) + (0.5 * y2);
		let a3 = y1;
		let mu2 = mu * mu;
		let mu3 = mu2 * mu;
		(a0 * mu3) + (a1 * mu2) + (a2 * mu) + a3
	}

	cosineInterpolation { :y1 :y2 :mu |
		let x = (1 - mu.pi.cos) / 2;
		(y1 * (1 - x)) + (y2 * x)
	}

	cubicInterpolation { :y0 :y1 :y2 :y3 :mu |
		let a0 = y3 - y2 - y0 + y1;
		let a1 = y0 - y1 - a0;
		let a2 = y2 - y0;
		let a3 = y1;
		let mu2 = mu * mu;
		let mu3 = mu2 * mu;
		(a0 * mu3) + (a1 * mu2) + (a2 * mu) + a3
	}

	hermiteInterpolation { :y0 :y1 :y2 :y3 :mu :tension :bias |
		let mu2 = mu * mu;
		let mu3 = mu2 * mu;
		let m0 = ((y1 - y0) * (1 + bias) * (1 - tension) / 2) + ((y2 - y1) * (1 - bias) * (1 - tension) / 2);
		let m1 = ((y2 - y1) * (1 + bias) * (1 - tension) / 2) + ((y3 - y2) * (1 - bias) * (1 - tension) / 2);
		let a0 = (2 * mu3) - (3 * mu2) + 1;
		let a1 = mu3 - (2 * mu2) + mu;
		let a2 = mu3 - mu2;
		let a3 = (-2 * mu3) + (3 * mu2);
		(a0 * y1) + (a1 * m0) + (a2 * m1) + (a3 * y2)
	}

	linearInterpolation { :y1 :y2 :mu |
		(y1 * (1 - mu)) + (y2 * mu)
	}

}

+List {

	listInterpolation { :self :aBlock |
		let k = self.size;
		aBlock.numArgs.caseOfOtherwise([
			3 -> {
				{ :x |
					let i = x.integerPart;
					(i = k).if {
						self.last
					} {
						aBlock . (
							self[i],
							self[i + 1],
							x.fractionPart
						)
					}
				}
			},
			5 -> {
				{ :x |
					let i = x.integerPart;
					(i = k).if {
						self.last
					} {
						aBlock . (
							self[(i - 1).max(1)],
							self[i],
							self[i + 1],
							self[(i + 2).min(k)],
							x.fractionPart
						)
					}
				}
			}
		]) {
			self.error('listInterpolation: not 3- or 5- argument block')
		}
	}

}

+@Sequence {

	basicDownsampleSteinarsson { :self :threshold |
		<primitive: return sc.downsampleSteinarsson(_self, _threshold);>
	}

	downsample { :self :anInteger |
		(1, 1 + anInteger .. self.size).collect { :each |
			self[each]
		}
	}

	downsampleSteinarsson { :self :threshold |
		self.isVector.if {
			[self.indices, self].transposed.basicDownsampleSteinarsson(threshold)
		} {
			self.basicDownsampleSteinarsson(threshold)
		}
	}

	upsample { :self :anInteger |
		let answer = List(self.size * anInteger, 0);
		0.to(self.size - 1).do { :each |
			answer[(each * anInteger) + 1] := self[each + 1]
		};
		answer
	}

}
