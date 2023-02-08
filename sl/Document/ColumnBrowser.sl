ColumnBrowser { | browserPane columnsPane viewerPane columnLists viewerText |

	createElements { :self :numberOfColumns |
		self.browserPane := 'div'.createElement;
		self.columnsPane :=  'div'.createElement;
		self.viewerPane := 'div'.createElement;
		self.columnLists := { 'select'.createElement } ! numberOfColumns;
		self.viewerText := 'pre'.createElement;
		self.columnsPane.appendChildren(self.columnLists);
		self.viewerPane.appendChild(self.viewerText);
		self.browserPane.appendChildren([self.columnsPane, self.viewerPane]);
	}

	setAttributes { :self :columnProportions :listSize |
		self.viewerPane.setAttribute('class', 'documentContainer');
		self.browserPane.style.setProperties([
			'display' -> 'flex',
			'flex-direction' -> 'column',
			'flex-wrap' -> 'nowrap',
			'resize' -> 'both',
			'overflow' -> 'auto',
			'height' -> '25em',
			'width' -> '50em'
		]);
		self.columnsPane.style.setProperties([
			'display' -> 'flex',
			'flex-direction' -> 'row',
			'flex-grow' -> '1',
			'margin' -> '2px'
		]);
		columnProportions.size.do { :index |
			| list = self.columnLists[index]; |
			list.size := listSize;
			list.style.setProperties([
				'flex-grow' -> columnProportions[index].asString,
				'flex-basis' -> '6em',
				'margin' -> '1px',
				'width' -> '100%'
			])
		};
		self.viewerPane.style.setProperties([
			'flex-grow' -> '1',
			'flex-basis' -> '6em',
			'margin' -> '4px'
		]);
		self.viewerText.setAttributes((contentEditable: 'true', spellcheck: 'false'))
	}

	setColumnEntries { :self :index :entries |
		self.columnLists[index].removeAll;
		self.columnLists[index].appendChildren(entries.collect { :each |
			TextOption(each, each)
		})
	}

	setEventHandlers { :self :numberOfColumns :onChange:/1 |
		numberOfColumns.do { :index |
			self.columnLists[index].addEventListener('change', { :event |
				| next = (1 .. index).collect { :each | self.columnLists[each].value }.onChange; |
				['setEventHandlers', index, numberOfColumns, next].postLine;
				(index = numberOfColumns).if {
					self.viewerText.textContent := next.asString
				} {
					self.viewerText.textContent := '';
					(numberOfColumns - index - 1).do { :each |
						['remove', index + 1 + each].postLine;
						self.columnLists[index + each + 1].removeAll
					};
					self.setColumnEntries(index + 1, next)				}
			})
		}
	}

}

+ Array {

	ColumnBrowser { :columnProportions :onChange:/1 |
		| numberOfColumns = columnProportions.size, browser = newColumnBrowser(nil, nil, nil, nil, nil); |
		browser.createElements(numberOfColumns);
		browser.setColumnEntries(1, onChange([]));
		browser.setAttributes(columnProportions, 6);
		browser.setEventHandlers(numberOfColumns, onChange:/1);
		browser
	}

}

+ Void {

	TraitBrowser {
		ColumnBrowser([1, 3], { :path |
			['ColumnBrowser', path].postLine;
			path.size.caseOf([
				0 -> { system.traitDictionary.keys.sorted },
				1 -> { system.traitDictionary[path[1]].methodDictionary.keys.sorted },
				2 -> { system.traitDictionary[path[1]].methodDictionary[path[2]].definition }
			])
		})
	}

	TypeBrowser {
		ColumnBrowser([1, 3], { :path |
			['ColumnBrowser', path].postLine;
			path.size.caseOf([
				0 -> { system.typeDictionary.keys.sorted },
				1 -> { system.typeDictionary[path[1]].methodDictionary.keys.sorted },
				2 -> { system.typeDictionary[path[1]].methodDictionary[path[2]].definition }
			])
		})
	}

}

(*
	system.window.document.body.appendChild(TypeBrowser().browserPane)
	system.window.document.body.appendChild(TraitBrowser().browserPane)
	system.window.document.body.appendChild(TraitAndTypeMethodBrowser().browserPane)
*)

TraitAndTypeMethodBrowser { |
	browserPane selectionPane programPane typeTraitPane
	typeList traitList methodList listPlaces
	methodText
	currentDictionary |

	createElements { :self |
		self.browserPane := 'div'.createElement;
		self.selectionPane :=  'div'.createElement;
		self.programPane := 'div'.createElement;
		self.typeTraitPane :=  'div'.createElement;
		self.typeList := 'select'.createElement;
		self.traitList := 'select'.createElement;
		self.methodList := 'select'.createElement;
		self.methodText := 'pre'.createElement;
		self.typeTraitPane.appendChildren([self.typeList, self.traitList]);
		self.selectionPane.appendChildren([self.typeTraitPane, self.methodList]);
		self.programPane.appendChild(self.methodText);
		self.browserPane.appendChildren([self.selectionPane, self.programPane]);
	}

	setListElements { :self |
		self.typeList.appendChildren(system.typeDictionary.keys.sorted.collect { :each |
			TextOption(each, each)
		});
		self.traitList.appendChildren(system.traitDictionary.keys.sorted.collect { :each |
			TextOption(each, each)
		})
	}

	setAttributes { :self |
		self.programPane.setAttribute('class', 'documentContainer');
		self.browserPane.style.setProperties([
			'display' -> 'flex',
			'flex-direction' -> 'column',
			'flex-wrap' -> 'nowrap',
			'resize' -> 'both',
			'overflow' -> 'auto',
			'height' -> '25em',
			'width' -> '50em'
		]);
		self.typeTraitPane.style.setProperties([
			'display' -> 'flex',
			'flex-direction' -> 'column',
			'margin' -> '2px',
			'flex-grow' -> '1'
		]);
		self.selectionPane.style.setProperties([
			'display' -> 'flex',
			'flex-direction' -> 'row',
			'flex-grow' -> '1',
			'margin' -> '2px'
		]);
		[self.typeList, self.traitList].do { :each |
			each.style.setProperties([
				'flex-grow' -> '1',
				'flex-basis' -> '6em',
				'margin' -> '1px',
				'width' -> '100%'
			])
		};
		self.methodList.style.setProperties([
			'flex-grow' -> '3',
			'flex-basis' -> '8em',
			'margin' -> '2px'
		]);
		self.programPane.style.setProperties([
			'flex-grow' -> '1',
			'flex-basis' -> '6em',
			'margin' -> '4px'
		]);
		self.listPlaces := 6;
		self.typeList.size := self.listPlaces;
		self.traitList.size := self.listPlaces;
		self.methodList.size := self.listPlaces * 2;
		self.methodText.setAttributes((contentEditable: 'true', spellcheck: 'false'))
	}

	updateMethodList { :self |
		self.methodList.removeAll;
		self.methodList.appendChildren(
			self.currentDictionary.values.collect(qualifiedName:/1).sorted.collect { :each |
				TextOption(each, each)
			}
		)
	}

	updateProgramText { :self :qualifiedMethodName |
		self.methodText.textContent := self.currentDictionary[qualifiedMethodName].definition
	}

	setEventHandlers { :self |
		self.typeList.addEventListener('change', { :event |
			self.traitList.selectedIndex := -1;
			self.methodText.textContent := '';
			self.currentDictionary := system.typeDictionary[event.target.value].methodDictionary;
			self.updateMethodList
		});
		self.traitList.addEventListener('change', { :event |
			self.typeList.selectedIndex := -1;
			self.methodText.textContent := '';
			self.currentDictionary := system.traitDictionary[event.target.value].methodDictionary;
			self.updateMethodList
		});
		self.methodList.addEventListener('change', { :event |
			self.updateProgramText(event.target.value)
		})
	}

}

+ Void {

	TraitAndTypeMethodBrowser {
		| browser = newTraitAndTypeMethodBrowser(nil, nil, nil, nil, nil, nil, nil, nil, nil, nil); |
		browser.createElements;
		browser.setListElements;
		browser.setAttributes;
		browser.setEventHandlers;
		browser
	}

}
