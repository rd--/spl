+@Sequenceable {

	mergeInPlace { :self :select:/1 :insert:/2 |
		let answer = [];
		{
			self.isEmpty
		}.whileFalse {
			let x = self.collect(first:/1);
			let i = x.indexOf(x.select);
			answer.insert(self[i].removeFirst);
			self[i].isEmpty.ifTrue {
				self.removeAt(i)
			}
		};
		answer
	}

	patienceSortPiles { :self |
		let piles = [];
		let answer = [];
		self.do { :card |
			let index = piles.detectIndex { :each |
				each.last >= card
			};
			index.ifNil {
				piles.addLast([card])
			} {
				piles[index].addLast(card)
			}
		};
		piles
	}

	patienceSort { :self |
		self.patienceSortPiles.mergeInPlace(max:/1, addFirst:/2)
	}

}
