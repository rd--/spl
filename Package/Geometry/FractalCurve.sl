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
