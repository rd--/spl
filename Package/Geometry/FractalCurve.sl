+String {

	simpleLindenmayerSystem { :stepLetters :plusMinus :rule :initialCondition :count |
		let angle = 0;
		let answer = [[0 0]];
		let keepLetters = stepLetters ++ '+-';
		let [plusAngle, minusAngle] = plusMinus;
		(rule ++ ['+' -> '+', '-' -> '-'])
		.asMap
		.substitutionSystem(initialCondition, count)
		.last
		.select { :each | keepLetters.includes(each) }
		.contents
		.do { :each |
			stepLetters.includes(each).if {
				answer.add(answer.last + angle.angleVector)
			} {
				angle := angle + (each = '+').if { plusAngle } { minusAngle }
			}
		};
		answer
	}

}

+@Integer {

	blancmangeCurve { :d |
		let k = 2 ^ d;
		let b = List(k + 1);
		b[0 + 1] := 0;
		b[k + 1] := 0;
		d.toByDo(1, -1) { :n |
			0.toByDo(k - 1, 2 ^ n) { :m |
				let i = m + (2 ^ (n - 1)) + 1;
				let j = m + 1;
				let k = m + (2 ^ n) + 1;
				b[i] := (2 ^ n) + (0.5 * (b[j] + b[k]))
			}
		};
		b
	}

	gosperCurve { :self |
		'AB'.simpleLindenmayerSystem(
			[1/3.pi -1/3.pi],
			[
				'A' -> 'A-B--B+A++AA+B-',
				'B' -> '+A-BB--B-A++A+B'
			],
			'A',
			self
		)
	}

	heighwayDragonCurve { :self |
		'F'.simpleLindenmayerSystem(
			[1/2.pi -1/2.pi],
			[
				'F' -> 'F',
				'X' -> 'X+YF+',
				'Y' -> '-FX-Y'
			],
			'FX',
			self
		)
	}

	hilbertCurve { :self |
		'F'.simpleLindenmayerSystem(
			[1/2.pi -1/2.pi],
			[
				'A' -> '+BF-AFA-FB+',
				'B' -> '-AF+BFB+FA-',
				'F' -> 'F'
			],
			'A',
			self
		)
	}

	kochCurve { :self |
		'F'.simpleLindenmayerSystem(
			[1/3.pi -1/3.pi],
			[
				'F' -> 'F+F--F+F'
			],
			'F',
			self
		)
	}

	levyCCurve { :self |
		'F'.simpleLindenmayerSystem(
			[1/4.pi -1/4.pi],
			[
				'F' -> '+F--F+'
			],
			'F',
			self
		)
	}

	mcWortersPentigree { :self |
		'F'.simpleLindenmayerSystem(
			[1/5.pi -1/5.pi],
			[
				'F' -> '+F++F----F--F++F++F-'
			],
			'F',
			self
		)
	}

	mooreCurve { :self |
		'F'.simpleLindenmayerSystem(
			[1/2.pi -1/2.pi],
			[
				'L' -> '-RF+LFL+FR-',
				'R' -> '+LF-RFR-FL+',
				'F' -> 'F'
			],
			'LFL+F+LFL',
			self
		)
	}

	peanoCurve { :self |
		'F'.simpleLindenmayerSystem(
			[1/2.pi -1/2.pi],
			[
				'X' -> 'XFYFX+F+YFXFY-F-XFYFX',
				'Y' -> 'YFXFY-F-XFYFX+F+YFXFY',
				'F' -> 'F'
			],
			'X',
			self
		)
	}

	pentadentriteCurve { :self |
		'F'.simpleLindenmayerSystem(
			[2/5.pi -2/5.pi],
			[
				'F' -> 'F+F-F--F+F+F'
			],
			'F',
			self
		)
	}

	sierpinskiCurve { :self |
		'FG'.simpleLindenmayerSystem(
			[1/4.pi -1/4.pi],
			[
				'X' -> 'XF+G+XF--F--XF+G+X',
				'F' -> 'F',
				'G' -> 'G'
			],
			'F--XF--F--XF',
			self
		)
	}

	zOrderCurve { :self |
		(0 .. self - 1).collect { :n |
			let b = n.integerDigits(2);
			let k = b.size;
			let [y, x] = b.padLeft([k + (k % 2)], 0).deinterleave(2);
			[x, y].collect { :each |
				each.fromDigits(2)
			}
		}
	}

}

+SmallFloat {

	riemannFunction { :x :a :n |
		(1 .. n).sum { :i |
			let j = i ^ a;
			sin(j * x) / j
		}
	}

	riemannFunction { :x |
		x.riemannFunction(2, 100)
	}

	takagiFunction { :x :n |
		let s = { :x |
			let d = x - floor(x);
			min(d, 1 - d)
		};
		(0 .. n - 1).sum { :i |
			s(x * (2 ^ i)) / (2 ^ i)
		}
	}

	takagiFunction { :x |
		takagiFunction(x, 100)
	}

	weierstrassFunction { :x :a :b :n |
		(0 .. n).collect { :i |
			(a ^ i) * ((b ^ i) * x.pi).cos
		}.sum
	}

}

+Complex {

	riemannFunction { :x :a :n |
		(1 .. n).sum { :i |
			(0J1.pi * (i ^ a) * x).exp / (i ^ a).pi
		}
	}

	riemannFunction { :x |
		x.riemannFunction(2, 100)
	}

}

+List {

	takagiFunction { :self |
		self.collect(takagiFunction:/1)
	}

}
