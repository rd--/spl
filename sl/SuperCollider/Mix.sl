+@Integer {

	SparseMatrixMixer { :numOutputs :inputArray :sparseMatrix |
		| answer = Dc(0) ! numOutputs; |
		sparseMatrix.do { :each |
			| [inputIndex, outputIndex, gain] = each; |
			['SparseMatrixMixer', each].postLine;
			answer[outputIndex] +:= inputArray[inputIndex] * gain
		};
		answer
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
				'4×2→1×4': [
					[1 .. 8],
					[1 2 2 3 3 4 4 1],
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
				'2×2→1×8': [
					[1 .. 4],
					[8 2 4 6],
					1 ! 4
				].transposed,
				'3×2→1×8': [
					[1 .. 6],
					[8 2 7 3 6 4],
					1 ! 6
				].transposed,
				'3×6→1×2+1×8+2×4': [
					[1 .. 18],
					[1 .. 18],
					1 ! 18
				].transposed,
				'4×2→1×8': [
					[1 .. 8],
					[1 .. 8],
					1 ! 8
				].transposed,
				'5×2→1×2+1×8': [
					[1 .. 10],
					[1 .. 10],
					1 ! 10
				].transposed,
				'6×2→1×8+2×4': [
					[1 .. 12],
					[1 .. 12],
					1 ! 12
				].transposed,
				'7×2→1×8+2×4': [
					[1 .. 14],
					[1 .. 14],
					1 ! 14
				].transposed,
				'8×1→1×8': [
					[1 .. 8],
					[1 .. 8],
					1 ! 8
				].transposed,
				'9×2→1×2+1×8+2×4': [
					[1 .. 18],
					[1 .. 18],
					1 ! 18
				].transposed,
				'10×2→1×2+1×8+2×4': [
					[1 .. 20],
					[
						[1 .. 2],
						[2 10] +.x [1 .. 8],
						2 + [1 5]
					].concatenation,
					1 ! 20
				].transposed,
				'11×2→1×2+1×8+2×4': [
					[1 .. 22],
					[
						[1 .. 2],
						[2 10] +.x [1 .. 8],
						2 + [1 5 3 7]
					].concatenation,
					1 ! 22
				].transposed,
				'12×2→1×2+1×8+2×4': [
					[1 .. 24],
					[
						[1 .. 2],
						[2 10] +.x [1 .. 8],
						2 + [1 5 3 7 4 8]
					].concatenation,
					1 ! 24
				].transposed,
				'13×2→1×2+1×8+2×4': [
					[1 .. 26],
					[
						[1 .. 2],
						[2 10] +.x [1 .. 8],
						2 + [1 5 3 7 4 8 2 6]
					].concatenation,
					1 ! 26
				].transposed,
				'16×1→1×8+2×4': [
					[1 .. 16],
					[1 .. 16],
					1 ! 16
				].transposed,
				'16×2→1×8+2×4': [
					[1 .. 32],
					[
						[1 2 2 3 3 4 4 5 5 6 6 7 7 8 8 1],
						[8 12] +.x [1 2 2 4 4 3 3 1]
					].concatenation,
					1 ! 32
				].transposed.postLine
			)
		}
	}

}

+Array {

	Mix { :self :name |
		self.mixByDerivedNamedRule(name)
	}

	Mix { :self |
		| mixerRules = system.preference('ScSynth.Outputs.Mixer.Rules', ['1×2']); |
		['Mix', mixerRules].postLine;
		self.mixByDerivedNamedRule(mixerRules)
	}

	mixByDerivedNamedRule { :self :names |
		|(
			shape = self.shape,
			derivedPrefix = [
				shape.first.asString,
				'×',
				(shape.size = 1).if {
					'1'
				} {
					shape.second.asString
				},
				'→'
			].join
		)|
		['mixByDerivedNamedRule', names, derivedPrefix].postLine;
		self.mixByAvailableNamedRule(derivedPrefix, names)
	}

	mixByAvailableNamedRule { :self :prefix :names |
		|(
			ruleTable = system.mixRuleSparseMatrixTable,
			busTable = system.preference('ScSynth.Outputs.Mixer.Rules.Buses', ('1×2': [1, 2]))
		)|
		['mixByAvailableNamedRule', ruleTable, busTable].postLine;
		valueWithReturn { :return:/1 |
			names.do { :each |
				['mixByAvailableNamedRule', each, prefix ++ each].postLine;
				ruleTable.atIfPresent(prefix ++ each) { :entries |
					|(
						busesByIndex = busTable[each],
						inputs = self.concatenation,
						reindexedEntries = entries.collect { :entry |
							[
								entry.first,
								busesByIndex[entry.second],
								entry.third
							]
						},
						channelCount = reindexedEntries.collect(second:/1).max
					)|
					['mixByAvailableNamedRule', channelCount, self.shape, reindexedEntries].postLine;
					SparseMatrixMixer(
						channelCount,
						self.concatenation,
						reindexedEntries ++ self.lowFrequencySendsSparseMatrix
					).return
				}
			};
			self.sum
		}
	}

	lowFrequencySendsSparseMatrix { :self |
		|(
			lowFrequencySends = system.preference('ScSynth.Outputs.Mixer.LowFrequencySends', []),
			lowFrequencyGain = system.preference('ScSynth.Outputs.Mixer.LowFrequencyGain', 1)
		)|
		(1 .. self.shape.sum).collect { :input |
			[
				input,
				lowFrequencySends.atWrap(input),
				lowFrequencyGain
			]
		}
	}

}

+Array {

	Splay { :inArray |
		|(
			numberOfChannels = system.scSynth.mainOutputs,
			orientation = system.scSynth.mainOrientation
		)|
		(numberOfChannels = 2).if {
			Splay2(inArray)
		} {
			SplayAz(numberOfChannels, inArray, 1, 1, 2, 0, orientation, true)
		}
	}

}

+[Ugen, Array] {

	EqPan { :input :position |
		|(
			numberOfChannels = system.scSynth.mainOutputs,
			orientation = system.scSynth.mainOrientation
		)|
		(numberOfChannels = 2).if {
			EqPan2(input, position)
		} {
			PanAz(numberOfChannels, input, position, 1, 2, orientation)
		}
	}

}
