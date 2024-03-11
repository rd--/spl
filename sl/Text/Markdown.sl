Markdown : [Object] { | sourceString linesOrNil htmlOrNil parseTreeOrNil |

	asHtml { :self |
		self.html
	}

	asMarkdown { :self |
		self.sourceString
	}

	basicHtml { :self |
		<primitive:
		const reader = new commonmark.Parser({smart: true});
		const writer = new commonmark.HtmlRenderer();
		return writer.render(reader.parse(_self.sourceString));
		>
	}

	basicParseTree { :self |
		<primitive:
		const reader = new commonmark.Parser({smart: true});
		return reader.parse(_self.sourceString);
		>
	}

	codeBlocks { :self |
		let answer = [];
		self.do { :each |
			(each::type = 'code_block').ifTrue {
				answer.add(each::contents)
			}
		};
		answer
	}

	do { :self :aBlock:/1 |
		<primitive:
		const walker = _parseTree_1(_self).walker();
		let event = null;
		while (event = walker.next()) {
			if (event.entering) {
				const node = event.node;
				const item = Object.create(null);
				item['type'] = node.type;
				if(node.isContainer) {
					item['begin'] = true;
				}
				if(node.literal) {
					item['contents'] = node.literal;
				}
				if(node.type === 'link' || node.type === 'image') {
					item['destination'] = node.destination;
					item['title'] = node.title;
				}
				if(node.type === 'code_block') {
					item['info'] = node.info;
				}
				if(node.type === 'heading') {
					item['level'] = node.level;
				}
				if(node.type === 'list') {
					item['listType'] = node.listType;
				}
				_aBlock_1(item);
			} else {
				const node = event.node;
				if (node.isContainer) {
					const item = Object.create(null);
					item['type'] = node.type;
					item['begin'] = false;
					_aBlock_1(item);
				}
			}
		}
		>
		self
	}

	html { :self |
		self.htmlOrNil.ifNil {
			self.htmlOrNil := self.basicHtml
		} {
			self.htmlOrNil
		}
	}

	parseTree { :self |
		self.parseTreeOrNil.ifNil {
			self.parseTreeOrNil := self.basicParseTree
		} {
			self.parseTreeOrNil
		}
	}

	lines { :self |
		self.linesOrNil.ifNil {
			self.linesOrNil := self.sourceString.lines
		} {
			self.linesOrNil
		}
	}

	printString { :self |
		'<Markdown>'
	}

	storeString { :self |
		'Markdown(' ++ self.sourceString.storeString ++ ')'
	}

}


+String {

	isCodeFence { :self |
		self.beginsWith('~~~') | {
			self.beginsWith('```')
		}
	}

	isTildeCodeFence { :self |
		self.beginsWith('~~~')
	}

	isGraveAccentCodeFence { :self |
		self.beginsWith('```')
	}

	Markdown { :self |
		newMarkdown().initializeSlots(self, nil, nil, nil)
	}

	markdownToHtml { :self |
		Markdown(self).html
	}

	parseMarkdownIndentedCodeBlocks { :self |
		let answer = [];
		let previous = '';
		let inBlock = false;
		let block = [];
		self.lines.do { :current |
			(current.notEmpty & {
				current.first.isTab & {
					previous.isEmpty & {
						inBlock.not
					}
				}
			}).ifTrue {
				inBlock := true
			};
			(current.isEmpty & {
				previous.notEmpty & {
					previous.first.isTab & {
						inBlock
					}
				}
			}).ifTrue {
				answer.add(block.copy);
				block.removeAll;
				inBlock := false
			};
			inBlock.ifTrue {
				block.add(current)
			};
			previous := current
		};
		answer
	}

}
