RegExp! : [Object] {

	asRegExp { :self |
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

	match { :self :aString |
		self.exec(aString)::match
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
		<primitive: return `RegExp('${_self.source}', '${_self.flags}')`;>
	}

	stringLiteral { :self |
		<primitive: return _self.toString();>
	}

}

+String {

	allRegExpMatches { :self :aRegExp |
		aRegExp.asRegExp.matchAll(self)
	}

	asRegExp { :self |
		RegExp(self)
	}

	camelCaseToWords { :self |
		self.replaceRegExp(RegExp('([A-Z])', 'g'), ' $1')
	}

	isAllDigits { :self |
		self.isEmpty | {
			self.matchesRegExp('^[0-9]+$')
		}
	}

	isDecimalIntegerString { :self |
		self.matchesRegExp('^[0-9]+$')
	}

	isFloatString { :self |
		self.matchesRegExp('^[-]?[0-9]+([.][0-9]+)?([eE][+-]?[0-9]+)?$')
	}

	matchRegExp { :self :aRegExp |
		aRegExp.asRegExp.match(self)
	}

	matchesRegExp { :self :aRegExp |
		aRegExp.asRegExp.matches(self)
	}

	pascalCaseToWords { :self |
		self.camelCaseToWords.allButFirst
	}

	replaceRegExp { :self :regExpToFind :stringToReplaceWith |
		regExpToFind.asRegExp.replaceWith(self, stringToReplaceWith)
	}

	replaceAllRegExp { :self :regExpToFind :stringToReplaceWith |
		regExpToFind.asRegExp.replaceAllWith(self, stringToReplaceWith)
	}

	searchRegExp { :self :aRegExp |
		aRegExp.asRegExp.search(self)
	}

	splitByRegExp { :self :aRegExp |
		aRegExp.asRegExp.splitBy(self)
	}

	subStrings { :self :separators |
		self.splitByRegExp(
			separators.contents.join('|')
		).reject(isEmpty:/1)
	}

	RegExp { :self :flags |
		<primitive: return new RegExp(_self, _flags);>
	}

	RegExp { :self |
		<primitive: return new RegExp(_self, 'd');>
	}

	wordAtIndex { :self :index |
		let before = self.copyFromTo(1, index - 1).matchRegExp('[a-zA-Z0-9-_]+$') ? { '' };
		let after = self.copyFromTo(index, self.size).matchRegExp('^[a-zA-Z0-9-_]+') ? { '' };
		before ++ after
	}

	words { :self |
		self.trim.splitByRegExp('\\s')
	}

}
