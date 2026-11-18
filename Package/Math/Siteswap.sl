+List {

	isSiteswap { :t |
		t.allSatisfy(isNonNegativeInteger/1) & {
			let n = t.size;
			1L.to(n).collect { :i |
				(i + t[i]) % n
			}.isDuplicateFree
		}
	}

	siteswapState { :t |
		let n = t.size;
		1L.to(t.max).collect { :i |
			1L.to(n).anySatisfy { :j |
				let k = (j + t[j] - i);
				(k > 0L) & {
					k.divisible(n)
				}
			}.boole
		}.withoutTrailing(isZero/1)
	}

	siteswapStateAllowedTransitions { :sigma |
		let n = sigma.size;
		(sigma[1L] = 0L).if {
			[0L]
		} {
			1L.to(n).select { :j |
				(j = n) | {
					sigma[j + 1L] = 0L
				}
			}
		}
	}

	siteswapStateTransition { :sigma :j |
		let n = sigma.size;
		let m = n.max(j);
		let r = List(m, 0L);
		(j = 0L).if {
			1L.to(n - 1L).collect { :k |
				r[k] := sigma[k + 1L]
			}
		} {
			r[j] := 1L;
			1L.to(n - 1L).collect { :k |
				(k != j).ifTrue {
					r[k] := sigma[k + 1L]
				}
			}
		};
		r
	}

}

+[Float, Integer] {

	siteswapStateAllowedTransitions { :sigma :h |
		sigma.integerDigits(2L, h)
		.reverse
		.siteswapStateAllowedTransitions
	}

	siteswapStateTransition { :sigma :j |
		(j = 0L).if {
			sigma >> 1L
		} {
			sigma.bitXor(1L << j) - 1L / 2L
		}
	}

}
