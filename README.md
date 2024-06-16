# hx-eq
Deep equality checker, fork of https://github.com/elnabo/equals/ , but corrected for haxe 4.0+ versions


## Installation
```
haxelib install hx-eq
```


## Usage
```haxe
import hxEq.Eq;

function main () {
	var a = [1, 3, 5];
	var b = [1, 4, 5];
	var c = [1, 3, 5, 7];
	var d = [1, 3, 5];
	trace(Eq.eq(a, b)); // false
	trace(Eq.eq(a, c)); // false
	trace(Eq.eq(a, d)); // true
}
```


## Limitations
- Direct function equality returns physical equality
- Object and typedef function var are ignored if not null


## License
MIT


## Tribute
Fork of https://github.com/elnabo/equals/ 
With respect to Mr. elnabo and the package he developed