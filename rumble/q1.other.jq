for $o in json-file("../confusion-2014-03-02/confusion-2014-03-02.json", 100)
let $t := $o.target
let $g := $o.guess
where $t eq $g and $t eq "Russian"
return $o
