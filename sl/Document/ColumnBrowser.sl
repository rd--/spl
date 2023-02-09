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
		self.browserPane.setAttribute('class', 'columnBrowser');
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
				(index = numberOfColumns).if {
					self.viewerText.textContent := next.asString
				} {
					self.viewerText.textContent := '';
					(numberOfColumns - index - 1).do { :each |
						self.columnLists[index + each + 1].removeAll
					};
					self.setColumnEntries(index + 1, next)				}
			})
		}
	}

}

+ Array {

	ColumnBrowser { :columnProportions :onChange:/1 |
		| numberOfColumns = columnProportions.size, browser = newColumnBrowser(); |
		browser.createElements(numberOfColumns);
		browser.setColumnEntries(1, onChange([]));
		browser.setAttributes(columnProportions, 6);
		browser.setEventHandlers(numberOfColumns, onChange:/1);
		browser
	}

}

+ Void {

	MethodBrowser {
		| methodNames = system.allMethods.collect(qualifiedName:/1).IdentitySet.Array.sorted ; |
		ColumnBrowser([3, 1], { :path |
			path.size.caseOf([
				0 -> { methodNames },
				1 -> { system.methodTraits(path[1]) ++ system.methodTypes(path[1]) },
				2 -> { system.traitOrType(path[2]).methodDictionary[path[1]].definition }
			])
		})
	}

	SystemBrowser {
		| systemNames = (system.traitDictionary.keys ++ system.typeDictionary.keys).sorted; |
		ColumnBrowser([1, 3], { :path |
			path.size.caseOf([
				0 -> { systemNames },
				1 -> { system.traitOrType(path[1]).methodDictionary.keys.sorted },
				2 -> { system.traitOrType(path[1]).methodDictionary[path[2]].definition }
			])
		})
	}

	TraitBrowser {
		| traitNames = system.traitDictionary.keys.sorted; |
		ColumnBrowser([1, 3], { :path |
			path.size.caseOf([
				0 -> { traitNames },
				1 -> { system.traitDictionary[path[1]].methodDictionary.keys.sorted },
				2 -> { system.traitDictionary[path[1]].methodDictionary[path[2]].definition }
			])
		})
	}

	TypeBrowser {
		| typeNames = system.typeDictionary.keys.sorted; |
		ColumnBrowser([1, 3], { :path |
			path.size.caseOf([
				0 -> { typeNames },
				1 -> { system.typeDictionary[path[1]].methodDictionary.keys.sorted },
				2 -> { system.typeDictionary[path[1]].methodDictionary[path[2]].definition }
			])
		})
	}

}

(*
	system.window.document.body.appendChild(TypeBrowser().browserPane)
	system.window.document.body.appendChild(TraitBrowser().browserPane)
	system.window.document.body.appendChild(MethodBrowser().browserPane)
	system.window.document.body.appendChild(SystemBrowser().browserPane)
*)
