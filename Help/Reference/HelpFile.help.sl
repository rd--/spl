# HelpFile

- _HelpFile(origin, source)_

`HelpFile` is a `Type` holding an Sᴘʟ help file.
The constructor requires a `Url`.

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

* * *

See also: helpIndex, HelpIndex, readHelpFile, terseReferenceSummary

Guides: Documentation Tests, Help Files, Help Functions, System Functions

Categories: Help
