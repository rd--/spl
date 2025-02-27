AliasMethod : [Object, Iterator] { | alias probability random |

	next { :self |
		let column = self.random.nextRandomInteger(1, self.probability.size);
		let coinToss = self.random.nextRandomFloat < self.probability[column];
		coinToss.if {
			column
		} {
			self.alias[column]
		}
	}

}

+List {

	AliasMethod { :self :random |
		let probabilities = self.copy;
		let count = probabilities.size;
		let probability = List(count);
		let alias = List(count);
		let average = 1 / count;
		let small = [];
		let large = [];
		1.toDo(count) { :i |
			(probabilities[i] >= average).if {
				large.addLast(i)
			} {
				small.addLast(i)
			}
		};
		{
			small.isEmpty || large.isEmpty
		}.whileFalse {
			let less = small.removeLast;
			let more = large.removeLast;
			probability[less] := probabilities[less] * count;
			alias[less] := more;
			probabilities[more] := probabilities[more] + probabilities[less] - average;
			(probabilities[more] >= (1 / count)).if {
				large.addLast(more)
			} {
				small.addLast(more)
			}
		};
		{ small.isEmpty }.whileFalse {
			probability[small.removeLast] := 1
		};
		{ large.isEmpty }.whileFalse {
			probability[large.removeLast] := 1
		};
		newAliasMethod().initializeSlots(alias, probability, random)
	}

	AliasMethod { :self |
		AliasMethod(self, system)
	}

}
