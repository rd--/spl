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
		.select { :each |
			keepLetters.includes(each)
		}.contents
		.do { :each |
			stepLetters.includes(each).if {
				answer.add(answer.last + angle.angleVector)
			} {
				let delta = (each = '+').if {
					plusAngle
				} {
					minusAngle
				};
				angle := angle + delta
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

	cantorDust { :self |
		[
			0 -> [0 0 0; 0 0 0; 0 0 0],
			1 -> [1 0 1; 0 0 0; 1 0 1]
		]
		.substitutionSystem([[1]], self)
		.last
	}

	fibonacciCurve { :self |
		let p = [0 0];
		let answer = [p];
		let theta = 1/2.pi;
		1:self.do { :n |
			let m = n.fibonacciWord;
			p := p + theta.angleVector;
			answer.add(p);
			(m = 0).ifTrue {
				let delta = n.isEven.if { -1/2.pi } { 1/2.pi };
				theta := theta + delta
			}
		};
		answer
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

	hafermanCarpet { :self |
		[
			0 -> [1 1 1; 1 1 1; 1 1 1],
			1 -> [1 0 1; 0 1 0; 1 0 1]
		]
		.substitutionSystem([[1]], self)
		.last
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

	sierpinskiArrowheadCurve { :self |
		'F'.simpleLindenmayerSystem(
			[1/3.pi -1/3.pi],
			[
				'X' -> 'YF+XF+Y',
				'Y' -> 'XF-YF-X',
				'F' -> 'F'
			],
			'YF',
			self
		)
	}

	sierpinskiCarpet { :self |
		[
			1 -> [1 1 1; 1 0 1; 1 1 1],
			0 -> [0 0 0; 0 0 0; 0 0 0]
		]
		.substitutionSystem([[1]], self)
		.last
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

	sierpinskiSieve { :self |
		'F'.simpleLindenmayerSystem(
			[-1/3.pi 1/3.pi],
			[
				'X' -> '--FXF++FXF++FXF--',
				'F' -> 'FF'
			],
			'FXF--FF--FF',
			self
		)
	}

	vicsekCurve { :self |
		'F'.simpleLindenmayerSystem(
			[1/2.pi -1/2.pi],
			[
				'F' -> 'F-F+F+F-F'
			],
			'F-F-F-F',
			self
		)
	}

	zOrderCurve { :self |
		0.to(self - 1).collect { :n |
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
		1.to(n).sum { :i |
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
		0.to(n - 1).sum { :i |
			s(x * (2 ^ i)) / (2 ^ i)
		}
	}

	takagiFunction { :x |
		takagiFunction(x, 100)
	}

	weierstrassFunction { :x :a :b :n |
		0.to(n).collect { :i |
			(a ^ i) * ((b ^ i) * x.pi).cos
		}.sum
	}

}

+Complex {

	riemannFunction { :x :a :n |
		1.to(n).sum { :i |
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
