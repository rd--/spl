# Help Files

Help files can be written either as formatted or as plain text.
The system distinguishes between the types of help files by looking at the first character.
To be recognised as a formatted document by the `Simple Editor` files _must_ begin with a _#_ character.
Formatted help files are written using [Markdown](https://commonmark.org/).
A # indicates a heading, so formatted help files must begin with a heading.

Help files have the extension _.help.sl_ and are looked up by _topic_.
The topic of this help file is `Help Files`.
Help files are looked for in one of two locations.
If the topic has no space characters in it the help file is looked for at _Reference_, i.e. _Reference/List.help.sl_.
Otherwise the file is looked for at _Guide_, i.e. _Guide/Help Files.help.sl_.

References to help topics are written in backticks, i.e. `Operator Syntax`.

_Rationale_:
At the `Simple Editor` help files are fetched from a remote server by _Url_.
Having a simple and fixed rule for translating a topic name to a file name allows loading help files with a single _fetch_ request.
_Reference_ files document entities within the system (types, blocks, variables &etc.).
_Guide_ files are freely structured and are organised by cross-reference.
