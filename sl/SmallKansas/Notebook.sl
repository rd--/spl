{- Requires: SmallKansas SmallProgram Window -}

Notebook : [Object, View, SmallKansan] { | smallKansas notebookPane cells |

	addCell { :self |
		let cell = 'details'.createElement(class: 'notebookCell', open: 'true');
		let summary = 'summary'.createElement(class: 'notebookSummary');
		let cellNumber = self.count + 1;
		let program = self.smallKansas.SmallProgram('', '', '');
		summary.textContent := cellNumber.asString;
		program.addEventListener('evaluate') { :event |
			program.readOnly := true;
			(cellNumber = self.count).ifTrue {
				self.addCell
			}
		};
		cell.appendChild(summary);
		cell.appendChild(program.outerElement);
		self.cells.addLast(cell);
		self.notebookPane.appendChild(cell);
		program.focus
	}

	count { :self |
		self.cells.size
	}

	initialize { :self :smallKansas |
		self.smallKansas := smallKansas;
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
