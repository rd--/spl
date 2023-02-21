ColumnBrowser : [Object, View] { | browserPane columnsPane textEditor columnLists statusPane statusText title |

	createElements { :self :numberOfColumns :isRichText |
		self.browserPane := 'div'.createElement;
		self.columnsPane :=  'div'.createElement;
		self.textEditor := newTextEditor().initialize(
			'ColumnBrowserTextEditor', isRichText, ''
		);
		self.statusPane := 'div'.createElement;
		self.columnLists := { 'select'.createElement } ! numberOfColumns;
		self.statusText := 'pre'.createElement;
		self.columnsPane.appendChildren(self.columnLists);
		self.statusPane.appendChild(self.statusText);
		self.browserPane.appendChildren([
			self.columnsPane,
			self.textEditor.outerElement,
			self.statusPane
		])
	}

	initialize { :self :title :isRichText :columnProportions :onChange:/2 |
		| numberOfColumns = columnProportions.size; |
		self.title := title;
		self.createElements(numberOfColumns, isRichText);
		self.setEntries(1, onChange(self, []));
		self.setAttributes(columnProportions, 6);
		self.setEventHandlers(numberOfColumns, onChange:/2);
		self
	}

	outerElement { :self |
		self.browserPane
	}

	path { :self |
		self.columnLists.collect(value:/1)
	}

	path { :self :path |
		path.withCollect(self.columnLists.first(path.size)) { :aString :aSelect |
			aSelect.select(aString)
		};
		self.columnLists[path.size].dispatchEvent(Event('change'));
		self
	}


	setAttributes { :self :columnProportions :listSize |
		self.browserPane.setAttribute('class', 'browserPane');
		self.columnsPane.setAttribute('class', 'columnsPane');
		self.statusPane.setAttribute('class', 'statusPane');
		columnProportions.size.do { :index |
			| list = self.columnLists[index]; |
			list.size := listSize;
			list.style.setProperties([
				'flex-grow' -> columnProportions[index].asString
			])
		}
	}

	setEntries { :self :columnIndex :entries |
		self.columnLists[columnIndex].removeAll;
		self.columnLists[columnIndex].appendChildren(entries.collect { :each |
			TextOption(each, each)
		});
		self.columnLists[columnIndex].deselect
	}

	setEventHandlers { :self :numberOfColumns :onChange:/2 |
		numberOfColumns.do { :index |
			self.columnLists[index].addEventListener('change') { :unusedEvent |
				|
					next = onChange(self, (1 .. index).collect { :each |
						self.columnLists[each].value
					});
				|
				(index = numberOfColumns).if {
					next.then { :view |
						self.textEditor.setEditorText(view.asString)
					}
				} {
					self.textEditor.setEditorText('');
					(numberOfColumns - index - 1).do { :each |
						self.columnLists[index + each + 1].removeAll
					};
					self.setEntries(index + 1, next)
				}
			}
		}
	}

	setStatus { :self :aString |
		self.statusText.textContent := aString
	}

}

+ String {

	ColumnBrowser { :title :isRichText :columnProportions :onChange:/2 |
		newColumnBrowser().initialize(title, isRichText, columnProportions, onChange:/2)
	}

}
