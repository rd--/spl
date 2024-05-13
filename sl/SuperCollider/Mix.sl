+@Integer {

	SparseMatrixMixer { :numOutputs :inputList :sparseMatrix |
		let answer = Dc(0) # numOutputs;
		sparseMatrix.do { :each |
			let [inputIndex, outputIndex, gain] = each;
			{- ['SparseMatrixMixer', each].postLine; -}
			answer[outputIndex] := answer[outputIndex] + inputList[inputIndex] * gain
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
					1 # 4
				].transposed,
				'4×2→1×4': [
					[1 .. 8],
					[1 2 2 3 3 4 4 1],
					1 # 8
				].transposed,
				'4×2→1×8': [
					[1 .. 8],
					[1 .. 8],
					1 # 8
				].transposed,
				'8×2→1×8': [
					[1 .. 16],
					[1 2 2 3 3 4 4 5 5 6 6 7 7 8 8 1],
					1 # 16
				].transposed,
				'8×2→2×4': [
					[1 .. 16],
					[0 4] +.x [1 2 2 3 3 4 4 1],
					1 # 16
				].transposed,
				'16×2→2×8': [
					[1 .. 32],
					[0 8] +.x [1 2 2 3 3 4 4 5 5 6 6 7 7 8 8 1],
					1 # 32
				].transposed,
				'16×2→4×4': [
					[1 .. 32],
					[0 4 8 12] +.x [1 2 2 3 3 4 4 1],
					1 # 32
				].transposed,
				'2×2→1×8': [
					[1 .. 4],
					[8 2 4 6],
					1 # 4
				].transposed,
				'3×2→1×8': [
					[1 .. 6],
					[8 2 7 3 6 4],
					1 # 6
				].transposed,
				'3×6→1×2+1×8+2×4': [
					[1 .. 18],
					[1 .. 18],
					1 # 18
				].transposed,
				'4×2→1×8': [
					[1 .. 8],
					[1 .. 8],
					1 # 8
				].transposed,
				'5×2→1×2+1×8': [
					[1 .. 10],
					[1 .. 10],
					1 # 10
				].transposed,
				'6×2→1×8+2×4': [
					[1 .. 12],
					[1 .. 12],
					1 # 12
				].transposed,
				'7×2→1×8+2×4': [
					[1 .. 14],
					[1 .. 14],
					1 # 14
				].transposed,
				'8×1→1×8': [
					[1 .. 8],
					[1 .. 8],
					1 # 8
				].transposed,
				'9×2→1×2+1×8+2×4': [
					[1 .. 18],
					[1 .. 18],
					1 # 18
				].transposed,
				'10×2→1×2+1×8+2×4': [
					[1 .. 20],
					[
						[1 .. 2],
						[2 10] +.x [1 .. 8],
						2 + [1 5]
					].concatenation,
					1 # 20
				].transposed,
				'11×2→1×2+1×8+2×4': [
					[1 .. 22],
					[
						[1 .. 2],
						[2 10] +.x [1 .. 8],
						2 + [1 5 3 7]
					].concatenation,
					1 # 22
				].transposed,
				'12×2→1×2+1×8+2×4': [
					[1 .. 24],
					[
						[1 .. 2],
						[2 10] +.x [1 .. 8],
						2 + [1 5 3 7 4 8]
					].concatenation,
					1 # 24
				].transposed,
				'13×2→1×2+1×8+2×4': [
					[1 .. 26],
					[
						[1 .. 2],
						[2 10] +.x [1 .. 8],
						2 + [1 5 3 7 4 8 2 6]
					].concatenation,
					1 # 26
				].transposed,
				'1×8+2×4→1×8+2×4': [
					[1 .. 16],
					[1 .. 16],
					1 # 16
				].transposed,
				'16×2→1×8+2×4': [
					[1 .. 32],
					[
						[1 2 2 3 3 4 4 5 5 6 6 7 7 8 8 1],
						[8 12] +.x [1 2 2 4 4 3 3 1]
					].concatenation,
					1 # 32
				].transposed
			)
		}
	}

}

+List {

	Mix { :self |
		let ruleTable = system.preference('ScSynth/Outputs/Mixer/RuleTable', [['1×2', [1, 2]]]);
		let runList = self.collect(size:/1).asRunArray;
		let derivedPrefix = runList.runsAndValuesCollect { :run :value |
			[run.asString, '×', value.asString].stringJoin
		}.stringJoin('+') ++ '→';
		{- ['Mix', ruleTable, derivedPrefix].postLine; -}
		self.mixByAvailableNamedRule(derivedPrefix, ruleTable)
	}

	mixByAvailableNamedRule { :self :prefix :ruleTable |
		let sparseMatrixTable = system.mixRuleSparseMatrixTable;
		valueWithReturn { :return:/1 |
			ruleTable.do { :each |
				let [name, busesByIndex] = each;
				{- ['mixByAvailableNamedRule', each, prefix].postLine; -}
				sparseMatrixTable.atIfPresent(prefix ++ name) { :entries |
					let inputs = self.concatenation;
					let reindexedEntries = entries.collect { :entry |
						[
							entry.first,
							busesByIndex[entry.second],
							entry.third
						]
					};
					let channelCount = reindexedEntries.collect(second:/1).max;
					{- ['mixByAvailableNamedRule', channelCount, self.shape, reindexedEntries].postLine; -}
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
		let lowFrequencySends = system.preference('ScSynth/Outputs/Mixer/LowFrequency/Sends', []);
		let lowFrequencyGain = system.preference('ScSynth/Outputs/Mixer/LowFrequency/Gain', 1);
		(1 .. self.shape.sum).collect { :input |
			[
				input,
				lowFrequencySends.atWrap(input),
				lowFrequencyGain
			]
		}
	}

}

+List {

	Splay { :inList :spread |
		let numberOfChannels = system.scSynth.mainOutputs;
		let orientation = system.scSynth.mainOrientation;
		(
			inList.size = numberOfChannels & {
				spread = 1
			}
		).if {
			inList
		} {
			(numberOfChannels = 2).if {
				Splay2(inList, spread, 1, 0, true)
			} {
				SplayAz(numberOfChannels, inList, spread, 1, 2, 0, orientation, true)
			}
		}
	}

	Splay { :inList |
		Splay(inList, 1)
	}

	Sum { :self |
		(self.size >= 4).if {
			let prefix = Sum4(self[1], self[2], self[3], self[4]);
			(self.size = 4).if {
				prefix
			} {
				prefix + Sum(self.copyFromTo(5, self.size))
			}
		} {
			self.sum
		}
	}

}

+[Ugen, List] {

	EqPan { :input :position |
		let numberOfChannels = system.scSynth.mainOutputs;
		let orientation = system.scSynth.mainOrientation;
		(numberOfChannels = 2).if {
			EqPan2(input, position)
		} {
			PanAz(numberOfChannels, input, position, 1, 2, orientation)
		}
	}

}
