# HelpFile

- _HelpFile(origin, source)_

`HelpFile` is a `Type` holding an Spl help file.
The constructor requires a `Url`

Help files are written in Markdown.

Accessors to read the parts of the file are:

- `name`: name of entity or topic
- `signatures`: list of method signatures
- `synopsis`: one sentence synopsis
- `description`: one paragraph description
- `codeBlocks`: list of code blocks
- `documentationTests`: list of tests
- `rationale`: one paragraph rationale
- `seeAlso`: list of related help topics
- `references`: one paragraph of references
- `unicode`: list of unicode code points
- `categories`: list of categories

~~~
let url = 'Help/Reference/add.help.sl'
.splFile
.asFileUrl;
url.fetchText.then { :aString |
	let help = HelpFile(url, aString);
	[
		help.name,
		help.signatures,
		help.synopsis,
		help.description,
		help.markdown,
		help.documentationTests,
		help.rationale,
		help.seeAlso,
		help.references,
		help.unicode,
		help.categories,
		help.codeBlocks
	].do(postLine:/1)
}
~~~

* * *

See also: helpIndex, HelpIndex, terseReferenceSummary

Guides: Documentation Tests, Help Files

Categories: Help
