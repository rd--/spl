ColumnBrowserColumn : [Object] { | container filterText select entries |

	applyFilter { :self |
		|
		filter = self.filterText.isNil.if {
			{ true }
		} {
			| matchString = self.filterText.value; |
			['applyFilter', matchString].postLine;
			{ :aString |
				aString.includesSubstring(matchString)
			}
		};
		|
		self.select.removeAll;
		self.select.appendChildren(self.entries.select(filter).collect { :each |
			TextOption(each, each)
		});
		self.select.deselect
	}

	initialize { :self :withFilter |
		withFilter.if {
			self.container := 'div'.createElement;
			self.filterText := TextInput('');
			self.select := 'select'.createElement;
			self.container.setAttribute('class', 'column');
			self.filterText.setAttribute('class', 'filterText');
			self.filterText.addEventListener('change') { :event |
				['filterText', self.filterText.value].postLine;
				self.applyFilter
			};
			self.container.appendChildren([
				self.filterText,
				self.select
			])
		} {
			self.select := 'select'.createElement;
			self.filterText := nil;
			self.container := self.select
		};
		self
	}

	setEntries { :self :entries |
		self.entries := entries;
		self.applyFilter
	}

}

+ Boolean {

	ColumnBrowserColumn { :withFilter |
		newColumnBrowserColumn().initialize(withFilter)
	}

}

ColumnBrowser : [Object, View] { | browserPane columnsPane textEditor columnLists statusPane statusText title |

	createElements { :self :numberOfColumns :isRichText :withFilter |
		self.browserPane := 'div'.createElement;
		self.columnsPane :=  'div'.createElement;
		self.textEditor := newTextEditor().initialize(
			'ColumnBrowserTextEditor', isRichText, ''
		);
		self.statusPane := 'div'.createElement;
		self.columnLists := (1 .. numberOfColumns).collect { :index |
			ColumnBrowserColumn(withFilter & { index = 1 })
		};
		self.statusText := 'span'.createElement;
		self.columnsPane.appendChildren(self.columnLists.collect(container:/1));
		self.statusPane.appendChild(self.statusText);
		self.browserPane.appendChildren([
			self.columnsPane,
			self.textEditor.outerElement,
			self.statusPane
		])
	}

	initialize { :self :title :isRichText :withFilter :columnProportions :onChange:/2 |
		| numberOfColumns = columnProportions.size; |
		self.title := title;
		self.createElements(numberOfColumns, isRichText, withFilter);
		self.setEntries(1, onChange(self, []));
		self.setAttributes(columnProportions, 6);
		self.setEventHandlers(numberOfColumns, onChange:/2);
		self
	}

	outerElement { :self |
		self.browserPane
	}

	path { :self |
		self.columnLists.collect { :each | each.select.value }
	}

	path { :self :path |
		path.withCollect(self.columnLists.first(path.size)) { :aString :aColumn |
			aColumn.select.select(aString)
		};
		self.columnLists[path.size].select.dispatchEvent(Event('change'));
		self
	}


	setAttributes { :self :columnProportions :listSize |
		self.browserPane.setAttribute('class', 'browserPane');
		self.columnsPane.setAttribute('class', 'columnsPane');
		self.statusPane.setAttribute('class', 'statusPane');
		columnProportions.size.do { :index |
			| list = self.columnLists[index].select; |
			list.size := listSize;
			list.style.setProperties([
				'flex-grow' -> columnProportions[index].asString
			])
		}
	}

	setEntries { :self :columnIndex :entries |
		self.columnLists[columnIndex].setEntries(entries)
	}

	setEventHandlers { :self :numberOfColumns :onChange:/2 |
		numberOfColumns.do { :index |
			self.columnLists[index].select.addEventListener('change') { :unusedEvent |
				|
					next = onChange(self, (1 .. index).collect { :each |
						self.columnLists[each].select.value
					});
				|
				(index = numberOfColumns).if {
					next.then { :view |
						self.textEditor.setEditorText(view.asString)
					}
				} {
					self.textEditor.setEditorText('');
					(numberOfColumns - index - 1).do { :each |
						self.columnLists[index + each + 1].select.removeAll
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

	ColumnBrowser { :title :isRichText :withFilter :columnProportions :onChange:/2 |
		newColumnBrowser().initialize(title, isRichText, withFilter, columnProportions, onChange:/2)
	}

}
