+@Integer {

	SparseMatrixMixer { :numOutputs :inputList :sparseMatrix |
		let answer = Dc(0) # numOutputs;
		sparseMatrix.do { :each |
			let [inputIndex, outputIndex, gain] = each;
			/* ['SparseMatrixMixer', each].postLine; */
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
					4.iota,
					4.iota,
					1 # 4
				].transposed,
				'4×2→1×4': [
					8.iota,
					[1 2 2 3 3 4 4 1],
					1 # 8
				].transposed,
				'4×2→1×8': [
					8.iota,
					8.iota,
					1 # 8
				].transposed,
				'8×2→1×8': [
					16.iota,
					[1 2 2 3 3 4 4 5 5 6 6 7 7 8 8 1],
					1 # 16
				].transposed,
				'8×2→2×4': [
					16.iota,
					[0 4] +.x [1 2 2 3 3 4 4 1],
					1 # 16
				].transposed,
				'16×2→2×8': [
					32.iota,
					[0 8] +.x [1 2 2 3 3 4 4 5 5 6 6 7 7 8 8 1],
					1 # 32
				].transposed,
				'16×2→4×4': [
					32.iota,
					[0 4 8 12] +.x [1 2 2 3 3 4 4 1],
					1 # 32
				].transposed,
				'2×2→1×8': [
					4.iota,
					[8 2 4 6],
					1 # 4
				].transposed,
				'3×2→1×8': [
					6.iota,
					[8 2 7 3 6 4],
					1 # 6
				].transposed,
				'3×6→1×2+1×8+2×4': [
					18.iota,
					18.iota,
					1 # 18
				].transposed,
				'4×2→1×8': [
					8.iota,
					8.iota,
					1 # 8
				].transposed,
				'5×2→1×2+1×8': [
					10.iota,
					10.iota,
					1 # 10
				].transposed,
				'6×2→1×8+2×4': [
					12.iota,
					12.iota,
					1 # 12
				].transposed,
				'7×2→1×8+2×4': [
					14.iota,
					14.iota,
					1 # 14
				].transposed,
				'8×1→1×8': [
					8.iota,
					8.iota,
					1 # 8
				].transposed,
				'9×2→1×2+1×8+2×4': [
					18.iota,
					18.iota,
					1 # 18
				].transposed,
				'10×2→1×2+1×8+2×4': [
					20.iota,
					[
						[1 2],
						[2 10] +.x 8.iota,
						2 + [1 5]
					].catenate,
					1 # 20
				].transposed,
				'11×2→1×2+1×8+2×4': [
					22.iota,
					[
						[1 2],
						[2 10] +.x 8.iota,
						2 + [1 5 3 7]
					].catenate,
					1 # 22
				].transposed,
				'12×2→1×2+1×8+2×4': [
					24.iota,
					[
						[1 2],
						[2 10] +.x 8.iota,
						2 + [1 5 3 7 4 8]
					].catenate,
					1 # 24
				].transposed,
				'13×2→1×2+1×8+2×4': [
					26.iota,
					[
						[1 2],
						[2 10] +.x 8.iota,
						2 + [1 5 3 7 4 8 2 6]
					].catenate,
					1 # 26
				].transposed,
				'1×8+2×4→1×8+2×4': [
					16.iota,
					16.iota,
					1 # 16
				].transposed,
				'16×2→1×8+2×4': [
					32.iota,
					[
						[1 2 2 3 3 4 4 5 5 6 6 7 7 8 8 1],
						[8 12] +.x [1 2 2 4 4 3 3 1]
					].catenate,
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
			[run.asString, value.asString].stringIntercalate('×')
		}.join('+') ++ '→';
		/* ['Mix', ruleTable, derivedPrefix].postLine; */
		self.mixByAvailableNamedRule(derivedPrefix, ruleTable)
	}

	mixByAvailableNamedRule { :self :prefix :ruleTable |
		let sparseMatrixTable = system.mixRuleSparseMatrixTable;
		valueWithReturn { :return:/1 |
			ruleTable.do { :each |
				let [name, busesByIndex] = each;
				/* ['mixByAvailableNamedRule', each, prefix].postLine; */
				sparseMatrixTable.atIfPresent(prefix ++ name) { :entries |
					let inputs = self.catenate;
					let reindexedEntries = entries.collect { :entry |
						[
							entry.first,
							busesByIndex[entry.second],
							entry.third
						]
					};
					let channelCount = reindexedEntries.collect(second:/1).max;
					/* ['mixByAvailableNamedRule', channelCount, self.shape, reindexedEntries].postLine; */
					SparseMatrixMixer(
						channelCount,
						self.catenate,
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
				spread.isSmallFloat & {
					spread = 1
				}
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
