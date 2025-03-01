# Markdown

- _Markdown(aString)_

`Markdown` is a `Type` representing a text written in _Markdown_.

`asHtml` answers a rendering to an _Html_ `String`:

```
>>> let string = [
>>> 	'# H'
>>> 	''
>>> 	'P1'
>>> 	''
>>> 	'- L1'
>>> 	'- L2'
>>> 	''
>>> 	'P2'
>>> ].unlines;
>>> let markdown = Markdown(string);
>>> (
>>> 	markdown.asMarkdown = string,
>>> 	markdown.asHtml
>>> )
(
	true,
	[
		'<h1>H</h1>'
		'<p>P1</p>'
		'<ul>'
		'<li>L1</li>'
		'<li>L2</li>'
		'</ul>'
		'<p>P2</p>'
		''
	].unlines
)
```

`Markdown` is `Iterable`,
`do` iterates _depth-first_ over the tree structure of the document,
answering a `Record` value for each node in the parse tree,
and `contents` collects these nodes into a list:

```
>>> let m = Markdown(
>>> 	[
>>> 		'# H'
>>> 		'P `c`'
>>> 		'* * *'
>>> 		'[a](b)'
>>> 		''
>>> 		'- L **b**'
>>> 		''
>>> 		'P ![_e_](g)'
>>> 	].unlines
>>> );
>>> m.contents.collect { :each |
>>> 	let p = each.includesKey('sourcePosition');
>>> 	let mark = p.if { '*' } { '' };
>>> 	each['type'] ++ mark
>>> }
[
	'document*'
	'heading*' 'text'
	'paragraph*' 'text' 'code'
	'thematicBreak*'
	'paragraph*' 'link' 'text'
	'list*'
	'listItem*' 'paragraph*' 'text' 'strong' 'text'
	'paragraph*' 'text' 'image' 'emphasis' 'text'
]
```

For each parse tree node there is
a _type_ field (as shown above),
and an _id_ field giving a unique `Integer` identifier (assigned in traversal order from `one`).
For all but the first node (of type _document_) a _parent_ field gives the _id_ of the parent node.
Container nodes will have child nodes that point to them,
leaf nodes that hold text will have a _literal_ field holding a `String`.
_Block_ nodes have a _sourcePosition_ field giving start and end line and column numbers.

The `asTree` method answers a `Tree` of the parse tree:

```
>>> let m = Markdown(
>>> 	[
>>> 		'# H'
>>> 		'P `c`'
>>> 		'* * *'
>>> 		'[a](b)'
>>> 		''
>>> 		'- L **b**'
>>> 		''
>>> 		'P ![_e_](g)'
>>> 	].unlines
>>> );
>>> m.asTree.leafIndices
[
	1 1;
	2 1; 2 2;
	3;
	4 1 1;
	5 1 1 1; 5 1 1 2 1;
	6 1; 6 2 1 1
]
```

The `codeBlocks` method answers a `List` of each of the code block elements,
which are stored as a `Record`:

```
>>> let m = Markdown(
>>> 	[
>>> 		'# H'
>>> 		''
>>> 		'``` A'
>>> 		'a'
>>> 		'```'
>>> 		''
>>> 		'\tb'
>>> 		''
>>> 		'~~~ C'
>>> 		'c'
>>> 		'~~~'
>>> 		''
>>> 	].unlines
>>> );
>>> m.codeBlocks
[
	(contents: 'a\n', information: 'A'),
	(contents: 'b\n', information: ''),
	(contents: 'c\n', information: 'C')
]
```

* * *

See also: asTree, contents, do, markdownToHtml, Tree

Categories: Text, Type
