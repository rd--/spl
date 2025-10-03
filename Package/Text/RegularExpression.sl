RegExp! : [Object, Equatable] {

	asRegularExpression { :self |
		self
	}

	basicExec { :self :aString |
		<primitive:
		const result = _self.exec(_aString);
		return {
			match: result ? result[0] : null
		};
		>
	}

	basicExecIndices { :self :aString |
		<primitive:
		const result = _self.exec(_aString);
		return {
			match: result ? result[0] : null,
			indices: result ? [result.indices[0][0] + 1, result.indices[0][1]] : null
		};
		>
	}

	basicMatchAll { :self :aString |
		<primitive:
		return [..._aString.matchAll(_self)].map(function(each) {
			return each[0]
		});>
	}

	basicReplaceWith { :self :aString :replacementString |
		<primitive: return _aString.replace(_self, _replacementString);>
	}

	basicReplaceAllWith { :self :aString :replacementString |
		<primitive: return _aString.replaceAll(_self, _replacementString);>
	}

	basicSearch { :self :aString |
		<primitive: return _self.test(_aString);>
	}

	basicSplit { :self :aString |
		<primitive: return _aString.split(_self);>
	}

	equalBy { :self :anObject :aBlock:/2 |
		anObject.isRegularExpression & {
			aBlock(self.source, anObject.source) & {
				aBlock(self.flags, anObject.flags)
			}
		}
	}

	exec { :self :aString |
		aString.assertIsString;
		self.basicExec(aString)
	}

	execIndices { :self :aString |
		aString.assertIsString;
		self.basicExecIndices(aString)
	}

	flags { :self |
		<primitive: return _self.flags;>
	}

	hasIndices { :self |
		<primitive: return _self.hasIndices;>
	}

	isGlobal { :self |
		<primitive: return _self.global;>
	}

	isRegularExpression { :unused |
		true
	}

	lastIndex { :self |
		<primitive: return _self.lastIndex;>
	}

	match { :self :aString |
		self.exec(aString)['match']
	}

	matchAll { :self :aString |
		aString.assertIsString;
		self.basicMatchAll(aString)
	}

	matches { :self :aString |
		self.match(aString) = aString
	}

	pseudoSlotNameList { :self |
		['flags', 'isGlobal', 'hasIndices', 'source']
	}

	replaceWith { :self :aString :replacementString |
		aString.assertIsString;
		replacementString.assertIsString;
		self.basicReplaceWith(aString, replacementString)
	}

	replaceModifying { :self :aString :aBlock:/1 |
		aString.assertIsString;
		self.basicReplaceWith(aString) { :match :offset :string |
			aBlock(match)
		}
	}

	replaceAllWith { :self :aString :replacementString |
		aString.assertIsString;
		replacementString.assertIsString;
		self.basicReplaceAllWith(aString, replacementString)
	}

	replaceAllModifying { :self :aString :aBlock:/1 |
		aString.assertIsString;
		self.basicReplaceAllWith(aString) { :match :offset :string |
			aBlock(match)
		}
	}

	search { :self :aString |
		aString.assertIsString;
		self.basicSearch(aString)
	}

	splitBy { :self :aString |
		aString.assertIsString;
		self.basicSplit(aString)
	}

	source { :self |
		<primitive: return _self.source;>
	}

	storeString { :self |
		<primitive: return `RegularExpression('${_self.source}', '${_self.flags}')`;>
	}

	stringLiteral { :self |
		<primitive: return _self.toString();>
	}

}

+String {

	allRegularExpressionMatches { :self :aRegularExpression |
		aRegularExpression.asRegularExpression.matchAll(self)
	}

	asRegularExpression { :self |
		RegularExpression(self)
	}

	camelCaseToWords { :self |
		self.replaceRegularExpression(RegularExpression('([A-Z])', 'g'), ' $1')
	}

	escapeForRegularExpression { :self |
		<primitive: return RegExp.escape(self);>
	}

	isAllDigits { :self |
		self.isEmpty | {
			self.matchesRegularExpression('^[0-9]+$')
		}
	}

	isBase16String { :self |
		self.matchesRegularExpression('^[0-9A-F]+$')
	}

	isBase64String { :self |
		self.matchesRegularExpression('^[0-9A-Za-z+/]+$')
	}

	isBitString { :self |
		self.matchesRegularExpression('^[01]+$')
	}

	isDecimalIntegerString { :self |
		self.matchesRegularExpression('^[-+]?[0-9]+$')
	}

	isDecimalNumeralString { :self |
		self.matchesRegularExpression('^[-+]?[0-9]+([.][0-9]+)?$')
	}

	isFloatString { :self |
		self.matchesRegularExpression('^[-+]?[0-9]+([.][0-9]+)?([eE][+-]?[0-9]+)?$')
	}

	isScientificNotationString { :self |
		self.matchesRegularExpression('^[-+]?[0-9]+([.][0-9]+)?[eE][+-]?[0-9]+$')
	}

	isUnsignedDecimalIntegerString { :self |
		self.matchesRegularExpression('^[0-9]+$')
	}

	matchRegularExpression { :self :aRegularExpression |
		aRegularExpression.asRegularExpression.match(self)
	}

	matchesRegularExpression { :self :aRegularExpression |
		aRegularExpression.asRegularExpression.matches(self)
	}

	pascalCaseToWords { :self |
		self.camelCaseToWords.allButFirst
	}

	RegularExpression { :self :flags |
		<primitive: return new RegExp(_self, _flags);>
	}

	RegularExpression { :self |
		<primitive: return new RegExp(_self, 'd');>
	}

	replaceRegularExpression { :self :regExpToFind :stringToReplaceWith |
		regExpToFind.asRegularExpression.replaceWith(self, stringToReplaceWith)
	}

	replaceAllRegularExpression { :self :regExpToFind :stringToReplaceWith |
		regExpToFind.asRegularExpression.replaceAllWith(self, stringToReplaceWith)
	}

	replaceMultipleStrings { :aString :aRecord |
		<primitive:
		let k = Object.keys(_aRecord).map(x => RegExp.escape(x));
		let r = new RegExp(k.join('|'), 'g');
		return _aString.replace(r, function(matched) {
			return _aRecord[matched];
		});
		>
	}

	searchRegularExpression { :self :aRegularExpression |
		aRegularExpression.asRegularExpression.search(self)
	}

	splitByRegularExpression { :self :aRegularExpression |
		aRegularExpression.asRegularExpression.splitBy(self)
	}

	stringDelete { :self :operand |
		self.stringReplace(operand -> '')
	}

	stringReplace { :s :r |
		r.isList.if {
			s.replaceMultipleStrings(r.asRecord)
		} {
			let a = r.key;
			let b = r.value;
			a.isString.if {
				s.replaceStringAll(r.key, r.value)
			} {
				a.isRegularExpression.if {
					a.replaceAllWith(s, b)
				} {
					s.error('String>>stringReplace')
				}
			}
		}
	}

	wordAtIndex { :self :index |
		self.includesIndex(index).if {
			let before = (index = 1).if {
				''
			} {
				self.copyFromTo(1, index - 1).matchRegularExpression('[a-zA-Z0-9-_]+$') ? { '' }
			};
			let after = self.copyFromTo(index, self.size).matchRegularExpression('^[a-zA-Z0-9-_]+') ? { '' };
			before ++ after
		} {
			self.error('wordAtIndex: invalid index')
		}
	}

	wordCount { :self |
		self.words.size
	}

	wordsBy { :self :separators |
		self.splitByRegularExpression(
			separators.characters.stringIntercalate('|')
		).reject(isEmpty:/1)
	}

	words { :self |
		let trimmed = self.trim;
		trimmed.isEmpty.if {
			[]
		} {
			trimmed.splitByRegularExpression('\\s+')
		}
	}

}

+List {

	stringReplace { :s :r |
		s.collect { :each |
			each.stringReplace(r)
		}
	}

}
