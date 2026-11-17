+Float {

	easeBounceFunction { :t :c :a |
		(t = 1.0).if {
			c
		} {
			(t < (4.0 / 11.0)).if {
				c * 7.5625 * t * t
			} {
				(t < (8.0 / 11.0)).if {
					t := t - (6.0 / 11.0);
					(0.0 - a) * (1 - (7.5625 * t * t + 0.75)) + c
				} {
					(t < (10.0 / 11.0)).if {
						t := t - (9.0 / 11.0);
						(0.0 - a) * (1 - (7.5625 * t * t + 0.9375)) + c
					} {
						t := t - (21 / 22);
						(0.0 - a) * (1 - (7.5625 * t * t + 0.984375)) + c
					}
				}
			}
		}
	}

	easeInArcTan { :a |
		{ :t |
			arcTan((t - 1.0) * a) / arcTan(a) + 1.0
		}
	}

	easeInBack { :a |
		{ :t |
			t * t * ((a + 1.0) * t - a)
		}
	}

	easeInBounce { :a |
		{ :t |
			1.0 - easeBounceFunction(1.0 - t, 1.0, a)
		}
	}

	easeInCircular { :t |
		0.0 - (sqrt(1.0 - (t * t)) - 1.0)
	}

	easeInCubic { :t |
		t * t * t
	}

	easeInElastic { :t :b :c :d :a :p |
		(t = 0.0).if {
			b
		} {
			let tAdj = t / d;
			(tAdj = 1.0).if {
				b + c
			} {
				let s = (a < abs(c)).if {
					a := c;
					p / 4.0
				} {
					p / 2.0.pi * arcSin(c / a)
				};
				tAdj := tAdj - 1.0;
				0.0 - (a * (2.0 ^ (10.0 * tAdj)) * sin((tAdj * d - s) * 2.0.pi / p)) + b
			}
		}
	}

	easeInElastic { :a :p |
		{ :t |
			easeInElastic(t, 0.0, 1.0, 1.0, a, p)
		}
	}

	easeInExponential { :t |
		2.0 ^ (10.0 * (t - 1.0))
	}

	easeInOutArcTan { :a |
		{ :t |
			arcTan((t - 0.5) * a) / (2.0 * arcTan(0.5 * a)) + 0.5
		}
	}

	easeInOutBack { :a |
		{ :t |
			let a2 = a * 1.525;
			t := t * 2.0;
			(t < 1.0).if {
				0.5 * (t * t * ((a2 + 1.0) * t - a2))
			} {
				let t2 = t - 2.0;
				0.5 * (t2 * t2 * ((a2 + 1.0) * t2 + a2) + 2.0)
			}
		}
	}

	easeInOutBounce { :a |
		let in/1 = a.easeInBounce;
		let out/1 = a.easeOutBounce;
		{ :t |
			(t < 0.5).if {
				in(2.0 * t) / 2.0
			} {
				(t = 1.0).if {
					1.0
				} {
					out(2.0 * t - 1.0) / 2.0 + 0.5
				}
			}
		}
	}

	easeInOutCircular { :t |
		t := t * 2.0;
		(t < 1.0).if {
			-0.5 * (sqrt(1.0 - (t * t)) - 1.0)
		} {
			let z = t - 2.0;
			0.5 * (sqrt(1.0 - (z * z)) + 1.0)
		}
	}

	easeInOutCubic { :t |
		t := t * 2.0;
		(t < 1.0).if {
			0.5 * t * t * t
		} {
			t := t - 2.0;
			0.5 * (t * t * t + 2.0)
		}
	}

	easeInOutElastic { :a :p |
		{ :t |
			(t = 0.0).if {
				0.0
			} {
				t := t * 2.0;
				(t = 2.0).if {
					1.0
				} {
					let s = (a < 1.0).if {
						a := 1.0;
						p / 4.0
					} {
						p / 2.0.pi * arcSin(1.0 / a)
					};
					(t < 1.0).if {
						-0.5 * (a * (2.0 ^ (10.0 * (t - 1.0))) * sin((t - 1.0 - s) * 2.0.pi / p))
					} {
						a * (2.0 ^ (-10.0 * (t - 1.0))) * sin((t - 1.0 - s) * 2.0.pi / p) * 0.5 + 1.0
					}
				}
			}
		}
	}

	easeInOutExponential { :t |
		(t = 0.0).if {
			0.0
		} {
			(t = 1.0).if {
				1.0
			} {
				t := t * 2.0;
				(t < 1.0).if {
					0.5 * (2.0 ^ (10.0 * (t - 1.0)))
				} {
					0.5 * (0.0 - (2.0 ^ (-10.0 * (t - 1.0))) + 2.0)
				}
			}
		}
	}

	easeInOutQuadratic { :t |
		t := t * 2.0;
		(t < 1.0).if {
			0.5 * t * t
		} {
			-0.5 * (t - 1.0 * (t - 3.0) - 1.0)
		}
	}

	easeInOutQuartic { :t |
		t := t * 2.0;
		(t < 1.0).if {
			0.5 * t * t * t * t
		} {
			let z = t - 2.0;
			-0.5 * (z * z * z * z - 2.0)
		}
	}

	easeInOutQuintic { :t |
		t := t * 2.0;
		(t < 1.0).if {
			0.5 * t * t * t * t * t
		} {
			let z = t - 2.0;
			0.5 * (z * z * z * z * z + 2.0)
		}
	}

	easeInOutSine { :t |
		-0.5 * (cos(t.pi) - 1.0)
	}

	easeInQuadratic { :t |
		t * t
	}

	easeInQuartic { :t |
		t * t * t * t
	}

	easeInQuintic { :t |
		t * t * t * t * t
	}

	easeInSine { :t |
		0.0 - cos(t.pi / 2.0) + 1.0
	}

	easeNone { :t |
		t
	}

	easeOutArcTan { :a |
		{ :t |
			arcTan(t * a) / arcTan(a)
		}
	}

	easeOutBack { :a |
		{ :t |
			t := t - 1.0;
			t * t * ((a + 1.0) * t + a) + 1.0
		}
	}

	easeOutBounce { :a |
		{ :t |
			easeBounceFunction(t, 1.0, a)
		}
	}

	easeOutCircular { :t |
		t := t - 1.0;
		sqrt(1 - (t * t))
	}

	easeOutCubic { :t |
		t := t - 1.0;
		(t * t * t) + 1.0
	}

	easeOutElastic { :t :b :c :d :a :p |
		(t = 0).if {
			0
		} {
			(t = 1.0).if {
				c
			} {
				let s = (a < c).if {
					a := c;
					p / 4
				} {
					p / 2.pi * arcSin(c / a)
				};
				a * (2.0 ^ (-10 * t)) * sin((t - s) * 2.pi / p) + c
			}
		}
	}

	easeOutElastic { :a :p |
		{ :t |
			easeOutElastic(t, 0.0, 1.0, 1.0, a, p)
		}
	}

	easeOutExponential { :t |
		(t = 1.0).if {
			1
		} {
			0.0 - (2.0 ^ (-10 * t)) + 1.0
		}
	}

	easeOutInBack { :a |
		let in/1 = a.easeInBack;
		let out/1 = a.easeOutBack;
		{ :t |
			(t < 0.5).if {
				out(2.0 * t) / 2.0
			} {
				in(2.0 * t - 1.0) / 2.0 + 0.5
			}
		}
	}

	easeOutInBounce { :a |
		{ :t |
			(t < 0.5).if {
				easeBounceFunction(t * 2.0, 0.5, a)
			} {
				1 - easeBounceFunction(2.0 - (2.0 * t), 0.5, a)
			}
		}
	}

	easeOutInCircular { :t |
		(t < 0.5).if {
			easeOutCircular(2.0 * t) / 2.0
		} {
			easeInCircular(2.0 * t - 1.0) / 2.0 + 0.5
		}
	}

	easeOutInCubic { :t |
		(t < 0.5).if {
			easeOutCubic(2.0 * t) / 2.0
		} {
			easeInCubic(2.0 * t - 1.0) / 2.0 + 0.5
		}
	}

	easeOutInElastic { :a :p |
		{ :t |
			(t < 0.5).if {
				easeOutElastic(t * 2.0, 0.0, 0.5, 1.0, a, p)
			} {
				easeInElastic(2.0 * t - 1.0, 0.5, 0.5, 1.0, a, p)
			}
		}
	}

	easeOutInExponential { :t |
		(t < 0.5).if {
			easeOutExponential(2.0 * t) / 2.0
		} {
			easeInExponential(2.0 * t - 1.0) / 2.0 + 0.5
		}
	}

	easeOutInQuadratic { :t |
		(t < 0.5).if {
			easeOutQuadratic(t * 2.0) * 0.5
		} {
			easeInQuadratic(2.0 * t - 1.0) * 0.5 + 0.5
		}
	}

	easeOutInQuartic { :t |
		(t < 0.5).if {
			easeOutQuartic(2.0 * t) / 2.0
		} {
			easeInQuartic(2.0 * t - 1.0) / 2.0 + 0.5
		}
	}

	easeOutInQuintic { :t |
		(t < 0.5).if {
			easeOutQuintic(2.0 * t) / 2.0
		} {
			easeInQuintic(2.0 * t - 1.0) / 2.0 + 0.5
		}
	}

	easeOutInSine { :t |
		(t < 0.5).if {
			easeOutSine(2.0 * t) / 2.0
		} {
			easeInSine(2.0 * t - 1.0) / 2.0 + 0.5
		}
	}

	easeOutQuadratic { :t |
		(0.0 - t) * (t - 2.0)
	}

	easeOutQuartic { :t |
		t := t - 1.0;
		0.0 - (t * t * t * t - 1.0)
	}

	easeOutQuintic { :t |
		t := t - 1.0;
		t * t * t * t * t + 1.0
	}

	easeOutSine { :t |
		sin(t.pi / 2.0)
	}

}

+String {

	easingFunction { :self |
		self.caseOf([
			'InQuadratic' -> { easeInQuadratic/1 },
			'OutQuadratic' -> { easeOutQuadratic/1 },
			'InOutQuadratic' -> { easeInOutQuadratic/1 },
			'OutInQuadratic' -> { easeOutInQuadratic/1 },
			'InCubic' -> { easeInCubic/1 },
			'OutCubic' -> { easeOutCubic/1 },
			'InOutCubic' -> { easeInOutCubic/1 },
			'OutInCubic' -> { easeOutInCubic/1 },
			'InQuartic' -> { easeInQuartic/1 },
			'OutQuartic' -> { easeOutQuartic/1 },
			'InOutQuartic' -> { easeInOutQuartic/1 },
			'OutInQuartic' -> { easeOutInQuartic/1 },
			'InQuintic' -> { easeInQuintic/1 },
			'OutQuintic' -> { easeOutQuintic/1 },
			'InOutQuintic' -> { easeInOutQuintic/1 },
			'OutInQuintic' -> { easeOutInQuintic/1 },
			'InSine' -> { easeInSine/1 },
			'OutSine' -> { easeOutSine/1 },
			'InOutSine' -> { easeInOutSine/1 },
			'OutInSine' -> { easeOutInSine/1 },
			'InExponential' -> { easeInExponential/1 },
			'OutExponential' -> { easeOutExponential/1 },
			'InOutExponential' -> { easeInOutExponential/1 },
			'OutInExponential' -> { easeOutInExponential/1 },
			'InCircular' -> { easeInCircular/1 },
			'OutCircular' -> { easeOutCircular/1 },
			'InOutCircular' -> { easeInOutCircular/1 },
			'OutInCircular' -> { easeOutInCircular/1 },
			'InBounce' -> { easeInBounce(1.70158) },
			'OutBounce' -> { easeOutBounce(1.70158) },
			'InOutBounce' -> { easeInOutBounce(1.70158) },
			'OutInBounce' -> { easeOutInBounce(1.70158) },
			'InBack' -> {  easeInBack(1.70158) },
			'OutBack' -> { easeOutBack(1.70158) },
			'InOutBack' -> { easeInOutBack(1.70158) },
			'OutInBack' -> { easeOutInBack(1.70158) },
			'InElastic' -> { easeInElastic(1.0, 1.0) },
			'OutElastic' -> { easeOutElastic(1.0, 1.0) },
			'InOutElastic' -> { easeInOutElastic(1.0, 1.0) },
			'OutInElastic' -> { easeOutInElastic(1.0, 1.0) },
			'InArcTan' -> { easeInArcTan(15.0) },
			'OutArcTan' -> { easeOutArcTan(15.0) },
			'InOutArcTan' -> { easeInOutArcTan(15.0) }
		])
	}

}
