+String {

	TextButton { :self :attributeDictionary |
		| button = 'button'.createElement(attributeDictionary); |
		button.innerText := self;
		button
	}

	TextInput { :self :attributeDictionary |
		| input = 'input'.createElement(attributeDictionary); |
		input.setAttributes((
			type: 'text',
			value: self
		));
		input
	}

	TextListItem { :self |
		| listItem = 'li'.createElement; |
		listItem.textContent := self;
		listItem
	}

	TextOption { :self |
		TextOption(self, self)
	}

	TextOption { :self :value |
		| option = 'option'.createElement; |
		option.text := self.isEmpty.if {
			'Unspecified*'
		} {
			self
		};
		option.value := value;
		option
	}

}
