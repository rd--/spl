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
			answer.add(finalCondition);
			initialCondition := finalCondition
		};
		answer
	}

}

+SmallFloat {

	turingMachineFromNumber { :n :s :k |
		let p = n.integerDigits(2 * s * k, s * k).partition(k);
		p.deepIndices.select { :i |
			i.size = 2
		}.collect { :i |
			let e = p.atPath(i);
			let a = [1, -1] * i + [0, k];
			let b = [1, 1, 2] * e.quotient([2 * k, 2, 1]).mod([s, k, 2]) + [1, 0, -1];
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
			minIndex:maxIndex.collect { :i |
				t.atIfAbsent(i) { i.defaultCell }
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
			answer.add([[currentState, tapeIndex], tape.copy])
		};
		answer.collect { :each |
			let [s, dx] = each[1];
			[[s, dx - minIndex + 1, dx], tapeToList(each[2])]
		}
	}

}

