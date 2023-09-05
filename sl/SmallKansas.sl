@UserEventTarget {

	addEventListener { :self :aString :aProcedure:/1 |
		self.eventListeners.atIfPresentIfAbsent(aString) { :aSet |
			aSet.add(aProcedure:/1)
		} {
			self.eventListeners[aString] := Set([aProcedure:/1])
		}
	}

	dispatchEvent { :self :event |
		self.eventListeners.atIfPresent(event.type) { :aSet |
			aSet.do { :each |
				each.value(event)
			}
		}
	}

}

@View {

	frame { :self :aFrame |
	}

	frameMenuItems { :self |
		[]
	}

	name { :self |
		self.title.replaceStringAll(' ', '')
	}

	outerElement { :self |
		self.typeResponsibility('@View>>outerElement')
	}

	title { :self |
		self.typeOf
	}

}

AnalogueClock : [Object, View] { | clockPane hourHand minuteHand secondHand |

	createElements { :self |
		|(
			svg = 'svg'.createSvgElement (
				viewBox: '0 0 200 200',
				preserveAspectRatio: 'xMidYMid meet'
			),
			group = 'g'.createSvgElement (
				transform: 'translate(100, 100) scale(1, -1)'
			)
		)|
		self.clockPane := 'div'.createElement;
		self.hourHand := 'line'.createSvgElement (
			x1: '0',
			y1: '0',
			x2: '0',
			y2: '50',
			stroke: 'cornflowerblue',
			'stroke-width': '2'
		);
		self.minuteHand := 'line'.createSvgElement (
			x1: '0',
			y1: '0',
			x2: '0',
			y2: '80',
			stroke: 'coral',
			'stroke-width': '2'
		);
		self.secondHand := 'line'.createSvgElement (
			x1: '0',
			y1: '0',
			x2: '0',
			y2: '80',
			stroke: 'darkseagreen'
		);
		group.appendChildren([
			'circle'.createSvgElement (
				cx: '0',
				cy: '0',
				r: '90',
				fill: 'aquamarine'
			),
			self.hourHand,
			self.minuteHand,
			self.secondHand
		]);
		group.appendChildren([1 .. 12].collect { :each |
			|(
				theta = each - 3 / 12 * 2 * pi,
				point = PolarPoint(80, theta),
				text = 'text'.createSvgElement (
					x: point.x,
					y: point.y,
					'font-size': '11pt',
					'text-anchor': 'middle',
					'dominant-baseline': 'middle',
					transform: 'scale(1, -1)'
				)
			)|
			text.textContent := each.printString;
			text
		});
		svg.appendChild(group);
		self.clockPane.appendChild(svg)
	}

	initialize { :self |
		self.createElements;
		self.tick;
		self
	}

	moveHourHand { :self :fractionalHour |
		| theta = fractionalHour - 3 / 12 * 2 * pi; |
		self.hourHand.p2 := PolarPoint(55, theta.negated)
	}

	moveMinuteHand { :self :minute |
		| theta = minute - 15 / 60 * 2 * pi; |
		self.minuteHand.p2 := PolarPoint(80, theta.negated)
	}

	moveSecondHand { :self :minute |
		| theta = minute - 15 / 60 * 2 * pi; |
		self.secondHand.p2 := PolarPoint(85, theta.negated)
	}

	outerElement { :self |
		self.clockPane
	}

	tick { :self |
		| dateAndTime = system.Date; |
		self.moveHourHand(dateAndTime.hour + (dateAndTime.minute / 60));
		self.moveMinuteHand(dateAndTime.minute);
		self.moveSecondHand(dateAndTime.second)
	}

	title { :self |
		'Analogue Clock'
	}

}

+Void {

	AnalogueClock {
		newAnalogueClock().initialize
	}

}

ColourChooser : [Object, View] { | colourChooserPane colourInput |

	hexString { :self |
		self.colourInput.getAttribute('value')
	}

	initialize { :self :initialColour :onSelect:/1 |
		self.colourChooserPane := 'div'.createElement (
			class: 'colourChooser'
		);
		self.colourInput := 'input'.createElement (
			class: 'colourInput',
			type: 'color',
			value: initialColour.hexString
		);
		self.colourChooserPane.appendChild(self.colourInput);
		self.colourInput.addEventListener('input') { :event |
			onSelect(event.target.value.parseHexColour)
		};
		self
	}

	outerElement { :self |
		self.colourChooserPane
	}

	title { :self |
		'Colour Chooser'
	}

}

+Colour {

	ColourChooser { :self :onSelect:/1 |
		newColourChooser().initialize(self, onSelect:/1)
	}

}

+Procedure {

	ColourChooser { :self |
		Colour(0.5, 0.5, 0.5, 0.5).ColourChooser(self)
	}

}

ColumnBrowser : [Object, View] { | browserPane columnsPane previewPane textEditor numberOfColumns columnLists statusPane statusText title |

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
		self.textEditor := TextEditor(
			'ColumnBrowserTextEditor', mimeType, ''
		);
		self.columnLists := (1 .. self.numberOfColumns).collect { :index |
			ListChooser(withFilter & { index = 1 }, nil, listSize)
		};
		columnProportions.size.do { :index |
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

	initialize { :self :title :mimeType :withFilter :withStatus :columnProportions :clientKeyBindings :onAccept:/1 :onChange:/2 |
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
			(self.numberOfColumns - index - 1).do { :each |
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
		self.numberOfColumns.do { :index |
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

+String {

	ColumnBrowser { :self :mimeType :withFilter :withStatus :columnProportions :clientKeyBindings :onAccept:/1 :onChange:/2 |
		newColumnBrowser().initialize(
			self,
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

Frame : [Object, UserEventTarget] { | framePane titlePane closeButton menuButton titleText inMove x y x0 y0 subject eventListeners |

	bringToFront { :self |
		self.zIndex := system::smallKansas.zIndices.max + 1
	}

	close { :self |
		self.dispatchEvent(Event('close'));
		system::smallKansas.removeFrame(self)
	}

	colour { :self :aColour |
		self.framePane.style.setProperty('background-color', aColour.hexString, '')
	}

	createElements { :self |
		self.framePane := 'div'.createElement (
			class: ['framePane', self.subject.typeOf, self.subject.name].unwords
		);
		self.titlePane := 'div'.createElement (
			class: 'titlePane'
		);
		self.closeButton := 'span'.createElement (
			class: 'closeButton'
		);
		self.titleText := 'span'.createElement (
			class: 'titleText'
		);
		self.menuButton := 'span'.createElement (
			class: 'menuButton'
		);
		self.titlePane.appendChildren([
			self.closeButton,
			self.titleText,
			self.menuButton
		]);
		self.framePane.appendChildren([
			self.titlePane,
			self.subject.outerElement
		]);
		self.closeButton.textContent := '×';
		self.menuButton.textContent := '☰';
		self.inMove := false
	}

	font { :self :fontName|
		self.framePane.style.setProperty('--font-family', fontName, '')
	}

	fontSize { :self :fontSize |
		self.framePane.style.setProperty('--font-size', fontSize, '')
	}

	initialize { :self :subject |
		self.subject := subject;
		self.createElements;
		self.setEventHandlers;
		self.title := subject.title;
		self.eventListeners := Map();
		self
	}

	outerElement { :self |
		self.framePane
	}

	menuItems { :self |
		[
			MenuItem('Help', nil) { :event |
				system::smallKansas.helpFor(self.subject.name, event)
			},
			MenuItem('Colour Chooser', nil) { :event |
				system::smallKansas.ColourChooser(self, event)
			},
			MenuItem('Font Menu', nil) { :event |
				system::smallKansas.fontMenuOn(self, true, event)
			},
			MenuItem('Font Size Menu', nil) { :event |
				system::smallKansas.fontSizeMenuOn(self, true, event)
			}
		]
	}

	moveTo { :self :x :y |
		self.x := x;
		self.y := y;
		self.framePane.style.setProperty('left', x.asString ++ 'px', '');
		self.framePane.style.setProperty('top', y.asString ++ 'px', '')
	}

	setEventHandlers { :self |
		|(
			pointerBegin = { :event |
				| titleRect = event.target.getBoundingClientRect; |
				event.stopPropagationAndPreventDefault;
				self.bringToFront;
				event.target.setPointerCapture(event.pointerId);
				self.inMove := true;
				self.x0 := event.x - titleRect.x;
				self.y0 := event.y - titleRect.y
			},
			pointerMove = { :event |
				self.inMove.ifTrue {
					self.moveTo(
						event.x - self.x0,
						event.y- self.y0
					)
				}
			},
			pointerEnd = { :event |
				event.target.releasePointerCapture(event.pointerId);
				self.inMove := false
			}
		)|
		self.closeButton.addEventListener('click') { :event |
			self.close
		};
		self.menuButton.addEventListener('click') { :event |
			system::smallKansas.menu('Frame Menu', self.subject.frameMenuItems ++ self.menuItems, true, event)
		};
		self.titlePane.addEventListener('contextmenu') { :event |
			(* ... *)
		};
		self.titlePane.addEventListener('pointerdown', pointerBegin);
		self.titlePane.addEventListener('pointermove', pointerMove, (capture: true, passive: true));
		self.titlePane.addEventListener('pointercancel', pointerEnd);
		self.titlePane.addEventListener('pointerup', pointerEnd);
		self.titlePane.addEventListener('pointerout', pointerEnd);
		self.framePane.addEventListener('keydown') { :event |
			event.ctrlKey.ifTrue {
				(event.key = 'Escape').ifTrue {
					self.close
				}
			}
		}

	}

	title { :self |
		self.titleText.textContent
	}

	title { :self :aString |
		self.titleText.textContent := aString
	}

	zIndex { :self |
		self.framePane.style.getPropertyValue('z-index').parseInteger(10)
	}

	zIndex { :self :anInteger |
		self.framePane.style.setProperty('z-index', anInteger.asString, '')
	}

}

+@View {

	Frame { :self |
		newFrame().initialize(self)
	}

}

HelpSystem : [Object] { | helpIndex programIndex programOracle |

	helpAreas { :self |
		['spl', 'sc', 'sk']
	}

	HelpBrowser { :self |
		ColumnBrowser(
			'Help Browser',
			'text/markdown',
			false,
			false,
			[1, 1, 3],
			nil,
			nil,
			{ :browser :path |
				path.size.caseOf([
					0 -> {
						self.helpAreas
					},
					1 -> {
						self.helpKind(path[1])
					},
					2 -> {
						self.helpNames(path[1], path[2])
					},
					3 -> {
						self.helpFetch(path)
					}
				])
			}
		)
	}

	helpFetch { :self :path |
		path.ifNotNil {
			| url = self.helpUrl(path[1], path[2], path[3]); |
			('HelpSystem>>helpFetch: ' ++ path.joinSeparatedBy('/')).postLine;
			system.window.fetchString(url, (cache: 'no-cache'))
		}
	}

	helpFetchFor { :self :subject |
		self.helpFetch(self.helpFind(subject))
	}

	helpFind { :self :name |
		self.helpIndex.detectIfNone { :each |
			each[3] = name
		} {
			self.warning('helpFind: no help for: ' ++ name);
			nil
		}
	}

	helpKind { :self :area |
		['doc', 'help']
	}

	helpNames { :self :area :kind |
		self.helpIndex.select { :each |
			each[1] = area & {
				each[2] = kind
			}
		}.collect(third:/1).Set.Array.sorted
	}

	helpProject { :self :area |
		area.caseOf([
			'sc' -> { 'stsc3' },
			'sk' -> { 'spl' },
			'spl' -> { 'spl' }
		])
	}

	helpUrl { :self :area :kind :name |
		['./lib/', self.helpProject(area), '/', kind, '/', area, '/', name, '.help.sl'].join
	}

	parseHelpIndex { :self :aString |
		aString.lines.select(notEmpty:/1).collect { :each |
			| [kind, area, name] = each.replaceString('.help.sl', '').splitRegExp(RegExp('/')); |
			[area, kind, name]
		}
	}

	parseProgramIndex { :self :aString |
		aString.lines.select(notEmpty:/1).collect { :each |
			each.replaceString('.sl', '').splitRegExp(RegExp(' - |/'))
		}
	}

	programAuthors { :self :category |
		self.programIndex.select { :each |
			each[1] = category
		}.collect(second:/1).Set.Array.sorted
	}

	ProgramBrowser { :self :path |
		ColumnBrowser(
			'Program Browser',
			'text/plain',
			false,
			false,
			[1, 1, 3],
			nil,
			nil,
			{ :browser :path |
				path.size.caseOf([
					0 -> {
						self.programCategories
					},
					1 -> {
						self.programAuthors(path[1])
					},
					2 -> {
						self.programNames(path[1], path[2])
					},
					3 -> {
						self.programFetch(path[1], path[2], path[3])
					}
				])
			}
		).setPath(path)
	}

	ProgramBrowser { :self |
		self.ProgramBrowser([])
	}

	programCategories { :self |
		self.programIndex.collect(first:/1).Set.Array.sorted.reject { :each |
			each = 'collect'
		}
	}

	programFetch { :self :category :author :name |
		system.window.fetchString(self.programUrl(category, author, name), (cache: 'no-cache'))
	}

	programNames { :self :category :author |
		self.programIndex.select { :each |
			each[1] = category & {
				each[2] = author
			}
		}.collect(third:/1).sorted
	}

	ProgramOracle { :self |
		self.ProgramBrowser(self.programOracle.atRandom)
	}

	programUrl { :self :category :author :name |
		['./lib/stsc3/help/', category, '/', author, ' - ', name, '.sl'].join
	}

	requireLibraries { :self |
		[
			system.requireLibraryItem('helpIndex').then { :aString |
				self.helpIndex := self.parseHelpIndex(aString)
			},
			system.requireLibraryItem('programIndex').then { :aString |
				self.programIndex := self.parseProgramIndex(aString)
			},
			system.requireLibraryItem('programOracle').then { :aString |
				self.programOracle := self.parseProgramIndex(aString)
			}
		].Promise.then { :unused |
			self
		}
	}

}

+Void {

	HelpSystem {
		newHelpSystem().requireLibraries
	}

}

Inspector : [Object, View] { | inspectorPane inspectorList |

	addInspector { :self :aValue :index |
		|(
			maxStringSize = 32,
			maxIndices = 2048,
			fields = aValue.inspectAsArray(maxIndices),
			listChooser = ListChooser(false, aValue.printStringConcise(maxStringSize), 6),
			select = listChooser.select
		)|
		listChooser.setEntries(fields.collect { :each |
			each.key ++ ': ' ++ each.value.printStringConcise(maxStringSize)
		});
		select.deselect;
		select.addEventListener('change') { :event |
			fields.atIfPresent(select.selectedIndex + 1) { :item |
				self.removeInspectorsFrom(index + 1);
				self.addInspector(item.value, index + 1)
			}
		};
		self.inspectorPane.appendChild(listChooser.listChooserPane);
		self.inspectorList.add(listChooser)
	}

	initialize { :self :aValue |
		self.inspectorPane := 'div'.createElement (
			class: 'inspectorPane'
		);
		self.inspectorList([]);
		self.addInspector(aValue, 1);
		self
	}

	removeInspectorsFrom { :self :index |
		(index <= self.inspectorList.size).ifTrue {
			self.inspectorList.removeLast(self.inspectorList.size - index + 1).do { :each |
				each.listChooserPane.remove
			}
		}
	}

	outerElement { :self |
		self.inspectorPane
	}

}

+@Object {

	Inspector { :self |
		newInspector().initialize(self)
	}

	inspect { :self |
		system::smallKansas.inspectorOn(self, nil)
	}

}

ListChooser : [Object] { | listChooserPane filterText select entries ignoreCase |

	applyFilter { :self |
		|(
			caseRule:/1 = self.ignoreCase.if {
				asLowercase:/1
			} {
				identity:/1
			},
			filter = self.filterText.ifNil {
				{
					true
				}
			} {
				| matchString = self.filterText.value.caseRule; |
				{ :aString |
					aString.caseRule.includesSubstring(matchString)
				}
			}
		)|
		self.select.removeAll;
		self.select.appendChildren(self.entries.select(filter).collect { :each |
			TextOption(each)
		});
		self.select.deselect
	}

	initialize { :self :withFilter :titleText :listSize |
		self.ignoreCase := true;
		self.listChooserPane := 'div'.createElement (
			class: 'listChooserPane'
		);
		titleText.ifNotNil {
			| title = TextButton(titleText, (class: 'listTitle')); |
			self.listChooserPane.appendChild(title)
		};
		withFilter.if {
			self.filterText := TextInput('', (class: 'filterText'));
			self.filterText.addEventListener('change') { :event |
				self.applyFilter
			};
			self.listChooserPane.appendChild(self.filterText)
		} {
			self.filterText := nil
		};
		self.select := 'select'.createElement;
		self.select.size := listSize;
		self.listChooserPane.appendChild(self.select);
		self
	}

	setEntries { :self :entries |
		self.entries := entries;
		self.applyFilter
	}

}

+Boolean {

	ListChooser { :self :title :listSize |
		newListChooser().initialize(self, title, listSize)
	}

}

MenuItem : [Object] { | name accessKey onSelect |

	accessKeyDislayText { :self |
		self.accessKey.ifNil {
			''
		} {
			' (' ++ self.accessKey ++ ')'
		}
	}

	displayText { :self |
		self.name ++ self.accessKeyDislayText
	}

}

+String {

	MenuItem { :self :accessKey :onSelect |
		newMenuItem().initializeSlots(self, accessKey, onSelect)
	}

}

Menu : [Object, View] { | frame menuPane listPane menuList title isTransient |

	createElements { :self |
		self.menuPane := 'div'.createElement (
			class: 'menuPane'
		);
		self.listPane := 'div'.createElement (
			class: 'listPane'
		);
		self.menuList := 'select'.createElement;
		self.listPane.appendChild(self.menuList);
		self.menuPane.appendChild(self.listPane)
	}

	frameMenuItems { :self |
		[
			self.isTransient.if {
				MenuItem('Mark Not Transient', nil) { :unusedEvent |
					self.isTransient := false
				}
			} {
				MenuItem('Mark Transient', nil) { :unusedEvent |
					self.isTransient := true
				}
			}
		]
	}

	initialize { :self :title :entries |
		self.title := title;
		self.isTransient := false;
		self.createElements;
		self.setEntries(entries);
		self
	}

	outerElement { :self |
		self.menuPane
	}

	setEntries { :self :entries |
		self.menuList.removeAllChildren;
		self.menuList.size := entries.size;
		entries.collect { :menuItem |
			|(
				listItem = TextOption(menuItem.displayText),
				pointerBegin = { :event |
					event.stopPropagationAndPreventDefault;
					menuItem.onSelect . (event);
					self.isTransient.ifTrue {
						self.frame.ifNotNil {
							self.frame.close
						}
					}
				}
			)|
			self.menuList.appendChild(listItem);
			listItem.addEventListener('pointerdown', pointerBegin)
		}
	}

}

+String {

	Menu { :self :entries |
		newMenu().initialize(self, entries)
	}

}

PngViewer : [Object, View] { | pngPane title pngData pngUrl |

	createElements { :self |
		| img = 'img'.createElement; |
		self.pngPane := 'div'.createElement (
			class: 'pngPane'
		);
		img.src := self.pngUrl;
		self.pngPane.appendChild(img)
	}

	frame { :self :aFrame |
		aFrame.addEventListener('close') { :event |
			self.pngUrl.revokeObjectURL
		}
	}

	initialize { :self :title :pngData |
		self.title := title;
		self.pngData := pngData;
		self.pngUrl := pngData.createObjectURL;
		self.createElements;
		self
	}

	outerElement { :self |
		self.pngPane
	}

}


+String {

	PngViewer { :self :pngData |
		newPngViewer().initialize(self, pngData)
	}

}

SmallKansas : [Object] { | container frameSet midiAccess helpSystem |

	addFrameWithAnimator { :self :subject :event :delay :aProcedure:/0 |
		|(
			timerId = aProcedure:/0.evaluateEveryMilliseconds(delay.asSeconds * 1000),
			frame = self.addFrame(subject, event)
		)|
		frame.addEventListener('close') { :unusedEvent |
			timerId.cancel
		};
		frame
	}

	addFrame { :self :subject :event |
		| frame = Frame(subject); |
		subject.frame := frame;
		frame.zIndex := self.zIndices.max + 1;
		event.ifNotNil {
			frame.moveTo(event.x, event.y)
		};
		self.frameSet.add(frame);
		self.container.appendChild(frame.outerElement);
		frame
	}

	AnalogueClock { :self :event |
		|(
			clock = AnalogueClock(),
			frame = self.addFrameWithAnimator(clock, event, 1) {
				clock.tick
			}
		)|
		frame
	}

	browserOn { :self :path :event |
		system.isTypeName(path[1]).if {
			self.addFrame(TypeBrowser().setPath(path), event)
		} {
			system.isTraitName(path[1]).if {
				self.addFrame(TraitBrowser().setPath(path), event)
			} {
				self.warning('browserOn: not type or trait: ' ++ path[1])
			}
		}
	}

	CategoryBrowser { :self :event |
		self.addFrame(CategoryBrowser(), event)
	}

	colour { :self :aColour |
		self.container.style.setProperty('background-color', aColour.hexString, '')
	}

	ColourChooser { :self :subject :event |
		self.addFrame(ColourChooser({ :aColour |
			subject.colour(aColour)
		}), event)
	}

	dialog { :self :subject :event |
		| dialog = 'dialog'.createElement; |
		dialog.appendChild(subject.outerElement);
		dialog.style.setProperty('left', event.x.asString ++ 'px', '');
		dialog.style.setProperty('top', event.y.asString ++ 'px', '');
		self.container.appendChild(dialog);
		subject.dialog(dialog);
		dialog.showModal;
		dialog
	}

	DigitalClock { :self :event |
		|(
			getTime = {
				system.Date.localeTimeString('en-US')
			},
			textEditor = TextEditor('Digital Clock', 'text/plain', getTime()),
			frame = self.addFrameWithAnimator(textEditor, event, 1) {
				textEditor.setEditorText(getTime())
			}
		)|
		textEditor.editable := false;
		frame.outerElement.style.setProperties((height: '1em', width: '18em'));
		frame
	}

	font { :self |
		self.container.style.getPropertyValue('--font-family')
	}

	font { :self :fontName|
		self.container.style.setProperty('--font-family', fontName, '')
	}

	fontMenuEntriesOn { :self :subject |
		['APL333', 'Los Altos', 'Monaco', 'Parc Place'].collect { :fontName |
			MenuItem(fontName, nil) { :unusedEvent |
				subject.font := fontName
			}
		}
	}

	fontMenuOn { :self :subject :isTransient :event |
		self.menu('Font Menu', self.fontMenuEntriesOn(subject), isTransient, event)
	}

	fontSize { :self :fontSize |
		self.container.style.setProperty('--font-size', fontSize.asString, '')
	}

	fontSizeMenuEntriesOn { :self :subject |
		['8pt', '10pt', '12pt', '16pt', '24pt', '32pt'].collect { :fontSize |
			MenuItem(fontSize, nil) { :unusedEvent |
				subject.fontSize := fontSize
			}
		}
	}

	fontSizeMenuOn { :self :subject :isTransient :event |
		self.menu('Font Size Menu', self.fontSizeMenuEntriesOn(subject), isTransient, event)
	}

	getHelp { :self :helpProcedure:/1 |
		(*
			The HelpSystem requires resources that are acquired asynchronously.
			SmallKansas>>getHelp checks if the HelpSystem is acquired, else it acquires it.
			Eventually the helpProcedure is run with a valid HelpSystem.
		*)
		self.helpSystem.ifNil {
			HelpSystem().then { :helpSystem |
				self.helpSystem := helpSystem;
				helpProcedure(self.helpSystem)
			}
		} {
			helpProcedure(self.helpSystem)
		}
	}

	helpFor { :self :subject :event |
		self.getHelp { :help |
			help.helpFetchFor(subject).then { :aString |
				self.addFrame(
					TextEditor('HelpViewer', 'text/markdown', aString),
					event
				)
			}
		}
	}

	HelpBrowser { :self :event |
		self.getHelp { :help |
			self.addFrame(help.HelpBrowser, event)
		}
	}

	implementorsOf { :self :subject :event |
		|(
			bracketedSubject = '>>' ++ subject ++ ':/',
			methodSignatures = system.allMethods.collect(signature:/1).select { :each |
				each.includesSubstring(bracketedSubject)
			}.Set.Array.sorted
		)|
		self.addFrame(MethodSignatureBrowser(methodSignatures, false), event)
	}

	inspectorOn { :self :aValue :event |
		self.addFrame(Inspector(aValue), event)
	}

	initialize { :self |
		self.container := 'smallKansas'.getElementById;
		self.frameSet := Set();
		self.container.addEventListener('contextmenu') { :event |
			(event.target == self.container).ifTrue {
				event.preventDefault;
				self.WorldMenu(true, event)
			}
		};
		self.initializeLibraryItems;
		self
	}

	initializeLibraryItems { :self |
		system.addLibraryItem(
			LibraryItem(
				'helpIndex',
				'https://rohandrape.net/sw/jssc3/text/smallhours-help.text',
				'text/plain',
				identity:/1
			)
		);
		system.addLibraryItem(
			LibraryItem(
				'jiMeta',
				'https://rohandrape.net/sw/hmt/data/json/scala-meta-au.json',
				'application/json',
				{ :item |
					system.requireLibraryItem('jiScala').then { :jiScala |
						item.collect { :anArray |
							anArray.collect { :aName |
								jiScala[aName]
							}.select(notNil:/1)
						}
					}
				}
			)
		);
		system.addLibraryItem(
			LibraryItem(
				'jiScala',
				'https://rohandrape.net/sw/hmt/data/json/scala-ji-tuning.json',
				'application/json',
				{ :item |
					item.collect(JiTuning:/1)
				}
			)
		);
		system.addLibraryItem(
			LibraryItem(
				'programIndex',
				'https://rohandrape.net/sw/jssc3/text/smallhours-programs.text',
				'text/plain',
				identity:/1
			)
		);
		system.addLibraryItem(
			LibraryItem(
				'programOracle',
				'https://rohandrape.net/sw/jssc3/text/smallhours-oracle.text',
				'text/plain',
				identity:/1
			)
		);
		system.addLibraryItem(
			LibraryItem(
				'clsLeitner',
				'https://rohandrape.net/sw/hsc3-data/data/chemistry/json/cls.json',
				'application/json',
				{ :item |
					item.collect(CrystalLatticeStructure:/1)
				}
			)
		)
	}

	initializeMidi { :self :ifPresent:/1 |
		self.midiAccess.ifNil {
			system.window.navigator.requestMidiAccess.thenElse { :midiAccess |
				self.midiAccess := midiAccess;
				ifPresent(midiAccess)
			} { :message |
				self.warning('initializeMidi: no midiAccess: ' + message)
			}
		} {
			ifPresent(self.midiAccess)
		}
	}

	menu { :self :title :entries :isTransient :event |
		|(
			menu = Menu(title, entries),
			frame = self.addFrame(menu, event)
		)|
		menu.isTransient := isTransient;
		frame
	}

	MethodBrowser { :self :event |
		self.addFrame(MethodBrowser(), event)
	}

	MethodSignatureBrowser { :self :event |
		self.addFrame(MethodSignatureBrowser(), event)
	}

	MidiMonitorMenu { :self :event |
		self.initializeMidi { :unusedMidiAcccess |
			|(
				onSelect = { :midiPort :event |
					self.midiMonitorOn(midiPort, event)
				},
				menu = Menu('Midi Monitor Menu', self.midiPortListEntries(onSelect:/2))
			)|
			menu.isTransient := true;
			self.addFrameWithAnimator(menu, event, 1) {
				menu.setEntries(self.midiPortListEntries(onSelect:/2))
			}
		}
	}

	midiMonitorOn { :self :midiPort :event |
		|(
			textEditor = TextEditor('Midi Monitor On ' ++ midiPort.name, 'text/plain', ''),
			messages = [],
			onMidiMessage = { :midiMessageEvent |
				messages.add(midiMessageEvent);
				textEditor.setEditorText(messages.last(25.min(messages.size)).collect { :midi |
					midi.data.asString
				}.unlines)
			},
			frame = self.addFrame(textEditor, event)
		)|
		textEditor.editable := false;
		midiPort.addEventListener('midimessage', onMidiMessage);
		frame.addEventListener('close') { :unusedEvent |
			midiPort.removeEventListener('midimessage', onMidiMessage)
		};
		frame
	}

	MidiPortBrowser { :self |
		ColumnBrowser('Midi Port Browser', 'text/plain', false, false, [1, 1, 3], nil, nil) { :browser :path |
			path.size.caseOf([
				0 -> {
					['input', 'output']
				},
				1 -> {
					self.midiAccess.ports(path[1]).collect(manufacturer:/1).Set.Array
				},
				2 -> {
					self.midiAccess.ports(path[1]).select { :port |
						port.manufacturer = path[2]
					}.collect(name:/1)
				},
				3 -> {
					self.midiAccess.portByName(path[1], path[2], path[3]).asString
				}
			])
		}
	}

	midiPortListEntries { :self :onSelect:/2|
		(self.midiAccess.inputs.ports ++ self.midiAccess.outputs.ports).collect { :midiPort |
			MenuItem(midiPort.type ++ '/' ++ midiPort.name, nil) { :event |
				onSelect(midiPort, event)
			}
		}
	}

	PngViewer { :self :title :png |
		self.addFrame(PngViewer(title, png), nil)
	}

	ProgramBrowser { :self :event |
		self.getHelp { :help |
			self.addFrame(help.ProgramBrowser, event)
		}
	}

	ProgramOracle { :self :event |
		self.getHelp { :help |
			self.addFrame(help.ProgramOracle, event)
		}
	}

	referencesTo { :self :subject :event |
		self.addFrame(
			MethodSignatureBrowser(
				system.methodSourceCodeSearch(subject).collect(signature:/1),
				false
			),
			event
		)
	}

	removeFrame { :self :frame |
		frame.outerElement.remove;
		self.frameSet.remove(frame)
	}

	ScalaJiMetaBrowser { :self :event |
		system.requireLibraryItem('jiMeta').then { :jiMeta |
			self.addFrame(jiMeta.ScalaJiMetaBrowser, event)
		}
	}

	ScalaJiTuningBrowser { :self :event |
		system.requireLibraryItem('jiScala').then { :jiTuning |
			self.addFrame(jiTuning.ScalaJiTuningBrowser, event)
		}
	}

	ScSynthStatus { :self :event |
		|(
			textEditor = TextEditor('ScSynth Status', 'text/html', '---'),
			frame = self.addFrameWithAnimator(textEditor, event, 1) {
				textEditor.setEditorText(
					system.defaultScSynth.isAlive.if {
						system.defaultScSynth.status.asHtmlTable(asString:/1).outerHTML
					} {
						'---'
					}
				)
			}
		)|
		textEditor.editable := false;
		frame.outerElement.style.setProperties((height: '14em', width: '18em'));
		frame
	}

	SvgViewer { :self :title :svg |
		self.addFrame(SvgViewer(title, svg), nil)
	}

	SystemBrowser { :self :event |
		self.addFrame(SystemBrowser(), event)
	}

	TableViewer { :self :title :tableData |
		self.addFrame(TableViewer(title, tableData), nil)
	}

	TraitBrowser { :self :event |
		self.addFrame(TraitBrowser(), event)
	}

	TranscriptViewer { :self :event |
		|(
			transcriptViewer = TranscriptViewer(),
			frame = self.addFrameWithAnimator(transcriptViewer, event, 1) {
				transcriptViewer.update
			}
		)|
		frame
	}

	TypeBrowser { :self :event |
		self.addFrame(TypeBrowser(), event)
	}

	windowMenuEntries { :self |
		self.frameSet.Array.collect { :frame |
			MenuItem(frame.title, nil) { :unusedEvent |
				frame.bringToFront
			}
		}
	}

	WindowMenu { :self :event |
		| menu = Menu('Window Menu', self.windowMenuEntries); |
		self.addFrameWithAnimator(menu, event, 1) {
			menu.setEntries(self.windowMenuEntries)
		}
	}

	WorldMenu { :self :isTransient :event |
		self.menu('World Menu', self.worldMenuEntries, isTransient, event)
	}

	worldMenuEntries { :self |
		[
			MenuItem('About Small Kansas', nil) { :event |
				self.helpFor('Small Kansas', event)
			},
			MenuItem('Analogue Clock', nil) { :event |
				self.AnalogueClock(event)
			},
			MenuItem('Category Browser', nil) { :event |
				self.CategoryBrowser(event)
			},
			MenuItem('ColourChooser', nil) { :event |
				self.ColourChooser(self, event)
			},
			MenuItem('CrystalLatticeStructureBrowser', nil) { :event |
				system.requireLibraryItem('clsLeitner').then { :clsLeitner |
					self.addFrame(CrystalLatticeStructureBrowser(clsLeitner), event)
				}
			},
			MenuItem('CrystalLatticeStructureOracle', nil) { :event |
				system.requireLibraryItem('clsLeitner').then { :clsLeitner |
					| cls = clsLeitner.atRandom, mtx = Projection3().chinese.Matrix33; |
					self.addFrame(SvgViewer(
						'Cls - ' ++ cls.name,
						cls.drawing(0.25) { :each |
							mtx.applyTo(each).xy * 50
						}),
						event
					)
				}
			},
			MenuItem('Digital Clock', nil) { :event |
				self.DigitalClock(event)
			},
			MenuItem('Font Menu', nil) { :event |
				self.fontMenuOn(self, false, event)
			},
			MenuItem('Font Size Menu', nil) { :event |
				self.fontSizeMenuOn(self, false, event)
			},
			MenuItem('Help Browser', nil) { :event |
				self.HelpBrowser(event)
			},
			MenuItem('Method Browser', nil) { :event |
				self.MethodBrowser(event)
			},
			MenuItem('Method Signature Browser', nil) { :event |
				self.MethodSignatureBrowser(event)
			},
			MenuItem('Midi Monitor Menu', nil) { :event |
				self.MidiMonitorMenu(event)
			},
			MenuItem('Midi Port Browser', nil) { :event |
				self.initializeMidi { :unusedMidiAccess |
					self.addFrame(self.MidiPortBrowser, event)
				}
			},
			MenuItem('Program Browser', nil) { :event |
				self.ProgramBrowser(event)
			},
			MenuItem('Program Oracle', nil) { :event |
				self.ProgramOracle(event)
			},
			MenuItem('ScSynth Reset', nil) { :event |
				system::clock.removeAll;
				system.defaultScSynth.reset
			},
			MenuItem('ScSynth Status', nil) { :event |
				self.ScSynthStatus(event)
			},
			MenuItem('Scala Ji Meta Browser', nil) { :event |
				self.ScalaJiMetaBrowser(event)
			},
			MenuItem('Scala Ji Tuning Browser', nil) { :event |
				self.ScalaJiTuningBrowser(event)
			},
			MenuItem('System Browser', nil) { :event |
				self.SystemBrowser(event)
			},
			MenuItem('Trait Browser', nil) { :event |
				self.TraitBrowser(event)
			},
			MenuItem('Transcript Viewer', nil) { :event |
				self.TranscriptViewer(event)
			},
			MenuItem('Type Browser', nil) { :event |
				self.TypeBrowser(event)
			},
			MenuItem('Window Menu', nil) { :event |
				self.WindowMenu(event)
			},
			MenuItem('Workspace', nil) { :event |
				self.addFrame(
					TextEditor('Workspace', 'text/plain', ''),
					event
				)
			}
		]
	}

	zIndices { :self |
		self.frameSet.isEmpty.if {
			[0]
		} {
			self.frameSet.collect(zIndex:/1)
		}
	}

}

+JiTuning {

	htmlView { :self |
		| ratios = self.ratios, div = 'div'.createElement; |
		div.appendChildren([
			[
				[1 .. self.degree],
				ratios,
				ratios.collect { :each |
					each.latticeVectorString(self.limit)
				},
				self.cents.rounded,
				self.integerPitches
			].transpose.asHtmlTable,
			self.latticeDrawing
		]);
		div
	}

	latticeDrawing { :self |
		self.latticeGraph.drawing(1, identity:/1)
	}

	latticeGraph { :self |
		|(
			vertices = self.latticeVertices,
			edges = self.latticeEdges(vertices),
			points = vertices.collect(wilsonLatticeCoordinates:/1) * 4
		)|
		Graph(vertices.size, edges, points, nil)
	}

}

+Graph {

	drawing { :self :scale :derivePoint:/1 |
		|(
			lineWidth = 1,
			points = self.vertexLabels.collect(derivePoint:/1),
			bbox = points.computeBoundingBox.scaleBy(scale),
			lineWidth = 1,
			dots = points.collect { :each |
				'circle'.createSvgElement (
					cx: each.x,
					cy: each.y,
					r: lineWidth * 2,
					fill: 'black'
				)
			},
			lines = self.edges.collect { :each |
				| [i, j] = each; |
				'line'.createSvgElement (
					x1: points[i].x,
					y1: points[i].y,
					x2: points[j].x,
					y2: points[j].y,
					stroke: 'black',
					'stroke-width': lineWidth
				)
			},
			svg = 'svg'.createSvgElement (
				width: bbox.width,
				height: bbox.height,
				viewBox: bbox.viewBoxString(5),
				preserveAspectRatio: 'xMidYMid meet'
			),
			group = 'g'.createSvgElement (
				transform: 'translate(0, ' ++ (bbox.height + (2 * bbox.origin.y)) ++ ') scale(' ++ scale ++ ', -' ++ scale ++ ')'
			)
		)|
		group.appendChildren(dots);
		group.appendChildren(lines);
		svg.appendChild(group);
		svg
	}

}

+Record {

	ScalaJiMetaBrowser { :self |
		ColumnBrowser('Scala Ji Meta Browser', 'text/html', false, false, [1, 4], nil, nil) { :browser :path |
			path.size.caseOf([
				0 -> {
					self.indices
				},
				1 -> {
					self[path[1]].collect(description:/1)
				},
				2 -> {
					self[path[1]].detect { :each |
						each.description = path[2]
					}.htmlView.outerHTML
				}
			])
		}
	}

	ScalaJiTuningBrowser { :self |
		| degrees = self.collect(degree:/1).Set.Array.sorted.collect(asString:/1); |
		ColumnBrowser('Scala Ji Tuning Browser', 'text/html', false, true, [1, 1, 4], nil, nil) { :browser :path |
			path.size.caseOf([
				0 -> {
					browser.setStatus('Degree/Limit/Name');
					degrees
				},
				1 -> {
					browser.setStatus('Degree = ' ++ path[1]);
					self.select { :each |
						each.degree = path[1].parseInteger(10)
					}.collect { :each |
						each.limit
					}.Set.Array.sorted.collect(asString:/1)
				},
				2 -> {
					browser.setStatus(['Degree = ', path[1], ', Limit = ', path[2]].join);
					self.select { :each |
						each.degree = path[1].parseInteger(10) & {
							each.limit = path[2].parseInteger(10)
						}
					}.indices
				},
				3 -> {
					| ji = self[path[3]]; |
					browser.setStatus(ji.description);
					ji.htmlView.outerHTML
				}
			])
		}
	}

}

+Array {

	MethodSignatureBrowser { :self :withFilter |
		| selectedMethod = nil; |
		ColumnBrowser('Method Signature Browser', 'text/plain', withFilter, true, [1], nil) { :accepted |
			selectedMethod.definition := accepted
		} { :browser :path |
			path.size.caseOf([
				0 -> {
					self
				},
				1 -> {
					selectedMethod := system.methodLookupAtSignature(path[1]);
					browser.setStatus(selectedMethod.origin.typeOf);
					selectedMethod.definition
				}
			])
		}
	}

}

+Void {

	SmallKansas {
		newSmallKansas().initialize
	}

	MethodBrowser {
		|(
			methodNames = system.allMethods.collect(qualifiedName:/1).Set.Array.sorted,
			selectedMethod = nil
		)|
		ColumnBrowser('Method Browser', 'text/plain', true, true, [3, 1], nil) { :accepted |
			selectedMethod.definition := accepted
		} { :browser :path |
			path.size.caseOf([
				0 -> {
					methodNames
				},
				1 -> {
					system.methodTraits(path[1]) ++ system.methodTypes(path[1])
				},
				2 -> {
					browser.setStatus(
						system.isTypeName(path[2]).if {
							'Type'
						} {
							'Trait'
						}
					);
					selectedMethod := system.traitOrType(path[2]).methodDictionary[path[1]];
					selectedMethod.definition
				}
			])
		}
	}

	MethodSignatureBrowser {
		MethodSignatureBrowser(
			system.allMethods.collect(signature:/1).Set.Array.sorted,
			true
		)
	}

	CategoryBrowser {
		|(
			typeNames = system.typeDictionary.indicesSorted,
			typeCategoryDictionary = system.categoryDictionary('type'),
			typeCategoryNames = typeCategoryDictionary.indicesSorted,
			methodCategoryDictionary = system.categoryDictionary('method'),
			completeMethodSet = nil,
			methodSet = nil,
			selectedMethod = nil
		)|
		ColumnBrowser('Category Browser', 'text/plain', false, true, [1, 1, 1, 3], nil) { :accepted |
			selectedMethod.definition := accepted
		} { :browser :path |
			path.size.caseOf([
				0 -> {
					browser.setStatus('');
					typeCategoryNames
				},
				1 -> {
					browser.setStatus('');
					typeCategoryDictionary[path[1]].select { :each |
						system.isTypeName(each)
					}.sorted
				},
				2 -> {
					browser.setStatus(system.typeTraits(path[2]).joinSeparatedBy(', '));
					completeMethodSet := system.typeMethodDictionary(path[2]).values.select { :each |
							each.origin.name ~= 'Object'
					};
					completeMethodSet.collect { :each |
						system.categoryOf('method', each.name)
					}.Set.Array.sorted
				},
				3 -> {
					browser.setStatus('');
					methodSet := completeMethodSet.select { :each |
						system.categoryOf('method', each.name) = path[3]
					};
					methodSet.collect(qualifiedName:/1).Array.sorted
				},
				4 -> {
					selectedMethod := methodSet.detect { :each |
						each.qualifiedName = path[4]
					};
					browser.setStatus(selectedMethod.origin.name);
					selectedMethod.definition
				}
			])
		}
	}

	SystemBrowser {
		|(
			typeNames = system.typeDictionary.indicesSorted,
			methodSet = nil,
			selectedMethod = nil
		)|
		ColumnBrowser('System Browser', 'text/plain', false, true, [1, 3], nil) { :accepted |
			selectedMethod.definition := accepted
		} { :browser :path |
			path.size.caseOf([
				0 -> {
					browser.setStatus('');
					typeNames
				},
				1 -> {
					browser.setStatus(system.typeTraits(path[1]).joinSeparatedBy(', '));
					methodSet := system.typeMethodDictionary(path[1]).values.select { :each |
						each.origin.name ~= 'Object'
					};
					methodSet.collect(qualifiedName:/1).Array.sorted
				},
				2 -> {
					selectedMethod := methodSet.detect { :each |
						each.qualifiedName = path[2]
					};
					browser.setStatus(selectedMethod.origin.name);
					selectedMethod.definition
				}
			])
		}
	}

	TraitBrowser {
		| traitNames = system.traitDictionary.indicesSorted; |
		ColumnBrowser('Trait Browser', 'text/plain', false, true, [1, 3], nil, nil) { :browser :path |
			path.size.caseOf([
				0 -> {
					browser.setStatus('');
					traitNames
				},
				1 -> {
					browser.setStatus(system.traitTypes(path[1]).joinSeparatedBy(', '));
					system.traitDictionary[path[1]].methodDictionary.indicesSorted
				},
				2 -> {
					system.traitDictionary[path[1]].methodDictionary[path[2]].definition
				}
			])
		}
	}

	TypeBrowser {
		|(
			typeNames = system.typeDictionary.indicesSorted,
			selectedMethod = nil
		)|
		ColumnBrowser('Type Browser', 'text/plain', false, true, [1, 3], nil) { :accepted |
			selectedMethod.definition := accepted
		} { :browser :path |
			path.size.caseOf([
				0 -> {
					browser.setStatus('');
					typeNames
				},
				1 -> {
					browser.setStatus(system.typeTraits(path[1]).joinSeparatedBy(', '));
					system.typeDictionary[path[1]].methodDictionary.indicesSorted
				},
				2 -> {
					selectedMethod := system.typeDictionary[path[1]].methodDictionary[path[2]];
					browser.setStatus(selectedMethod.origin.name);
					selectedMethod.definition
				}
			])
		}
	}

}

SvgViewer : [Object, View] { | svgPane title svg |

	createElements { :self |
		self.svgPane := 'div'.createElement (
			class: 'svgPane'
		);
		self.svgPane.appendChild(self.svg)
	}

	initialize { :self :title :svg |
		self.title := title;
		self.svg := svg;
		self.createElements;
		self
	}

	outerElement { :self |
		self.svgPane
	}

}

+String {

	SvgViewer { :self :svg |
		newSvgViewer().initialize(self, svg)
	}

}

TableViewer : [Object, View] { | title tablePane |

	createElements { :self :tableData |
		self.tablePane := 'div'.createElement (
			class: 'tablePane'
		);
		self.tablePane.appendChild(
			tableData.asHtmlTable
		)
	}

	initialize { :self :title :tableData |
		self.title := title;
		self.createElements(tableData);
		self
	}

	outerElement { :self |
		self.tablePane
	}

}

+String {

	TableViewer { :self :tableData |
		newTableViewer().initialize(self, tableData)
	}

}

TextEditor : [Object, UserEventTarget, View] { | editorPane editorText mimeType title clientKeyBindings eventListeners |

	addKeyBindings { :self :aCollection |
		self.clientKeyBindings.addAll(aCollection)
	}

	createElements { :self |
		self.editorPane := 'div'.createElement (
			class: 'editorPane'
		);
		self.editorText := (self.mimeType = 'text/plain').if {
			'pre'.createElement
		} {
			'div'.createElement
		};
		self.editorText.setAttributes((
			class: 'editorText',
			contentEditable: 'true',
			spellcheck: 'false'
		));
		self.editorPane.appendChild(self.editorText)
	}

	currentText { :self |
		| text = system.window.getSelectedText; |
		text.isEmpty.ifTrue {
			text := self.editorText.textContent
		};
		text
	}

	currentWord { :self |
		| text = system.window.getSelectedText; |
		text.isEmpty.ifTrue {
			(* This should get the word at point, but it doesn't! *)
			nil
		};
		text
	}

	editable { :self :aBoolean |
		self.editorText.setAttribute('contentEditable', aBoolean.printString)
	}

	initialize { :self :title :mimeType :contents |
		self.title := title;
		self.mimeType := mimeType;
		self.clientKeyBindings := [];
		self.createElements;
		self.setEventHandlers;
		self.setEditorText(contents);
		self.eventListeners := Map();
		self
	}

	insertText { :self :aString |
		aString.insertAtCursor
	}

	keyBindings { :self |
		[
			MenuItem('Accept It', 's') { :event |
				self.dispatchEvent(
					CustomEvent(
						'accept',
						(
							detail: self.editorText.textContent
						)
					)
				)
			},
			MenuItem('Browse It', 'b') { :event |
				system::smallKansas.browserOn([self.currentWord], event)
			},
			MenuItem('Do It', 'd') { :event |
				self.currentText.evaluate
			},
			MenuItem('Help For It', 'h') { :event |
				system::smallKansas.helpFor(self.currentWord.asMethodName, event)
			},
			MenuItem('Implementors Of It', 'm') { :event |
				system::smallKansas.implementorsOf(self.currentWord.asMethodName, event)
			},
			MenuItem('Inspect It', 'i') { :event |
				system::smallKansas.inspectorOn(self.currentWord.evaluate, event)
			},
			MenuItem('Play It', 'Enter') { :event |
				('{ ' ++ self.currentText ++ ' }.play').evaluate
			},
			MenuItem('Print It', 'p') { :event |
				self.insertText(' ' ++ self.currentText.evaluate.asString)
			},
			MenuItem('References To It', nil) { :event |
				system::smallKansas.referencesTo(self.currentWord.asMethodName, event)
			},
			MenuItem('Reset Synthesiser', '.') { :event |
				system::clock.removeAll;
				system.defaultScSynth.reset
			}
		] ++ self.clientKeyBindings.Array
	}

	outerElement { :self |
		self.editorPane
	}

	setEventHandlers { :self |
		self.editorText.addEventListener('contextmenu') { :event |
			event.preventDefault;
			self.textEditorMenu(event)
		};
		self.editorText.addEventListener('keydown') { :event |
			|(
				bindingsArray = self.keyBindings.collect { :menuItem |
					menuItem.accessKey -> {
						event.preventDefault;
						menuItem.onSelect . (nil)
					}
				}
			)|
			event.ctrlKey.ifTrue {
				event.key.caseOfOtherwise(
					bindingsArray,
					{ :key | nil }
				)
			}
		}
	}

	setEditorText { :self :aString |
		self.mimeType.caseOfOtherwise([
			'text/html' -> {
				self.editorText.innerHTML := aString
			},
			'text/markdown' -> {
				self.editorText.innerHTML := aString.markdownToHtml
			},
			'text/plain' -> {
				self.editorText.textContent := aString
			}
		]) {
			self.warning('setEditorText: unkown mimeType: ' ++ self.mimeType)
		}
	}

	textEditorMenu { :self :event |
		system::smallKansas.menu(
			'Text Editor Menu',
			self.keyBindings,
			true,
			event
		)
	}

}

+String {

	TextEditor { :self :mimeType :contents |
		newTextEditor().initialize(self, mimeType, contents)
	}

}


TranscriptViewer : [Object, View] { | textEditor entryCount |

	initialize { :self |
		self.textEditor := TextEditor('', 'text/plain', '');
		self.entryCount := 0;
		self
	}

	outerElement { :self |
		self.textEditor.outerElement
	}

	update { :self |
		(self.entryCount ~= system.transcript.entries.size).ifTrue {
			self.entryCount := system.transcript.entries.size;
			self.textEditor.setEditorText(system.transcript.String)
		}
	}

}

+Void {

	TranscriptViewer {
		newTranscriptViewer().initialize
	}

}

+String {

	TextButton { :self :attributeDictionary |
		| button = 'button'.createElement(attributeDictionary); |
		button.innerText := self;
		button
	}

	TextInput { :self :attributeDictionary |
		| input = 'input'.createElement(attributeDictionary); |
		input.setAttributes((
			type: 'text',
			value: self
		));
		input
	}

	TextListItem { :self |
		| listItem = 'li'.createElement; |
		listItem.textContent := self;
		listItem
	}

	TextOption { :self |
		TextOption(self, self)
	}

	TextOption { :self :value |
		| option = 'option'.createElement; |
		option.text := self.isEmpty.if {
			'Unspecified*'
		} {
			self
		};
		option.value := value;
		option
	}

}

CrystalLatticeStructure : [Object] { | name description atoms bonds |

	drawing { :self :scale :projection:/1 |
		self.graph.drawing(scale) { :each |
			each.second.projection
		}
	}

	graph { :self |
		Graph(self.atoms.size, self.bonds, self.atoms, nil)
	}

	summary { :self |
		|(
			container = 'div'.createElement,
			description = 'p'.createElement,
			projectionsA = 'p'.createElement,
			projectionsB = 'p'.createElement,
			scaledDrawing = { :projection:/1 |
				self.drawing(0.25) { :each |
					each.projection * 50
				}
			}
		)|
		description.textContent := self.description;
		projectionsA.appendChildren([
			scaledDrawing(xy:/1),
			scaledDrawing(yz:/1),
			scaledDrawing(xz:/1)
		]);
		projectionsB.appendChildren([
			scaledDrawing(Projection3().chinese.procedure),
			scaledDrawing(Projection3().isometric.procedure)
		]);
		container.appendChildren([
			description,
			projectionsA,
			projectionsB
		]);
		container
	}

}

+Record {

	CrystalLatticeStructure { :self |
		newCrystalLatticeStructure().initializeSlots(
			self::name,
			self::description,
			self::vertexLabels.withCollect(self::vertexCoordinates) { :label :coordinate |
				[label, coordinate.Vector3]
			},
			self::edges.collect { :item |
				item.collect { :each |
					each + 1
				}
			}
		)
	}

}

+Array {

	CrystalLatticeStructureBrowser { :self |
		ColumnBrowser('Crystal Lattice Structure Browser', 'text/html', false, false, [1], nil, nil) { :browser :path |
			path.size.caseOf([
				0 -> {
					self.collect(name:/1)
				},
				1 -> {
					| cls = self.detect { :each | each.name = path[1] }; |
					cls.summary.outerHTML
				}
			])
		}
	}

}
