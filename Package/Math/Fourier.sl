+List {

	basicComplexFft { :self |
		<primitive: return sc.fft(_self);>
	}

	basicInverseFft { :self |
		<primitive: return sc.inverseFft(_self);>
	}

	basicRealFft { :self |
		<primitive: return sc.realFft(_self);>
	}

	convolve { :u :v |
		(u.isEmpty | { v.isEmpty }).if {
			'convolve: invalid vector'.error
		} {
			let m = u.size;
			let n = v.size;
			let answer = List(m + n - 1, 0);
			1.toDo(m + n - 1) { :i |
				1.toDo(m) { :j |
					let k = i - j + 1;
					(k >= 1 & { k <= n }).ifTrue {
						answer[i] := answer[i] + (v[k] * u[j])
					}
				}
			};
			answer
		}
	}

	deinterleaveComplexData { :self |
		1.toBy(self.size - 1, 2).collect { :each |
			Complex(self[each], self[each + 1])
		}
	}

	dft { :self |
		let x = self;
		let m = x.size;
		let p = -2.pi * 1.i / m;
		0.to(m - 1).collect { :k |
			let q = p * k;
			let z = 0;
			0.toDo(m - 1) { :n |
				z := z + (x[n + 1] * (q * n).exp)
			};
			z
		}
	}

	fft { :self |
		self.size.isPowerOfTwo.if {
			(self.elementType = 'SmallFloat').if {
				self.basicRealFft.deinterleaveComplexData
			} {
				(self.elementType = 'Complex').if {
					self.interleaveComplexData.basicComplexFft.deinterleaveComplexData
				} {
					self.error('fft: not SmallFloat or Complex elements')
				}
			}
		} {
			self.error('fft: size not power of two')
		}
	}

	fft { :x :n |
		x.padRight([n], 0).fft
	}

	fftConvolve { :u :v |
		let n = u.size + v.size - 1;
		let m = n.nextPowerOfTwo;
		let a = u.padRight([m], 0);
		let b = v.padRight([m], 0);
		ifft(a.fft * b.fft).first(n).real
	}

	fftShift { :self |
		let n = self.size;
		let m = n // 2;
		n.isOdd.ifTrue {
			m := m + 1
		};
		self.copyFromTo(m + 1, n) ++ self.copyFromTo(1, m)
	}

	fourier { :self |
		self.size.fourierMatrix.dot(self)
	}

	ifft { :self |
		self.size.isPowerOfTwo.if {
			(self.elementType = 'Complex').if {
				self.interleaveComplexData.basicInverseFft.deinterleaveComplexData
			} {
				self.error('ifft: not Complex elements')
			}
		} {
			self.error('fft: size not power of two')
		}
	}

	interleaveComplexData { :self |
		let answer = [];
		self.collect { :each |
			answer.add(each.real);
			answer.add(each.imaginary)
		};
		answer
	}

	inverseFourier { :self |
		let n = self.size;
		let m = n.fourierMatrix([0 -1]);
		m.dot(self)
	}

	periodogramArray { :self |
		self.fft.absSquare / self.size
	}

	periodogramArray { :self :n |
		self.partition(n).collect { :each |
			each.fft.absSquare / n
		}.average
	}

	periodogramArray { :self :n :d |
		self.partition(n, d).collect { :each |
			each.fft.absSquare / n
		}.average
	}

	periodogramArray { :self :n :d :w |
		let wN = w.normalize;
		self.partition(n, d).collect { :each |
			(each * wN).fft.absSquare
		}.average
	}

}

+SmallFloat {

	dirichletKernel { :n |
		{ :x |
			((n + 0.5) * x).sin / (x * 0.5).sin
		}
	}

	fejerKernel { :n |
		{ :x |
			x.isVeryCloseTo(0).if {
				n
			} {
				((1 - (n * x).cos) / (1 - x.cos)) / n
			}
		}
	}

	fejerKernelDirichlet { :n |
		let d = 0.to(n - 1).collect(dirichletKernel:/1);
		{ :x |
			d.collect { :each:/1 |
				each(x)
			}.sum
		}
	}

	fftFrequencies { :n :d |
		n.isEven.if {
			let m = n // 2;
			([0 .. m - 1] ++ [0 - m .. -1]) / (d * n)
		} {
			let m = (n - 1) // 2;
			([0 .. m] ++ [0 - m .. -1]) / (d * n)
		}
	}

	fourierMatrix { :n |
		let m = 1 / n.sqrt;
		let omega = 1.e ^ (2.pi * 0J1 / n);
		let l = 0.to(n - 1);
		{ :i :j |
			m * (omega ^ (i * j))
		}.table(l, l)
	}

	fourierMatrix { :n :p |
		let [a, b] = p;
		let m = 1 / (n ^ ((1 - a) / 2));
		let v = [0 .. n - 1] * (2.pi.i * b) / n;
		v.exp.vandermondeMatrix * m
	}

	lanczosKernel { :a |
		{ :x |
			x.betweenAnd(a.-, a).if {
				x.sincNormalized * (x / a).sincNormalized
			} {
				0
			}
		}
	}

	lanczosKernelSin { :a |
		{ :x |
			(x = 0).if {
				1
			} {
				x.betweenAnd(a.-, a).if {
					(a * x.pi.sin * (x.pi / a).sin) / (1.pi.square * x.square)
				} {
					0
				}
			}
		}
	}

}
