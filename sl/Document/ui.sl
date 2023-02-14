+ String {

	TextButton { :self :aDictionary |
		| button = 'button'.createElement; |
		button.innerText := self;
		button.setAttributes(aDictionary);
		button
	}

	TextListItem { :self |
		| listItem = 'li'.createElement; |
		listItem.textContent := self;
		listItem
	}

	TextOption { :self :value |
		| option = 'option'.createElement; |
		option.text := self;
		option.value := value;
		option
	}

}
