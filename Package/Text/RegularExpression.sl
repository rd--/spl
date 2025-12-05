RegExp! : [Object, Storeable, Equatable] {

	asRegularExpression { :self |
		self
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
		self.uncheckedExec(aString)
	}

	execIndices { :self :aString |
		aString.assertIsString;
		self.uncheckedExecIndices(aString)
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
		self.uncheckedMatchAll(aString)
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
		self.uncheckedReplaceWith(aString, replacementString)
	}

	replaceModifying { :self :aString :aBlock:/1 |
		aString.assertIsString;
		self.uncheckedReplaceWith(aString) { :match :offset :string |
			aBlock(match)
		}
	}

	replaceAllWith { :self :aString :replacementString |
		aString.assertIsString;
		replacementString.assertIsString;
		self.uncheckedReplaceAllWith(aString, replacementString)
	}

	replaceAllModifying { :self :aString :aBlock:/1 |
		aString.assertIsString;
		self.uncheckedReplaceAllWith(aString) { :match :offset :string |
			aBlock(match)
		}
	}

	search { :self :aString |
		aString.assertIsString;
		self.uncheckedSearch(aString)
	}

	splitBy { :self :aString |
		aString.assertIsString;
		self.uncheckedSplit(aString)
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

	uncheckedExec { :self :aString |
		<primitive:
		const result = _self.exec(_aString);
		return {
			match: result ? result[0] : null
		};
		>
	}

	uncheckedExecIndices { :self :aString |
		<primitive:
		const result = _self.exec(_aString);
		return {
			match: result ? result[0] : null,
			indices: result ? [result.indices[0][0] + 1, result.indices[0][1]] : null
		};
		>
	}

	uncheckedMatchAll { :self :aString |
		<primitive:
		return [..._aString.matchAll(_self)].map(function(each) {
			return each[0]
		});>
	}

	uncheckedReplaceWith { :self :aString :replacementString |
		<primitive: return _aString.replace(_self, _replacementString);>
	}

	uncheckedReplaceAllWith { :self :aString :replacementString |
		<primitive: return _aString.replaceAll(_self, _replacementString);>
	}

	uncheckedSearch { :self :aString |
		<primitive: return _self.test(_aString);>
	}

	uncheckedSplit { :self :aString |
		<primitive: return _aString.split(_self);>
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
