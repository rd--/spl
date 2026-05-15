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
