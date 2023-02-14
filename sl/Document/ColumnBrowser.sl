ColumnBrowser : [Object] { | browserPane columnsPane viewerPane columnLists statusPane viewerText statusText title |

	createElements { :self :numberOfColumns |
		self.browserPane := 'div'.createElement;
		self.columnsPane :=  'div'.createElement;
		self.viewerPane := 'div'.createElement;
		self.statusPane := 'div'.createElement;
		self.columnLists := { 'select'.createElement } ! numberOfColumns;
		self.viewerText := 'pre'.createElement;
		self.statusText := 'pre'.createElement;
		self.columnsPane.appendChildren(self.columnLists);
		self.viewerPane.appendChild(self.viewerText);
		self.statusPane.appendChild(self.statusText);
		self.browserPane.appendChildren([
			self.columnsPane,
			self.viewerPane,
			self.statusPane
		]);
	}

	outerElement { :self |
		self.browserPane
	}

	setAttributes { :self :columnProportions :listSize |
		self.browserPane.setAttribute('class', 'browserPane');
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

	setEntries { :self :columnIndex :entries |
		self.columnLists[columnIndex].removeAll;
		self.columnLists[columnIndex].appendChildren(entries.collect { :each |
			TextOption(each, each)
		})
	}

	setEventHandlers { :self :numberOfColumns :onChange:/2 |
		numberOfColumns.do { :index |
			self.columnLists[index].addEventListener('change', { :unusedEvent |
				|
					next = onChange(self, (1 .. index).collect { :each |
						self.columnLists[each].value
					});
				|
				(index = numberOfColumns).if {
					next.then { :view |
						self.viewerText.textContent := view.asString
					}
				} {
					self.viewerText.textContent := '';
					(numberOfColumns - index - 1).do { :each |
						self.columnLists[index + each + 1].removeAll
					};
					self.setEntries(index + 1, next)				}
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

}

+ String {

	ColumnBrowser { :title :columnProportions :onChange:/2 |
		| numberOfColumns = columnProportions.size, browser = newColumnBrowser(); |
		browser.createElements(numberOfColumns);
		browser.setEntries(1, onChange(browser, []));
		browser.columnLists[1].selectedIndex(-1);
		browser.setAttributes(columnProportions, 6);
		browser.setEventHandlers(numberOfColumns, onChange:/2);
		browser.title := title;
		browser
	}

}
