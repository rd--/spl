+List {

	iteratedFiniteAutomaton { :ruleList :initialState :initialCondition :iterationCount |
		let ruleDictionary = Dictionary(ruleList);
		let answer = [initialCondition];
		iterationCount.timesRepeat {
			let state = initialState;
			let finalCondition = initialCondition.collect { :input |
				let [nextState, output] = ruleDictionary.at([state, input]);
				state := nextState;
				output
			};
			answer.add!(finalCondition);
			initialCondition := finalCondition
		};
		answer
	}

}

+[Integer, @SmallInteger] {

	turingMachineFromNumber { :n :s :k |
		let p = n.integerDigits(2L * s * k, s * k).partition(k);
		p.deepIndices.select { :i |
			i.size = 2L
		}.collect { :i |
			let e = p.atPath(i);
			let a = [1L, -1L] * i + [0L, k];
			let b = [1L, 1L, 2L] * e.quotient([2L * k, 2L, 1L]).mod([s, k, 2L]) + [1L, 0L, -1L];
			a -> b
		}
	}

}

+List {

	turingMachine { :ruleList :initialConfiguration :stepCount |
		let initialState = initialConfiguration[1];
		let [initialCells, cellBackground] = initialConfiguration[2];
		let defaultCell = { :i |
			cellBackground.atWrap(i + 1)
		};
		let tape = Map(
			initialCells.withIndexCollect { :c :i |
				(i - 1) -> c
			}
		);
		let answer = [
			[[initialState, 0], tape.copy]
		];
		let currentState = initialState;
		let tapeIndex = 0;
		let minIndex = 0;
		let maxIndex = 0;
		let relativeIndex = 0;
		let tapeToList = { :t |
			minIndex.toCollect(maxIndex) { :i |
				t.atIfAbsent(i) {
					i.defaultCell
				}
			}
		};
		ruleList.isAssociationList.ifFalse {
			let [n, s, k] = ruleList;
			ruleList := turingMachineFromNumber(n, s, k)
		};
		stepCount.timesRepeat {
			let cellValue = tape.atIfAbsent(tapeIndex) { tapeIndex.defaultCell };
			let [nextState, nextCellValue, indexDifference] = ruleList.detect { :each |
				each.key = [currentState, cellValue]
			}.value;
			currentState := nextState;
			tape[tapeIndex] := nextCellValue;
			tapeIndex := tapeIndex + indexDifference;
			(tapeIndex < minIndex).ifTrue {
				minIndex := tapeIndex
			};
			(tapeIndex > maxIndex).ifTrue {
				maxIndex := tapeIndex
			};
			answer.add!([[currentState, tapeIndex], tape.copy])
		};
		answer.collect { :each |
			let [s, dx] = each[1];
			[[s, dx - minIndex + 1, dx], tapeToList(each[2])]
		}
	}

}

