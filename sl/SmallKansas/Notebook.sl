{- Requires: SmallKansas Window -}

Notebook : [Object, View, SmallKansan] { | smallKansas notebookPane count programs answers cells |

	addCell { :self |
		let program = 'textarea'.createElement(class: 'notebookProgram');
		let answer = 'pre'.createElement(class: 'notebookAnswer');
		let cell = 'details'.createElement(class: 'notebookCell', open: 'true');
		let summary = 'summary'.createElement(class: 'notebookSummary');
		let cellNumber = self.count + 1;
		self.programs.addLast('');
		self.answers.addLast(nil);
		summary.textContent := cellNumber.asString;
		program.rows := 1;
		program.addEventListener('keydown') { :event |
			event.ctrlKey.if {
				(event.key = 'Enter').ifTrue {
					let result = self.smallKansas.evaluate(program.value, nil);
					answer.textContent := result.printString;
					program.readOnly = true;
					(cellNumber = self.count).ifTrue {
						self.addCell
					}
				}
			} {
				(event.key = 'Enter').ifTrue {
					program.rows := program.rows + 1
				};
				(event.key = 'Backspace').ifTrue {
					program.rows := program.value.count { :each |
						each.isLineFeed
					}.max(1)
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

}

+SmallKansas {

	Notebook { :self |
		newNotebook().initialize(self)
	}

}
