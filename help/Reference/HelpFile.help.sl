# HelpFile

`HelpFile` is a `Type` holding an Spl help file.

Help files are written in Markdown.

Accessors to read the parts of the file are:

- `name`: name of entity or topic
- `signatures`: list of method signatures
- `synopsis`: one sentence synopsis
- `description`: one paragraph description
- `codeBlocks`: list of code blocks
- `documentTests`: list of `DocumentTest` entries
- `rationale`: one paragraph rationale
- `seeAlso`: list of related help topics
- `references`: one paragraph of references
- `unicode`: list of related unicode code points
- `categories`: list of categories

```
let url = '/home/rohan/sw/spl/help/Reference/add.help.sl'.asFileUrl;
url.fetchText.then { :aString |
	let help = HelpFile(url, aString);
	help.codeBlockIndices.postLine
}

let url = '/home/rohan/sw/spl/help/Reference/add.help.sl'.asFileUrl;
url.fetchText.then { :aString |
	let help = HelpFile(url, aString);
	[
		help.name,
		help.signatures,
		help.synopsis,
		help.description,
		help.markdown,
		help.documentTests,
		help.rationale,
		help.seeAlso,
		help.references,
		help.unicode,
		help.categories
	].do(postLine:/1)
}
```

* * *

See also: Documentation Tests
