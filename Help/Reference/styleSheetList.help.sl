# styleSheetList

- _styleSheetList(aDocument)_

Answer the `List` of style sheets associated with _aDocument_.

~~~
system.window.document.styleSheetList.collect { :each |
	each.href
}
~~~
