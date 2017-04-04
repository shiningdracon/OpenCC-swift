# OpenCC-swift
[OpenCC](https://github.com/BYVoid/OpenCC) Swift wrapper

## OS X Build Notes

This package requires the [Home Brew](http://brew.sh) build of OpenCC.

To install Home Brew:

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

## Linux Build Notes

This package requires libopencc-dev installed.

```
sudo apt-get install libopencc-dev
```

## Building

Add this project as a dependency in your Package.swift file.

``` swift
.Package(url:"https://github.com/shiningdracon/OpenCC-swift", majorVersion: 1)
```

## Example

``` swift
import OpenCC

let openccS2T = OpenCC(configFile: "s2t.json")
let openccT2S = OpenCC(configFile: "t2s.json")

func ChineseConvertSimplified2Traditional(_ s: String) -> String {
	if let t = openccS2T.convert(s) {
		return t
	} else {
		return ""
	}
}

func ChineseConvertTraditional2Simplified(_ t: String) -> String {
	if let s = openccT2S.convert(t) {
		return s
	} else {
		return ""
	}
}
```
