(* {"requires": ["ListChooser", "SmallKansas", "TextEditor"]} *)

ColumnBrowser : [Object, View] { | smallKansas browserPane columnsPane previewPane textEditor numberOfColumns columnLists statusPane statusText title |

	addKeyBindings { :self :aProcedure:/1 |
		self.textEditor.addKeyBindings(self.textEditor.aProcedure)
	}

	createElements { :self :mimeType :withFilter :withStatus :columnProportions :listSize |
		self.browserPane := 'div'.createElement (
			class: 'browserPane'
		);
		self.columnsPane := 'div'.createElement (
			class: 'columnsPane'
		);
		self.previewPane := 'div'.createElement (
			class: 'previewPane'
		);
		self.textEditor := self.smallKansas.TextEditor(
			'ColumnBrowserTextEditor', mimeType, ''
		);
		self.columnLists := (1 .. self.numberOfColumns).collect { :index |
			ListChooser(withFilter & { index = 1 }, nil, listSize)
		};
		1.toDo(columnProportions.size) { :index |
			| list = self.columnLists[index].listChooserPane; |
			list.style.setProperties((
				'flex': columnProportions[index].asString ++ ' 1 16em'
			))
		};
		self.columnsPane.appendChildren(self.columnLists.collect(listChooserPane:/1));
		self.previewPane.appendChild(self.textEditor.outerElement);
		self.browserPane.appendChildren([
			self.columnsPane,
			self.previewPane
		]);
		withStatus.ifTrue {
			self.statusPane := 'div'.createElement (
				class: 'statusPane'
			);
			self.statusText := 'span'.createElement (
				class: 'statusText'
			);
			self.statusPane.appendChild(self.statusText);
			self.browserPane.appendChild(self.statusPane)
		}
	}

	initialize { :self :smallKansas :title :mimeType :withFilter :withStatus :columnProportions :clientKeyBindings :onAccept:/1 :onChange:/2 |
		self.smallKansas := smallKansas;
		self.title := title;
		self.numberOfColumns := columnProportions.size;
		self.createElements(mimeType, withFilter, withStatus, columnProportions, 6);
		self.setColumnEntries(1, onChange(self, []));
		self.setEventHandlers(onChange:/2);
		clientKeyBindings.isProcedure.ifTrue {
			self.addKeyBindings(clientKeyBindings)
		};
		onAccept:/1.isProcedure.ifTrue {
			self.textEditor.addEventListener('accept') { :event |
				event.detail.onAccept
			}
		};
		self
	}

	outerElement { :self |
		self.browserPane
	}

	pathUpTo { :self :size |
		(1 .. size).collect { :each |
			self.columnLists[each].select.value
		}
	}

	columnEdited { :self :index :onChange:/2 |
		|(
			next = onChange(self, self.pathUpTo(index))
		)|
		(index = self.numberOfColumns).if {
			next.then { :view |
				self.textEditor.setEditorText(view.asString)
			}
		} {
			self.textEditor.setEditorText('');
			1.toDo(self.numberOfColumns - index - 1) { :each |
				self.columnLists[index + each + 1].select.removeAll
			};
			self.setColumnEntries(index + 1, next)
		}
	}

	setColumnEntries { :self :index :entries |
		self.columnLists[index].setEntries(entries)
	}

	setColumnValue { :self :index :value |
		| select = self.columnLists[index].select; |
		select.select(value);
		select.dispatchEvent(Event('change'))
	}

	setEventHandlers { :self :onChange:/2 |
		1.toDo(self.numberOfColumns) { :index |
			self.columnLists[index].select.addEventListener('change') { :event |
				self.columnEdited(index, onChange:/2)
			}
		}
	}

	setPath { :self :path |
		path.indicesDo { :index |
			self.setColumnValue(index, path[index])
		};
		self
	}

	setStatus { :self :aString |
		self.statusText.ifNotNil {
			self.statusText.textContent := aString
		}
	}

}

+SmallKansas {

	ColumnBrowser { :self :title :mimeType :withFilter :withStatus :columnProportions :clientKeyBindings :onAccept:/1 :onChange:/2 |
		newColumnBrowser().initialize(
			self,
			title,
			mimeType,
			withFilter,
			withStatus,
			columnProportions,
			clientKeyBindings,
			onAccept:/1,
			onChange:/2
		)
	}

}
