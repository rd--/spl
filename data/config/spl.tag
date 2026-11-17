    Trait Definition
/@\([A-Z][a-zA-Z0-9]+\) {/\1/
    Type Definition
/\([A-Z][a-zA-Z0-9]+\)[!]?* :/\1/
    Slot Names (Concise)
/[\t]| \([a-zA-Z0-9]+\).*|/\1/
/[\t]| \([a-zA-Z0-9]+\) \([a-zA-Z0-9]+\).*|/\2/
/[\t]| \([a-zA-Z0-9]+\) \([a-zA-Z0-9]+\) \([a-zA-Z0-9]+\).*|/\3/
/[\t]| \([a-zA-Z0-9]+\) \([a-zA-Z0-9]+\) \([a-zA-Z0-9]+\) \([a-zA-Z0-9]+\).*|/\4/
/[\t]| \([a-zA-Z0-9]+\) \([a-zA-Z0-9]+\) \([a-zA-Z0-9]+\) \([a-zA-Z0-9]+\) \([a-zA-Z0-9]+\).*|/\5/
    Slot Names (Verbose)
/[\t]slot \([a-zA-Z0-9]+\)/\1/
    Method Name (Singular)
/[\t]\([a-zA-Z0-9]+\)[!]? {/\1/
    Operator Name (Singular)
/[\t]\([-*+^%\/\\=~!?<>#$@|]+\) {/\1/
    Method Names (List)
/[\t]\[\([a-zA-Z0-9]+\)[!]?.*\] {/\1/
/[\t]\[\([a-zA-Z0-9]+\)[!]?, \([a-zA-Z0-9]+\)[!]?.*\] {/\2/
/[\t]\[\([a-zA-Z0-9]+\)[!]?, \([a-zA-Z0-9]+\)[!]?, \([a-zA-Z0-9]+\)[!]?.*\] {/\3/
    Method Names (List, Trailing Operator Name)
/[\t]\[.*, \([-*+^%\/\\=~!?<>#$@&|]+\)\] {/\1/
