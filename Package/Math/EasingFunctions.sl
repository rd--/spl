+SmallFloat {

	easeNone { :t |
		t
	}

	easeInQuadratic { :t |
		t * t
	}

	easeOutQuadratic { :t |
		(0 - t) * (t - 2)
	}

	easeInOutQuadratic { :t |
		t := t * 2;
		if(t < 1) {
			0.5 * t * t
		} {
			-0.5 * (t - 1 * (t - 3) - 1)
		}
	}

	easeOutInQuadratic { :t |
		if(t < 0.5) {
			easeOutQuadratic(t * 2) * 0.5
		} {
			easeInQuadratic(2 * t - 1) * 0.5 + 0.5
		}
	}

	easeInCubic { :t |
		t * t * t
	}

	easeOutCubic { :t |
		t := t - 1;
		(t * t * t) + 1
	}

	easeInOutCubic { :t |
		t := t * 2;
		if(t < 1) {
			0.5 * t * t * t
		} {
			t := t - 2;
			0.5 * (t * t * t + 2)
		}
	}

	easeOutInCubic { :t |
		if(t < 0.5) {
			easeOutCubic(2 * t) / 2
		} {
			easeInCubic(2 * t - 1) / 2 + 0.5
		}
	}

	easeInQuartic { :t |
		t * t * t * t
	}

	easeOutQuartic { :t |
		t := t - 1;
		0 - (t * t * t * t - 1)
	}

	easeInOutQuartic { :t |
		t := t * 2;
		if(t < 1) {
			0.5 * t * t * t * t
		} {
			let z = t - 2;
			-0.5 * (z * z * z * z - 2)
		}
	}

	easeOutInQuartic { :t |
		if(t < 0.5) {
			easeOutQuartic(2 * t) / 2
		} {
			easeInQuartic(2 * t - 1) / 2 + 0.5
		}
	}

	easeInQuintic { :t |
		t * t * t * t * t
	}

	easeOutQuintic { :t |
		t := t - 1;
		t * t * t * t * t + 1
	}

	easeInOutQuintic { :t |
		t := t * 2;
		if(t < 1) {
			0.5 * t * t * t * t * t
		} {
			let z = t - 2;
			0.5 * (z * z * z * z * z + 2)
		}
	}

	easeOutInQuintic { :t |
		if(t < 0.5) {
			easeOutQuintic(2 * t) / 2
		} {
			easeInQuintic(2 * t - 1) / 2 + 0.5
		}
	}

	easeInSine { :t |
		0 - cos(t.pi / 2) + 1
	}

	easeOutSine { :t |
		sin(t.pi / 2)
	}

	easeInOutSine { :t |
		-0.5 * (cos(t.pi) - 1)
	}

	easeOutInSine { :t |
		if(t < 0.5) {
			easeOutSine(2 * t) / 2
		} {
			easeInSine(2 * t - 1) / 2 + 0.5
		}
	}

	easeInExponential { :t |
		2 ^ (10 * (t - 1))
	}

	easeOutExponential { :t |
		if(t = 1) {
			1
		} {
			0 - (2 ^ (-10 * t)) + 1
		}
	}

	easeInOutExponential { :t |
		if(t = 0) {
			0
		} {
			if(t = 1) {
				1
			} {
				t := t * 2;
				if(t < 1) {
					0.5 * (2 ^ (10 * (t - 1)))
				} {
					0.5 * (0 - (2 ^ (-10 * (t - 1))) + 2)
				}
			}
		}
	}

	easeOutInExponential { :t |
		if(t < 0.5) {
			easeOutExponential(2 * t) / 2
		} {
			easeInExponential(2 * t - 1) / 2 + 0.5
		}
	}

	easeInCircular { :t |
		0 - (sqrt(1 - (t * t)) - 1)
	}

	easeOutCircular { :t |
		t := t - 1;
		sqrt(1 - (t * t))
	}

	easeInOutCircular { :t |
		t := t * 2;
		if(t < 1) {
			-0.5 * (sqrt(1 - (t * t)) - 1)
		} {
			let z = t - 2;
			0.5 * (sqrt(1 - (z * z)) + 1)
		}
	}

	easeOutInCircular { :t |
		if(t < 0.5) {
			easeOutCircular(2 * t) / 2
		} {
			easeInCircular(2 * t - 1) / 2 + 0.5
		}
	}

	easeBounceFunction { :t :c :a |
		if(t = 1) {
			c
		} {
			if(t < (4 / 11)) {
				c * 7.5625 * t * t
			} {
				if(t < (8 / 11)) {
					t := t - (6 / 11);
					(0 - a) * (1 - (7.5625 * t * t + 0.75)) + c
				} {
					if(t < (10 / 11)) {
						t := t - (9 / 11);
						(0 - a) * (1 - (7.5625 * t * t + 0.9375)) + c
					} {
						t := t - (21 / 22);
						(0 - a) * (1 - (7.5625 * t * t + 0.984375)) + c
					}
				}
			}
		}
	}

	easeInBounce { :a |
		{ :t |
			1 - easeBounceFunction(1 - t, 1, a)
		}
	}

	easeOutBounce { :a |
		{ :t |
			easeBounceFunction(t, 1, a)
		}
	}

	easeInOutBounce { :a |
		let in:/1 = a.easeInBounce;
		let out:/1 = a.easeOutBounce;
		{ :t |
			if(t < 0.5) {
				in(2 * t) / 2
			} {
				if(t =1) {
					1
				} {
					out(2 * t - 1) / 2 + 0.5
				}
			}
		}
	}

	easeOutInBounce { :a |
		{ :t |
			if(t < 0.5) {
				easeBounceFunction(t * 2, 0.5, a)
			} {
				1 - easeBounceFunction(2 - (2 * t), 0.5, a)
			}
		}
	}

	easeInBack { :a |
		{ :t |
			t * t * ((a + 1) * t - a)
		}
	}

	easeOutBack { :a |
		{ :t |
			t := t - 1;
			t * t * ((a + 1) * t + a) + 1
		}
	}

	easeInOutBack { :a |
		{ :t |
			let a2 = a * 1.525;
			t := t * 2;
			if(t < 1) {
				0.5 * (t * t * ((a2 + 1) * t - a2))
			} {
				let t2 = t - 2;
				0.5 * (t2 * t2 * ((a2 + 1) * t2 + a2) + 2)
			}
		}
	}

	easeOutInBack { :a |
		let in:/1 = a.easeInBack;
		let out:/1 = a.easeOutBack;
		{ :t |
			if(t < 0.5) {
				out(2 * t) / 2
			} {
				in(2 * t - 1) / 2 + 0.5
			}
		}
	}

	easeInElastic { :t :b :c :d :a :p |
		if(t = 0) {
			b
		} {
			let tAdj = t / d;
			if(tAdj = 1) {
				b + c
			} {
				let s = nil;
				if(a < abs(c)) {
					a := c;
					s := p / 4
				} {
					s := p / 2.pi * arcSin(c / a)
				};
				tAdj := tAdj - 1;
				0 - (a * (2 ^ (10 * tAdj)) * sin((tAdj * d - s) * 2.pi / p)) + b
			}
		}
	}

	easeInElastic { :a :p |
		{ :t |
			easeInElastic(t, 0, 1, 1, a, p)
		}
	}

	easeOutElastic { :t :b :c :d :a :p |
		if(t = 0) {
			0
		} {
			if(t = 1) {
				c
			} {
				let s = nil;
				if(a < c) {
					a := c;
					s := p / 4
				} {
					s := p / 2.pi * arcSin(c / a)
				};
				a * (2 ^ (-10 * t)) * sin((t - s) * 2.pi / p) + c
			}
		}
	}

	easeOutElastic { :a :p |
		{ :t |
			easeOutElastic(t, 0, 1, 1, a, p)
		}
	}

	easeInOutElastic { :a :p |
		{ :t |
			if(t = 0) {
				0
			} {
				t := t * 2;
				if(t =2) {
					1
				} {
					let s = nil;
					if(a < 1) {
						a := 1;
						s := p / 4
					} {
						s := p / 2.pi * arcSin(1 / a)
					};
					if(t < 1) {
						-0.5 * (a * (2 ^ (10 * (t - 1))) * sin((t - 1 - s) * 2.pi / p))
					} {
						a * (2 ^ (-10 * (t - 1))) * sin((t - 1 - s) * 2.pi / p) * 0.5 + 1
					}
				}
			}
		}
	}

	easeOutInElastic { :a :p |
		{ :t |
			if(t < 0.5) {
				easeOutElastic(t * 2, 0, 0.5, 1, a, p)
			} {
				easeInElastic(2 * t - 1, 0.5, 0.5, 1, a, p)
			}
		}
	}

	easeInArcTan { :a |
		{ :t |
			arcTan((t - 1) * a) / arcTan(a) + 1
		}
	}

	easeOutArcTan { :a |
		{ :t |
			arcTan(t * a) / arcTan(a)
		}
	}

	easeInOutArcTan { :a |
		{ :t |
			arcTan((t - 0.5) * a) / (2 * arcTan(0.5 * a)) + 0.5
		}
	}

}

+String {

	easingFunction { :self |
		self.caseOf([
			{ 'InQuadratic' } -> { easeInQuadratic:/1 },
			{ 'OutQuadratic' } -> { easeOutQuadratic:/1 },
			{ 'InOutQuadratic' } -> { easeInOutQuadratic:/1 },
			{ 'OutInQuadratic' } -> { easeOutInQuadratic:/1 },
			{ 'InCubic' } -> { easeInCubic:/1 },
			{ 'OutCubic' } -> { easeOutCubic:/1 },
			{ 'InOutCubic' } -> { easeInOutCubic:/1 },
			{ 'OutInCubic' } -> { easeOutInCubic:/1 },
			{ 'InQuartic' } -> { easeInQuartic:/1 },
			{ 'OutQuartic' } -> { easeOutQuartic:/1 },
			{ 'InOutQuartic' } -> { easeInOutQuartic:/1 },
			{ 'OutInQuartic' } -> { easeOutInQuartic:/1 },
			{ 'InQuintic' } -> { easeInQuintic:/1 },
			{ 'OutQuintic' } -> { easeOutQuintic:/1 },
			{ 'InOutQuintic' } -> { easeInOutQuintic:/1 },
			{ 'OutInQuintic' } -> { easeOutInQuintic:/1 },
			{ 'InSine' } -> { easeInSine:/1 },
			{ 'OutSine' } -> { easeOutSine:/1 },
			{ 'InOutSine' } -> { easeInOutSine:/1 },
			{ 'OutInSine' } -> { easeOutInSine:/1 },
			{ 'InExponential' } -> { easeInExponential:/1 },
			{ 'OutExponential' } -> { easeOutExponential:/1 },
			{ 'InOutExponential' } -> { easeInOutExponential:/1 },
			{ 'OutInExponential' } -> { easeOutInExponential:/1 },
			{ 'InCircular' } -> { easeInCircular:/1 },
			{ 'OutCircular' } -> { easeOutCircular:/1 },
			{ 'InOutCircular' } -> { easeInOutCircular:/1 },
			{ 'OutInCircular' } -> { easeOutInCircular:/1 },
			{ 'InBounce' } -> { easeInBounce(1.70158) },
			{ 'OutBounce' } -> { easeOutBounce(1.70158) },
			{ 'InOutBounce' } -> { easeInOutBounce(1.70158) },
			{ 'OutInBounce' } -> { easeOutInBounce(1.70158) },
			{ 'InBack' } -> {  easeInBack(1.70158) },
			{ 'OutBack' } -> { easeOutBack(1.70158) },
			{ 'InOutBack' } -> { easeInOutBack(1.70158) },
			{ 'OutInBack' } -> { easeOutInBack(1.70158) },
			{ 'InElastic' } -> { easeInElastic(1, 1) },
			{ 'OutElastic' } -> { easeOutElastic(1, 1) },
			{ 'InOutElastic' } -> { easeInOutElastic(1, 1) },
			{ 'OutInElastic' } -> { easeOutInElastic(1, 1) },
			{ 'InArcTan' } -> { easeInArcTan(15) },
			{ 'OutArcTan' } -> { easeOutArcTan(15) },
			{ 'InOutArcTan' } -> { easeInOutArcTan(15) }
		])
	}

}
