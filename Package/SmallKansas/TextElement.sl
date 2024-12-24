+String {

	TextButton { :self :attributeDictionary |
		let button = 'button'.createElement(attributeDictionary);
		button.innerText := self;
		button
	}

	TextInput { :self :attributeDictionary |
		let input = 'input'.createElement(attributeDictionary);
		input.setAttributes((
			type: 'text',
			value: self
		));
		input
	}

	TextListItem { :self |
		let listItem = 'li'.createElement;
		listItem.textContent := self;
		listItem
	}

	TextOption { :self |
		TextOption(self, self)
	}

	TextOption { :self :value |
		let option = 'option'.createElement;
		option.text := self.isEmpty.if {
			'*Unspecified*'
		} {
			self
		};
		option.value := value;
		option
	}

	TextParagraph { :self |
		let p = 'p'.createElement;
		p.textContent := self;
		p
	}

	TextSpan { :self |
		let span = 'span'.createElement;
		span.textContent := self;
		span
	}

}
