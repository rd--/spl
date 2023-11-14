+@Integer {

	SparseMatrixMixer { :numOutputs :inputArray :sparseMatrix |
		| answer = Dc(0) !! numOutputs; |
		sparseMatrix.do { :each |
			| [inputIndex, outputIndex, gain] = each; |
			answer[outputIndex] +:= inputArray[inputIndex] * gain
		};
		answer
	}

}

+@Cache {

	mixRuleSparseMatrixTable { :self |
		self.cache.atIfAbsentPut('mixRuleSparseMatrixTable') {
			(
				'2×2→1×4': [1 2 3 4; 1 2 3 4; 1 1 1 1].transposed,
				'2×2→1×4𝕫': [1 2 3 4; 1 2 4 3; 1 1 1 1].transposed,
				'4×2→1×4': [1 2 3 4 5 6 7 8; 1 2 2 3 3 4 4 1; 1 1 1 1 1 1 1 1].transposed,
				'4×2→1×4𝕫': [1 2 3 4 5 6 7 8; 1 2 2 4 4 3 3 1; 1 1 1 1 1 1 1 1].transposed,
				'4×2→1×8': [1 2 3 4 5 6 7 8; 1 2 3 4 5 6 7 8; 1 1 1 1 1 1 1 1].transposed,
				'8×2→1×8': [
					1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16;
					1 2 2 3 3 4 4 5 5 6 6 7 7 8 8 1;
					1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
				].transposed,
				'8×2→2×4': [
					1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16;
					1 2 2 3 3 4 4 1 5 6 6 7 7 8 8 5;
					1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
				].transposed,
				'8×2→2×4𝕫': [
					1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16;
					1 2 2 4 4 3 3 1 5 6 6 8 8 7 7 5;
					1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
				].transposed,
				'16×2→2×8': [
					1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
					17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32;
					1 2 2 3 3 4 4 5 5 6 6 7 7 8 8 1
					9 10 10 11 11 12 12 13 13 14 14 15 15 16 16 1;
					1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
					1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
				].transposed,
				'16×2→4×4': [
					1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
					17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32;
					1 2 2 3 3 4 4 1 5 6 6 7 7 8 8 5
					9 10 10 11 11 12 12 9 13 14 14 15 15 16 16 13;
					1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
					1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
				].transposed,
				'16×2→4×4𝕫': [
					1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
					17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32;
					1 2 2 4 4 3 3 1 5 6 6 8 8 7 7 5
					9 10 10 12 12 11 11 9 13 14 14 16 16 15 15 13;
					1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
					1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
				].transposed,
				'2×2→UoS': [
					1 1 1; 2 2 1; 3 12 1; 4 14 1;
					1 3 2; 2 4 2; 3 5 2; 4 6 2 (* sub *)
				],
				'3×2→UoS': [
					1 16 1; 2 10 1; 3 15 1; 4 11 1; 5 14 1; 6 12 1;
					1 3 2; 2 4 2; 3 5 2; 4 6 2; 5 3 2; 6 4 2 (* sub *)
				],
				'4×2→UoS': [
					1 9 1; 2 10 1; 3 11 1; 4 12 1; 5 13 1; 6 14 1; 7 15 1; 8 16 1;
					1 3 2; 2 4 2; 3 5 2; 4 6 2; 5 3 2; 6 4 2; 7 5 2; 8 6 2 (* sub *)
				],
				'5×2→UoS': [
					1 1 1; 2 1 1; 3 9 1; 4 10 1; 5 11 1; 6 12 1; 7 13 1; 8 14 1; 9 15 1; 10 16 1;
					1 3 2; 2 4 2; 3 5 2; 4 6 2; 5 3 2; 6 4 2; 7 5 2; 8 6 2; 9 3 2; 10 4 2 (* sub *)
				],
				'6×2→UoS': [
					1 9 1; 2 10 1; 3 11 1; 4 12 1; 5 13 1; 6 14 1; 7 15 1; 8 16 1;
					9 17 1; 10 18 1; 11 19 1; 12 20 1;
					(* sub *)
					1 3 2; 2 4 2; 3 5 2; 4 6 2; 5 3 2; 6 4 2; 7 5 2; 8 6 2;
					9 3 2; 10 4 2; 11 5 2; 12 6 2
				],
				'8×2→UoS': [
					1 9 1; 2 10 1; 3 11 1; 4 12 1; 5 13 1; 6 14 1; 7 15 1; 8 16 1;
					9 17 1; 10 18 1; 11 19 1; 12 20 1; 13 21 1; 14 22 1; 15 23 1; 16 24 1;
					(* sub *)
					1 3 2; 2 4 2; 3 5 2; 4 6 2; 5 3 2; 6 4 2; 7 5 2; 8 6 2;
					9 3 2; 10 4 2; 11 5 2; 12 6 2; 13 3 2; 14 4 2; 15 5 2; 16 6 2
				],
				'9×2→UoS': [
					1 9 1; 2 10 1; 3 11 1; 4 12 1; 5 13 1; 6 14 1; 7 15 1; 8 16 1;
					9 17 1; 10 18 1; 11 19 1; 12 20 1; 13 21 1; 14 22 1; 15 23 1; 16 24 1;
					17 1 1; 18 2 1;
					(* sub *)
					1 3 2; 2 4 2; 3 5 2; 4 6 2; 5 3 2; 6 4 2; 7 5 2; 8 6 2;
					9 3 2; 10 4 2; 11 5 2; 12 6 2; 13 3 2; 14 4 2; 15 5 2; 16 6 2;
					17 3 2; 18 4 2
				]
			)
		}
	}

	mixByNamedRuleTable { :self |
		self.cache.atIfAbsentPut('mixByNamedRuleTable') {
			(
				'16×1→UoS': { :input |
					[
						Silent(2),
						input.clump(4).collect(sum:/1),
						Silent(2),
						input
					].concatenation
				},
				'16×2→UoS': { :input |
					[
						Silent(2),
						(input * 2).mixByNamedRule('16×2→4×4𝕫').sum,
						Silent(2),
						input.first(8).mixByNamedRule('8×2→1×8'),
						input.last(8).mixByNamedRule('8×2→2×4𝕫').concatenation
					].concatenation
				},
				'24×1→1×2': { :input |
					input.Splay2
				},
				'24×1→UoS': { :input |
					input
				}
			)
		}
	}

}

+Array {

	Mix { :self :name |
		self.mixByDerivedNamedRule(name)
	}

	Mix { :self |
		self.mixByDerivedNamedRule('UoS')
	}

	mixByDerivedNamedRule { :self :name |
		|(
			shape = self.shape,
			derivedName = [
				shape.first.asString,
				'×',
				(shape.size = 1).if {
					'1'
				} {
					shape.second.asString
				},
				'→',
				name
			].join
		)|
		self.mixByNamedRule(derivedName)
	}

	mixByNamedRule { :self :name |
		system.mixRuleSparseMatrixTable.atIfPresentIfAbsent(name) { :item |
			| channelCount = item.collect(second:/1).max; |
			SparseMatrixMixer(channelCount, self.concatenation, item)
		} {
			system.mixByNamedRuleTable.atIfPresentIfAbsent(name) { :item |
				item.value(self)
			} {
				self.sum
			}
		}
	}

}
