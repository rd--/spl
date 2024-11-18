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
- `documentTests`: list of `DocumentTest` entries
- `rationale`: one paragraph rationale
- `seeAlso`: list of related help topics
- `references`: one paragraph of references
- `unicode`: list of related unicode code points
- `categories`: list of categories

~~~
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
		help.categories,
		help.codeBlocks
	].do(postLine:/1)
}
~~~

Print the reference help files with an empty categories field:

~~~
let directory = '/home/rohan/sw/spl/help/Reference/';
let fileList = directory.readDirectoryFileNames;
fileList.select { :each |
	each.endsWith('.help.sl')
}.do { :each |
	let text = each.readTextFile;
	let help = HelpFile(each.asFileUrl, text);
	help.seeAlso.isEmpty.ifTrue {
		each.asFileUrl.fileName.postLine
	}
};
nil
~~~

* * *

See also: terseReferenceSummary

Guides: Documentation Tests

Categories: Help
