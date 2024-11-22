/* Requires: Cache Iterable Tree */

Markdown : [Object, Cache, Iterable] { | source cache |

	asHtml { :self |
		self.cached('html') {
			self.basicAsHtml
		}
	}

	asMarkdown { :self |
		self.source
	}

	asTree { :self |
		let items = [];
		self.do { :each |
			items.add(Tree(each, []))
		};
		items.withIndexDo { :each :index |
			let value = each.value;
			{
				value::id = index
			}.assert;
			value.includesKey('parent').ifTrue {
				items[value::parent].addChild(each)
			}
		};
		items.first.do { :each |
			each.value.removeAllKeys(['id' 'parent'])
		};
		items.first
	}

	basicAsHtml { :self |
		<primitive:
		const writer = new commonmark.HtmlRenderer();
		return writer.render(_parseTree_1(_self));
		>
	}

	basicParseTree { :self |
		<primitive:
		const reader = new commonmark.Parser({smart: true});
		return reader.parse(_self.source);
		>
	}

	codeBlocks { :self |
		let answer = [];
		self.do { :each |
			(each::type = 'codeBlock').ifTrue {
				let codeBlock = (contents: each::literal);
				codeBlock::information := each.includesKey('info').if {
					each::info
				} {
					''
				};
				answer.add(codeBlock)
			}
		};
		answer
	}

	do { :self :aBlock:/1 |
		<primitive:
		const walker = _parseTree_1(_self).walker();
		let event = null;
		let id = 1;
		const nodeMap = new Map();
		while ((event = walker.next())) {
			if (event.entering) {
				const node = event.node;
				const item = Object.create(null);
				item.id = id;
				nodeMap.set(node, id)
				id = id + 1;
				if(node.parent) {
					item.parent = nodeMap.get(node.parent);
				}
				item.type = node.type;
				if(node.literal) {
					item.literal = node.literal;
				}
				if(node.type === 'link' || node.type === 'image') {
					item.destination = node.destination;
					item.title = node.title;
				}
				if(node.type === 'code_block' && node.info !== null && node.info !== '') {
					item.info = node.info;
				}
				if(node.type === 'heading') {
					item.level = node.level;
				}
				if(node.type === 'list') {
					item.listType = node.listType;
				}
				if(node.sourcepos) {
					item.sourcePosition = node.sourcepos;
				}
				switch(node.type) {
					case 'code_block': item.type = 'codeBlock'; break;
					case 'block_quote': item.type = 'blockQuote'; break;
					case 'emph': item.type = 'emphasis'; break;
					case 'html_block': item.type = 'htmlBlock'; break;
					case 'html_inline': item.type = 'htmlInline'; break;
					case 'item': item.type = 'listItem'; break;
					case 'linebreak': item.type = 'lineBreak'; break;
					case 'softbreak': item.type = 'softBreak'; break;
					case 'thematic_break': item.type = 'thematicBreak'; break;
				}
				_aBlock_1(item);
			}
		}
		>
		self
	}

	elements { :self |
		self.cached('elements') {
			self.contents
		}
	}

	indentedCodeBlocks { :self |
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

	parseTree { :self |
		self.cached('parseTree') {
			self.basicParseTree
		}
	}

	lines { :self |
		self.cached('lines') {
			self.source.lines
		}
	}

	printString { :self |
		'<Markdown>'
	}

	storeString { :self |
		'Markdown(' ++ self.source.storeString ++ ')'
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
		newMarkdown().initializeSlots(self, Record())
	}

	markdownToHtml { :self |
		Markdown(self).asHtml
	}

}
