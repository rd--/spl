+ String {

	TextButton { :self :aDictionary |
		| b = document().createElement('button'); |
		b.innerText(self);
		aDictionary.keysAndValuesDo { :key :value | b.setAttribute(key, value) };
		b
	}

}
