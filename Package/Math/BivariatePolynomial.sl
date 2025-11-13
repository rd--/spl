BivariatePolynomial : [Object, Storeable, Copyable, Equatable] { | coefficientMatrix |

	asBlock { :self |
		let m = self.coefficientMatrix;
		{ :x :y |
			m.evaluateBivariatePolynomial(x, y)
		}
	}

	degree { :self |
		self.coefficientMatrix.shape - 1
	}

	equalBy { :self :operand :aBlock:/2 |
		operand.isBivariatePolynomial & {
			aBlock(self.coefficientMatrix, operand.coefficientMatrix)
		}
	}

	evaluate { :self :x :y |
		self.coefficientMatrix.evaluateBivariatePolynomial(x, y)
	}

	isZero { :self |
		self.coefficientMatrix.isEmpty
	}

	postCopy { :self |
		self.coefficientMatrix := self.coefficientMatrix.deepCopy
	}

}

+List {

	evaluateBivariatePolynomial { :coefficientMatrix :x :y |
		coefficientMatrix.ifEmpty {
			0
		} {
			let [m, n] = coefficientMatrix.shape;
			let answer = nil;
			1.toDo(m) { :i |
				let r = coefficientMatrix[i];
				1.toDo(n) { :j |
					let a = r[j];
					a.isZero.ifFalse {
						let p = i - 1;
						let q = j - 1;
						let r = [
							{ p = 0 & { q = 0 } } -> { a },
							{ p = 0 } -> { a * (y ^ q) },
							{ q = 0 } -> { a * (x ^ p) },
							{ true } -> { a * (x ^ p) * (y ^ q) }
						].which;
						answer := answer.ifNil { r } { answer + r }
					}
				}
			};
			answer
		}
	}

	BivariatePolynomial { :self |
		newBivariatePolynomial().initializeSlots(self)
	}

}
