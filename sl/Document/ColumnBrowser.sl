ColumnBrowser { | browserPane titlePane columnsPane viewerPane columnLists statusPane titleText viewerText statusText |

	createElements { :self :numberOfColumns |
		self.browserPane := 'div'.createElement;
		self.titlePane :=  'div'.createElement;
		self.columnsPane :=  'div'.createElement;
		self.viewerPane := 'div'.createElement;
		self.statusPane := 'div'.createElement;
		self.titleText := 'pre'.createElement;
		self.columnLists := { 'select'.createElement } ! numberOfColumns;
		self.viewerText := 'pre'.createElement;
		self.statusText := 'pre'.createElement;
		self.titlePane.appendChild(self.titleText);
		self.columnsPane.appendChildren(self.columnLists);
		self.viewerPane.appendChild(self.viewerText);
		self.statusPane.appendChild(self.statusText);
		self.browserPane.appendChildren([self.titlePane, self.columnsPane, self.viewerPane, self.statusPane]);
	}

	setAttributes { :self :columnProportions :listSize |
		self.browserPane.setAttribute('class', 'browserPane');
		self.titlePane.setAttribute('class', 'titlePane');
		self.columnsPane.setAttribute('class', 'columnsPane');
		self.viewerPane.setAttribute('class', 'viewerPane');
		self.statusPane.setAttribute('class', 'statusPane');
		columnProportions.size.do { :index |
			| list = self.columnLists[index]; |
			list.size := listSize;
			list.style.setProperties([
				'flex-grow' -> columnProportions[index].asString
			])
		};
		self.viewerText.setAttributes((contentEditable: 'true', spellcheck: 'false'));
	}

	setColumnEntries { :self :index :entries |
		self.columnLists[index].removeAll;
		self.columnLists[index].appendChildren(entries.collect { :each |
			TextOption(each, each)
		})
	}

	setEventHandlers { :self :numberOfColumns :onChange:/2 |
		numberOfColumns.do { :index |
			self.columnLists[index].addEventListener('change', { :event |
				| next = onChange(self, (1 .. index).collect { :each | self.columnLists[each].value }); |
				(index = numberOfColumns).if {
					next.then { :view |
						self.viewerText.textContent := view.asString
					}
				} {
					self.viewerText.textContent := '';
					(numberOfColumns - index - 1).do { :each |
						self.columnLists[index + each + 1].removeAll
					};
					self.setColumnEntries(index + 1, next)				}
			})
		};
		self.viewerText.addEventListener('keydown', { :event |
			(event.ctrlKey & { event.key = 'Enter' }).ifTrue {
				('{ ' ++ event.target.textContent ++ ' }.play').eval
			};
			(event.ctrlKey & { event.key = '.' }).ifTrue {
				workspace::clock.clear;
				system.defaultScSynth.reset;
			};
		})
	}

	setStatus { :self :aString |
		self.statusText.textContent := aString
	}

	setTitle { :self :aString |
		self.titleText.textContent := aString
	}

}

+ String {

	ColumnBrowser { :title :columnProportions :onChange:/2 |
		| numberOfColumns = columnProportions.size, browser = newColumnBrowser(); |
		browser.createElements(numberOfColumns);
		browser.setTitle(title);
		browser.setColumnEntries(1, onChange(browser, []));
		browser.columnLists[1].selectedIndex(-1);
		browser.setAttributes(columnProportions, 6);
		browser.setEventHandlers(numberOfColumns, onChange:/2);
		browser
	}

}

+ Void {

	MethodBrowser {
		| methodNames = system.allMethods.collect(qualifiedName:/1).IdentitySet.Array.sorted ; |
		ColumnBrowser('MethodBrowser', [3, 1], { :browser :path |
			path.size.caseOf([
				0 -> { methodNames },
				1 -> { system.methodTraits(path[1]) ++ system.methodTypes(path[1]) },
				2 -> { system.traitOrType(path[2]).methodDictionary[path[1]].definition }
			])
		})
	}

	CategoryBrowser {
		|
			typeNames = system.typeDictionary.keys.sorted,
			categoryNames = typeNames.collect { :each | system.categoryOf(each) }.IdentitySet.Array.sorted,
			methodSet = nil;
		|
		ColumnBrowser('CategoryBrowser', [1, 1, 3], { :browser :path |
			path.size.caseOf([
				0 -> {
					browser.setStatus('');
					categoryNames
				},
				1 -> {
					browser.setStatus('');
					system.categoryDictionary[path[1]].select { :each | system.isTypeName(each) }.Array.sorted
				},
				2 -> {
					browser.setStatus(system.typeTraits(path[2]).joinSeparatedBy(', '));
					methodSet := system.typeMethodSet(path[2]).select { :each | each.origin.name ~= 'Object' };
					methodSet.collect(qualifiedName:/1).Array.sorted
				},
				3 -> {
					| method = methodSet.detect { :each | each.qualifiedName = path[3] }; |
					browser.setStatus(method.origin.name);
					method.definition
				}
			])
		})
	}

	SystemBrowser {
		| typeNames = system.typeDictionary.keys.sorted, methodSet = nil; |
		ColumnBrowser('SystemBrowser', [1, 3], { :browser :path |
			path.size.caseOf([
				0 -> {
					browser.setStatus('');
					typeNames
				},
				1 -> {
					browser.setStatus(system.typeTraits(path[1]).joinSeparatedBy(', '));
					methodSet := system.typeMethodSet(path[1]).select { :each | each.origin.name ~= 'Object' };
					methodSet.collect(qualifiedName:/1).Array.sorted
				},
				2 -> {
					| method = methodSet.detect { :each | each.qualifiedName = path[2] }; |
					browser.setStatus(method.origin.name);
					method.definition
				}
			])
		})
	}

	TraitBrowser {
		| traitNames = system.traitDictionary.keys.sorted; |
		ColumnBrowser('TraitBrowser', [1, 3], { :browser :path |
			path.size.caseOf([
				0 -> {
					browser.setStatus('');
					traitNames
				},
				1 -> {
					browser.setStatus(system.traitTypes(path[1]).joinSeparatedBy(', '));
					system.traitDictionary[path[1]].methodDictionary.keys.sorted
				},
				2 -> {
					system.traitDictionary[path[1]].methodDictionary[path[2]].definition
				}
			])
		})
	}

	TypeBrowser {
		| typeNames = system.typeDictionary.keys.sorted; |
		ColumnBrowser('TypeBrowser', [1, 3], { :browser :path |
			path.size.caseOf([
				0 -> {
					browser.setStatus('');
					typeNames
				},
				1 -> {
					browser.setStatus(system.typeTraits(path[1]).joinSeparatedBy(', '));
					system.typeDictionary[path[1]].methodDictionary.keys.sorted
				},
				2 -> {
					system.typeDictionary[path[1]].methodDictionary[path[2]].definition
				}
			])
		})
	}

	SmallHoursProgramBrowser {
		ColumnBrowser('SmallHoursProgramBrowser', [1, 1, 3], { :browser :path |
			path.size.caseOf([
				0 -> {
					smallHoursProgramCategories()
				},
				1 -> {
					smallHoursProgramAuthors(path[1])
				},
				2 -> {
					smallHoursProgramNames(path[1], path[2])
				},
				3 -> {
					smallHoursProgramFetch(path[1], path[2], path[3])
				}
			])
		})
	}

}

(*
	system.window.document.body.appendChild(CategoryBrowser().browserPane)
	system.window.document.body.appendChild(MethodBrowser().browserPane)
	system.window.document.body.appendChild(SystemBrowser().browserPane)
	system.window.document.body.appendChild(TypeBrowser().browserPane)
	system.window.document.body.appendChild(TraitBrowser().browserPane)
	system.window.document.body.appendChild(SmallHoursProgramBrowser().browserPane)

	loadSmallHoursPrograms()

*)
 + Void {

	 loadSmallHoursPrograms {
		 system.window.fetchString('./text/smallhours-programs.text').then { :aString |
			 workspace::smallHoursPrograms := aString.lines.select(notEmpty:/1).collect(smallHoursProgramParse:/1)
		 }
	 }

	 smallHoursProgramCategories {
		 workspace::smallHoursPrograms.collect(first:/1).IdentitySet.Array.sorted.reject {
			 :each | each = 'collect'
		 }
	 }

}

+ String {

	 smallHoursProgramParse { :self |
		 self.splitRegExp(RegExp(' - |/'))
	 }

	 smallHoursProgramUrl { :category :author :name |
		 './lib/stsc3/help/' ++ category ++ '/' ++ author ++ ' - ' ++ name
	 }

	 smallHoursProgramFetch { :category :author :name |
		 system.window.fetchString(smallHoursProgramUrl(category, author, name))
	 }

	 smallHoursProgramAuthors { :category |
		 workspace::smallHoursPrograms.select { :each |
			 each.first = category
		 }.collect(second:/1).IdentitySet.Array.sorted
	 }

	 smallHoursProgramNames { :category :author |
		 workspace::smallHoursPrograms.select { :each |
			 each.first = category & {
				 each.second = author
			 }
		 }.collect(third:/1).IdentitySet.Array.sorted
	 }

}
