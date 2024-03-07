{- Requires: SmallKansas Window -}

Notebook : [Object, View, SmallKansan] { | smallKansas notebookPane count programs answers cells historyCursor |

	addAnswer { :self :answer :result |
		let answerText = 'pre'.createElement(class: 'notebookAnswerText');
		answerText.textContent := result.printString;
		answer.appendChild(answerText);
		result.isPromise.ifTrue {
			result.then { :nextResult |
				self.addAnswer(answer, nextResult)
			}
		}
	}

	addCell { :self |
		let program = 'textarea'.createElement(class: 'notebookProgram');
		let answer = 'div'.createElement(class: 'notebookAnswer');
		let cell = 'details'.createElement(class: 'notebookCell', open: 'true');
		let summary = 'summary'.createElement(class: 'notebookSummary');
		let cellNumber = self.count + 1;
		self.programs.addLast('');
		self.answers.addLast(nil);
		summary.textContent := cellNumber.asString;
		program.rows := 1;
		program.addEventListener('keydown') { :event |
			['Key', event.key].postLine;
			event.ctrlKey.if {
				(event.key = 'Enter').ifTrue {
					let result = self.smallKansas.evaluate(program.value, nil);
					self.addAnswer(answer, result);
					self.programs[self.count] := program.value;
					program.readOnly := true;
					self.historyCursor := nil;
					(cellNumber = self.count).ifTrue {
						self.addCell
					}
				};
				(event.key = 'ArrowUp').ifTrue {
					event.preventDefault;
					self.readHistory(-1)
				};
				(event.key = 'ArrowDown').ifTrue {
					event.preventDefault;
					self.readHistory(1)
				}
			} {
				(event.key = 'Enter').ifTrue {
					program.rows := program.rows + 1
				};
				(event.key = 'Backspace').ifTrue {
					program.rows := program.value.lineCount
				}
			}
		};
		cell.appendChild(summary);
		cell.appendChild(program);
		cell.appendChild(answer);
		self.cells.addLast(cell);
		self.notebookPane.appendChild(cell);
		self.count := cellNumber;
		program.focus
	}


	initialize { :self :smallKansas |
		self.smallKansas := smallKansas;
		self.count := 0;
		self.programs := [];
		self.answers := [];
		self.cells := [];
		self.historyCursor := nil;
		self.notebookPane := 'div'.createElement(
			class: 'notebookPane'
		);
		self.addCell;
		self
	}

	openIn { :self :smallKansas :event |
		smallKansas.addFrame(
			smallKansas.Notebook,
			event
		)
	}

	outerElement { :self |
		self.notebookPane
	}

	readHistory { :self :anInteger |
		self.historyCursor.ifNil {
			self.historyCursor := self.count
		};
		self.historyCursor := self.historyCursor + anInteger;
		['readHistory', self.count, self.historyCursor, self.programs.atWrap(self.historyCursor)].postLine;
		self.setProgramText(self.count, self.programs.atWrap(self.historyCursor))
	}

	setProgramText { :self :anInteger :aString |
		let cell = self.cells[anInteger];
		let nodes = cell.childNodes;
		let program = nodes[2];
		let size = aString.size;
		self.programs[anInteger] := aString;
		program.value := aString;
		program.rows := aString.lineCount;
		program.focus;
		program.setSelectionRange(size, size)
	}

}

+SmallKansas {

	Notebook { :self |
		newNotebook().initialize(self)
	}

}
