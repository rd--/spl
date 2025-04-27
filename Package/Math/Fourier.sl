+List {

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
			let n1 = u.size;
			let n2 = v.size;
			let answer = List(n1 + n2 - 1, 0);
			1.toDo(n1 + n2 - 1) { :i |
				1.toDo(n1) { :j |
					let k = i - j + 1;
					(k >= 1 & { k <= n2 }).ifTrue {
						answer[i] := answer[i] + (v[k] * u[j])
					}
				}
			};
			answer
		}
	}

	deinterleaveComplexData { :self |
		(1, 3 ..  self.size - 1).collect { :each |
			Complex(self[each], self[each + 1])
		}
	}

	dft { :self |
		let x = self;
		let m = x.size;
		let p = -2.pi * 1.i / m;
		(0 .. m - 1).collect { :k |
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
				self.error('fft: not SmallFloat elements')
			}
		} {
			self.error('fft: size not power of two')
		}
	}

	fftConvolve { :u :v |
		let n = u.size + v.size - 1;
		let m = n.nextPowerOfTwo;
		let a = u.padRight([m], 0);
		let b = v.padRight([m], 0);
		ifft(a.fft * b.fft).first(n).real
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
		let d = (0 .. n - 1).collect(dirichletKernel:/1);
		{ :x |
			d.collect { :each:/1 |
				each(x)
			}.sum
		}
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
					(a * x.pi.sin * (x.pi / a).sin) / (1.pi.squared * x.squared)
				} {
					0
				}
			}
		}
	}

}
