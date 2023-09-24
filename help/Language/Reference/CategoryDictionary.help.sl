# CategoryDictionary -- collection type

A two-level dictionary for categorizing names.

The first level is called the _domain_ and the second level the _category_.

```
system.categoryDictionary.entries.collect { :each |
  each -> system.categoryDictionary.categoriesOf('method', each)
}.select { :each |
  each.value.size > 1
}
```

* * *

See also: Dictionary, Record
