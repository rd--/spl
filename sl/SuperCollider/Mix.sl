+@Integer {

	SparseMatrixMixer { :numOutputs :inputArray :sparseMatrix |
		| answer = Dc(0) ! numOutputs; |
		sparseMatrix.do { :each |
			| [inputIndex, outputIndex, gain] = each; |
			answer[outputIndex] +:= inputArray[inputIndex] * gain
		};
		answer
	}

}

+@Integer {

	uosSub { :self |
		(1 .. self).collect { :each |
			[each, [3 4 6 5].atWrap(each), 1.5]
		}
	}

}

+@Cache {

	mixRuleSparseMatrixTable { :self |
		self.cache.atIfAbsentPut('mixRuleSparseMatrixTable') {
			(
				'2×2→1×4': [
					[1 .. 4],
					[1 .. 4],
					1 ! 4
				].transposed,
				'2×2→1×4𝕫': [
					[1 .. 4],
					[1 2 4 3],
					1 ! 4
				].transposed,
				'4×2→1×4': [
					[1 .. 8],
					[1 2 2 3 3 4 4 1],
					1 ! 8
				].transposed,
				'4×2→1×4𝕫': [
					[1 .. 8],
					[1 2 2 4 4 3 3 1],
					1 ! 8
				].transposed,
				'4×2→1×8': [
					[1 .. 8],
					[1 .. 8],
					1 ! 8
				].transposed,
				'8×2→1×8': [
					[1 .. 16],
					[1 2 2 3 3 4 4 5 5 6 6 7 7 8 8 1],
					1 ! 16
				].transposed,
				'8×2→2×4': [
					[1 .. 16],
					[0 4] +.x [1 2 2 3 3 4 4 1],
					1 ! 16
				].transposed,
				'8×2→2×4𝕫': [
					[1 .. 16],
					[0 4] +.x [1 2 2 4 4 3 3 1],
					1 ! 16
				].transposed,
				'16×2→2×8': [
					[1 .. 32],
					[0 8] +.x [1 2 2 3 3 4 4 5 5 6 6 7 7 8 8 1],
					1 ! 32
				].transposed,
				'16×2→4×4': [
					[1 .. 32],
					[0 4 8 12] +.x [1 2 2 3 3 4 4 1],
					1 ! 32
				].transposed,
				'16×2→4×4𝕫': [
					[1 .. 32],
					[0 4 8 12] +.x [1 2 2 4 4 3 3 1],
					1 ! 32
				].transposed,
				'2×2→UoS': [
					[1 .. 4],
					[1 2 12 14],
					1 ! 4
				].transposed ++ 4.uosSub,
				'3×2→UoS': [
					[1 .. 6],
					8 + [8 2 7 3 6 4],
					1 ! 6
				].transposed ++ 6.uosSub,
				'3×6→UoS': [
					[1 .. 18],
					[1 .. 2] ++ (8 + [1 .. 16]),
					1 ! 18
				].transposed ++ 18.uosSub,
				'4×2→UoS': [
					[1 .. 8],
					8 + [1 .. 8],
					1 ! 8
				].transposed ++ 8.uosSub,
				'5×2→UoS': [
					[1 .. 10],
					[1 .. 2] ++ (8 + [1 .. 8]),
					1 ! 10
				].transposed ++ 10.uosSub,
				'6×2→UoS': [
					[1 .. 12],
					8 + [1 .. 12],
					1 ! 12
				].transposed ++ 12.uosSub,
				'7×2→UoS': [
					[1 .. 14],
					8 + [1 .. 14],
					1 ! 14
				].transposed ++ 14.uosSub,
				'8×2→UoS': [
					[1 .. 16],
					8 + [1 .. 16],
					1 ! 16
				].transposed ++ 16.uosSub,
				'9×2→UoS': [
					[1 .. 18],
					[1 .. 2] ++ (8 + [1 .. 16]),
					1 ! 18
				].transposed ++ 18.uosSub,
				'10×2→UoS': [
					[1 .. 20],
					[
						[1 .. 2],
						[8 16] +.x [1 .. 8],
						8 + [3 7]
					].concatenation,
					1 ! 20
				].transposed ++ 20.uosSub,
				'11×2→UoS': [
					[1 .. 22],
					[
						[1 .. 2],
						[8 16] +.x [1 .. 8],
						8 + [1 5 3 7]
					].concatenation,
					1 ! 22
				].transposed ++ 22.uosSub,
				'12×2→UoS': [
					[1 .. 24],
					[
						[1 .. 2],
						[8 16] +.x [1 .. 8],
						8 + [1 5 3 7 4 8]
					].concatenation,
					1 ! 24
				].transposed ++ 24.uosSub,
				'13×2→UoS': [
					[1 .. 26],
					[
						[1 .. 2],
						[8 16] +.x [1 .. 8],
						8 + [1 5 3 7 4 8 2 6]
					].concatenation,
					1 ! 26
				].transposed ++ 26.uosSub,
				'16×2→UoS': [
					[1 .. 32],
					[
						8 + [1 2 2 3 3 4 4 5 5 6 6 7 7 8 8 1],
						[16 20] +.x [1 2 2 4 4 3 3 1]
					].concatenation,
					1 ! 32
				].transposed ++ 32.uosSub,
				'16×1→UoS': [
					[1 .. 16],
					8 + [1 .. 16],
					1 ! 16
				].transposed ++ 16.uosSub,
				'24×1→UoS': [
					[1 .. 24],
					[1 .. 24],
					1 ! 24
				].transposed ++ 24.uosSub
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
			self.sum
		}
	}

}
