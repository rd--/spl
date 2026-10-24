RegExp! : [Object, Store, Equal] {

	RegularExpression { :self |
		self
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

	isEqualBy { :self :anObject :aBlock/2 |
		anObject.isRegularExpression & {
			aBlock(self.source, anObject.source) & {
				aBlock(self.flags, anObject.flags)
			}
		}
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

	replaceAllModifying { :self :aString :aBlock/1 |
		aString.assertIsString;
		self.uncheckedReplaceAllWith(aString) { :match :offset :string |
			aBlock(match)
		}
	}

	replaceAllWith { :self :aString :replacementString |
		aString.assertIsString;
		replacementString.assertIsString;
		self.uncheckedReplaceAllWith(aString, replacementString)
	}

	replaceModifying { :self :aString :aBlock/1 |
		aString.assertIsString;
		self.uncheckedReplaceWith(aString) { :match :offset :string |
			aBlock(match)
		}
	}

	replaceWith { :self :aString :replacementString |
		aString.assertIsString;
		replacementString.assertIsString;
		self.uncheckedReplaceWith(aString, replacementString)
	}

	search { :self :aString |
		aString.assertIsString;
		self.uncheckedSearch(aString)
	}

	source { :self |
		<primitive: return _self.source;>
	}

	split { :self :aString |
		aString.assertIsString;
		self.uncheckedSplit(aString)
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

	uncheckedReplaceAllWith { :self :aString :replacementString |
		<primitive: return _aString.replaceAll(_self, _replacementString);>
	}

	uncheckedReplaceWith { :self :aString :replacementString |
		<primitive: return _aString.replace(_self, _replacementString);>
	}

	uncheckedSearch { :self :aString |
		<primitive: return _self.test(_aString);>
	}

	uncheckedSplit { :self :aString |
		<primitive: return _aString.split(_self);>
	}

}

+String {

	RegularExpression { :self :flags |
		<primitive: return new RegExp(_self, _flags);>
	}

	RegularExpression { :self |
		<primitive: return new RegExp(_self, 'd');>
	}

	allRegularExpressionMatches { :self :regexp |
		RegularExpression(regexp).matchAll(self)
	}

	camelCaseToWords { :self |
		self.replaceRegularExpression(
			RegularExpression('([A-Z])', 'g'),
			' $1'
		)
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

	matchRegularExpression { :self :regexp |
		RegularExpression(regexp).match(self)
	}

	matchesRegularExpression { :self :regexp |
		RegularExpression(regexp).matches(self)
	}

	pascalCaseToWords { :self |
		self.camelCaseToWords.allButFirst
	}

	replaceAllRegularExpression { :self :regExpToFind :stringToReplaceWith |
		RegularExpression(regExpToFind).replaceAllWith(self, stringToReplaceWith)
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

	replaceRegularExpression { :self :regExpToFind :stringToReplaceWith |
		RegularExpression(regExpToFind).replaceWith(self, stringToReplaceWith)
	}

	searchRegularExpression { :self :regexp |
		RegularExpression(regexp).search(self)
	}

	stringDelete { :self :operand |
		self.stringReplace(operand -> '')
	}

	stringReplace { :s :r |
		r.isList.if {
			s.replaceMultipleStrings(r.Record)
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

	stringSplitRegularExpression { :self :regexp |
		RegularExpression(regexp).split(self)
	}

	wordAtIndex { :self :index |
		self.includesIndex(index).if {
			let before = (index = 1).if {
				''
			} {
				self
				.copyFromTo(1, index - 1)
				.matchRegularExpression('[a-zA-Z0-9-_]+$')
				.ifNil { '' }
			};
			let after = (
				self
				.copyFromTo(index, self.size)
				.matchRegularExpression('^[a-zA-Z0-9-_]+')
				.ifNil { '' }
			);
			before ++ after
		} {
			self.error('wordAtIndex: invalid index')
		}
	}

	wordCount { :self |
		self.words.size
	}

	wordCounts { :self |
		self.words.Multiset.sortedCounts.collect { :each |
			each.value -> each.key
		}
	}

	words { :self |
		let trimmed = self.trim;
		trimmed.isEmpty.if {
			[]
		} {
			trimmed.stringSplitRegularExpression('\\s+')
		}
	}

	wordsBy { :self :separators |
		self.stringSplitRegularExpression(
			separators.characters.stringIntercalate('|')
		).reject(isEmpty/1)
	}

}

+List {

	stringReplace { :s :r |
		s.collect { :each |
			each.stringReplace(r)
		}
	}

}
