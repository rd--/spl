+List {

	isSiteswap { :t |
		t.allSatisfy(isNonNegativeInteger:/1) & {
			let n = t.size;
			1.to(n).collect { :i |
				(i + t[i]) % n
			}.isDuplicateFree
		}
	}

	siteswapState { :t |
		let n = t.size;
		1.to(t.max).collect { :i |
			1.to(n).anySatisfy { :j |
				let k = (j + t[j] - i);
				(k > 0) & { k.divisible(n) }
			}.boole
		}.withoutTrailingZeroes
	}

	siteswapStateAllowedTransitions { :sigma |
		let n = sigma.size;
		(sigma[1] = 0).if {
			[0]
		} {
			1.to(n).select { :j |
				(j = n) | {
					sigma[j + 1] = 0
				}
			}
		}
	}

	siteswapStateTransition { :sigma :j |
		let n = sigma.size;
		let m = n.max(j);
		let r = List(m, 0);
		(j = 0).if {
			1.to(n - 1).collect { :k |
				r[k] := sigma[k + 1]
			}
		} {
			r[j] := 1;
			1.to(n - 1).collect { :k |
				(k != j).ifTrue {
					r[k] := sigma[k + 1]
				}
			}
		};
		r
	}

}

+SmallFloat {

	siteswapStateAllowedTransitions { :sigma :h |
		sigma.integerDigits(2, h).reverse.siteswapStateAllowedTransitions
	}

	siteswapStateTransition { :sigma :j |
		(j = 0).if {
			sigma >> 1
		} {
			sigma.bitXor(1 << j) - 1 / 2
		}
	}

}
