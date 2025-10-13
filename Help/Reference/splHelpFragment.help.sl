+String{
	splHelpFragment { :topic :anchor |
		let h = system.readHelpFile(topic);
		let c = h.codeBlocks;
		let f = c.detect { :each |
			each['information'].includesSubstring(anchor)
		};
		(f, h.markdown.contents)
	}
}

# splHelpFragment

- _splHelpFragment(topic, anchor)_

splHelpFragment('circleInversion','svg=E')


