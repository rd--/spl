String : [Object] {

	= { :self :anObject |
		self == anObject
	}

	< { :self :anObject |
		<primitive: return _self < _anObject;>
	}

	<= { :self :anObject |
		<primitive: return _self <= _anObject;>
	}

	> { :self :anObject |
		<primitive: return _anObject < _self;>
	}

	>= { :self :anObject |
		<primitive: return _anObject <= _self;>
	}

	++ { :self :anObject |
		self.appendString(anObject.asString)
	}

	appendString { :self :aString |
		<primitive: return _self + _aString;>
	}

	ascii { :self |
		1.toAsCollect(self.size, ByteArray:/1) { :index |
			| codePoint = self.charCodeAt(index); |
			(codePoint > 255).ifTrue {
				'String>>ascii: non-ascii character'.error
			};
			codePoint
		}
	}

	asString { :self |
		self
	}

	at { :self :index |
		<primitive: return _self.at(_index - 1);>
	}

	charCodeAt { :self :index |
		<primitive: return _self.charCodeAt(_index - 1);>
	}

	copyFromTo { :self :start :end |
		<primitive: return _self.substring(_start - 1, _end);>
	}

	eval { :self |
		<primitive: return sl.evaluateString(_self);>
	}

	findStringStartingAt { :self :aString :aNumber |
		<primitive: return _self.indexOf(_aString, _aNumber - 1) + 1;>
	}

	findString { :self :aString |
		<primitive: return _self.indexOf(_aString) + 1;>
	}

	indicesOf { :self :aString |
		aString.isString.if {
			| answer = OrderedCollection(), index = 1, end = self.size; |
			{ index > 0 & { index <= end } }.whileTrue {
				index := self.findStringStartingAt(aString, index);
				(index ~= 0).ifTrue {
					answer.add(index);
					index := index + 1
				}
			};
			answer.Array
		} {
			('String>>indicesOf: not a string: ' ++ aString).error
		}
	}

	includesSubstring { :self :aString |
		<primitive: return _self.includes(_aString);>
	}

	isEmpty { :self |
		self.size = 0
	}

	json { :self |
		<primitive: return JSON.stringify(_self);>
	}

	last { :self |
		self[self.size]
	}

	lines { :self |
		<primitive: return _self.split(/\r?\n/);>
	}

	loadFile { :self |
		<primitive: evaluateFile(_self);>
	}

	loadUrl { :self |
		<primitive: evaluateUrl(_self);>
	}

	markdownToHtml { :self |
		<primitive:
		var reader = new commonmark.Parser({smart: true});
		var writer = new commonmark.HtmlRenderer();
		return writer.render(reader.parse(_self));>
	}


	notEmpty { :self |
		self.isEmpty.not
	}

	occurrencesOf { :self :aString |
		aString.isString.if {
			| index = 1, end = self.size, tally = 0; |
			{ index > 0 & { index <= end } }.whileTrue {
				index := self.findStringStartingAt(aString, index);
				(index ~= 0).ifTrue {
					tally := tally + 1;
					index := index + 1
				}
			};
			tally
		} {
			('String>>occurrencesOf: not a string: ' ++ aString).error
		}
	}

	parseBacktickQuotedString { :self |
		self
	}

	parseDoubleQuotedString { :self |
		self
	}

	parseJson { :self |
		(* Parse Json, rewriting StringDictionary entries as IdentityDictionary. *)
		<primitive:
		return JSON.parse(_self, function(key, value) {
			return sl.typeOf(value) === 'StringDictionary' ? new Map(Object.entries(value)) : value;
		});>
	}

	postLine { :self |
		<primitive: console.log(_self); return null;>
	}

	printString { :self |
		<primitive: return `'${_self}'`;>
	}

	size { :self |
		<primitive: return _self.length;>
	}

	splitBy { :self :aString |
		 <primitive: return _self.split(_aString);>
	}

	toLowerCase { :self |
		  <primitive: return _self.toLowerCase();>
	}

	toUpperCase { :self |
		  <primitive: return _self.toUpperCase();>
	}

	utf8 { :self |
		<primitive: return new TextEncoder().encode(_self.normalize('NFC'));>
	}

	(* ImmutableSequenceableCollection *)
	allButFirst { :self | self.allButFirst(1) }
	allButFirst { :self :n | self.copyFromTo(n + 1, self.size) }

}

+ @Object {

	postLine { :self |
		self.printString.postLine;
		self
	}

}

+ Array {

	join { :self |
		<primitive: return _self.join('');>
	}

	joinSeparatedBy { :self :aString |
		<primitive: return _self.join(_aString);>
	}

	unlines { :self |
		<primitive: return _self.join('\n');>
	}

}

+ ByteArray {

	ascii { :self |
		<primitive: return new TextDecoder('ascii').decode(_self);>
	}

	utf8 { :self |
		<primitive: return new TextDecoder('utf8').decode(_self).normalize('NFC');>
	}

}
