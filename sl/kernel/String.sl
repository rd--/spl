String : [Collection, SequenceableCollection] {

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

	findStringStartingAt { :self :aString :aNumber |
		<primitive: return _self.indexOf(_aString, _aNumber - 1) + 1;>
	}

	findString { :self :aString |
		<primitive: return _self.indexOf(_aString) + 1;>
	}

	includesSubstring { :self :aString |
		<primitive: return _self.includes(_aString);>
	}

	loadFile { :self |
		<primitive: evaluateFile(_self);>
	}

	loadUrl { :self |
		<primitive: evaluateUrl(_self);>
	}

	parseBacktickQuotedString { :self |
		self
	}

	parseDoubleQuotedString { :self |
		self
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

+ Object {

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

}

+ ByteArray {

	ascii { :self |
		<primitive: return new TextDecoder('ascii').decode(_self);>
	}

	utf8 { :self |
		<primitive: return new TextDecoder('utf8').decode(_self).normalize('NFC');>
	}

}

+ Void {

	String {
		''
	}

}
