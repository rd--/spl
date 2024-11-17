@UrlQueryParameters {

	asUrlQueryParameters { :self |
		self.typeReponsibility('asUrlQueryParameters')
	}

}

URLSearchParams! : [Object, Iterable, UrlQueryParameters] {

	= { :self :anObject |
		anObject.isUrlQueryParameters & {
			self.asString = anObject.asString
		}
	}

	add { :self :anAssociation |
		self.basicAppend(anAssociation.key, anAssociation.value)
	}

	associations { :self |
		let answer = [];
		self.keysAndValuesDo { :key :value |
			answer.add(key -> value)
		};
		answer
	}

	asString { :self |
		<primitive: return _self.toString();>
	}

	asUrlQueryParameters { :self |
		self
	}

	at { :self :name |
		<primitive: return _self.get(_name);>
	}

	atAllEntries { :self :name |
		<primitive: return _self.getAll(_name);>
	}

	atPut { :self :name :value |
		<primitive: return _self.set(_name, _value);>
	}

	basicAppend { :self :name :value |
		<primitive: return _self.append(_name, _value);>
	}

	do { :self :aBlock:/1 |
		self.keysAndValuesDo { :unusedKey :value |
			aBlock(value)
		}
	}

	includes { :self :name |
		<primitive: return _self.has(_name);>
	}

	isUrlQueryParameters { :self |
		true
	}

	keys { :self |
		<primitive:
		const answer = [];
		for(const key of _self.keys()) {
			answer.push(key);
		}
		return answer;
		>
	}

	keysAndValuesDo { :self :aBlock:/2 |
		<primitive:
		_self.forEach(function(value, key, _myself) {
			_aBlock_2(key, value);
		});
		return _self;
		>
	}

	removeKey { :self :name |
		<primitive:
		_self.delete(_name);
		return null;
		>
	}

	size { :self :name |
		<primitive: return _self.size;>
	}

	sort { :self |
		<primitive: _self.sort(); return null;>
	}

	values { :self |
		<primitive:
		const answer = [];
		for(const value of _self.values()) {
			answer.push(value);
		}
		return answer;
		>
	}

}

+@Object {

	isUrlQueryParameters { :self |
		false
	}

}

+String {

	asUrlQueryParameters { :self |
		<primitive: return new URLSearchParams(_self);>
	}

}

+Record {

	asUrlQueryParameters { :self |
		<primitive: return new URLSearchParams(_self);>
	}

}
