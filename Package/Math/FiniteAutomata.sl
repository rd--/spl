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

