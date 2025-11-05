+List {

	isLyndonWord { :self :alphabet |
		self.isEmpty.if {
			false
		} {
			let n = self.size;
			let i = 1;
			let j = 2;
			valueWithReturn { :return:/1 |
				{ j <= n }.whileTrue {
					let a = alphabet[self[i]];
					let b = alphabet[self[j]];
					(a = b).if {
						i := i + 1;
						j := j + 1
					} {
						(a <| b).if {
							i := 1;
							j := j + 1
						} {
							false.return
						}
					}
				};
				i = 1
			}
		}
	}

	isLyndonWord { :self |
		let letters = self.nub.sort;
		let alphabet = letters.withIndexCollect(->).asMap;
		self.isLyndonWord(alphabet)
	}

	lyndonWords { :self :anInteger |
		let answer = [];
		self.lyndonWordsDo(anInteger) { :each |
			answer.add(each)
		};
		answer
	}

}
