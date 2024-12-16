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

	interleaveComplexData { :self |
		let answer = [];
		self.collect { :each |
			answer.add(each.real);
			answer.add(each.imaginary)
		};
		answer
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

}
