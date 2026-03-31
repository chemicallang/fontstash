# fontstash for Chemical

Fontstash bindings for Chemical.

## Usage

```chemical
import fontstash

func main() : int {
    var params = fontstash::FONSparams {
        width : 512,
        height : 512,
        flags : fontstash::FONS_ZERO_TOPLEFT as u8
    }
    var fs = fontstash::ffi::fonsCreateInternal(&mut params)
    // ... use fontstash ...
    fontstash::ffi::fonsDeleteInternal(fs)
    return 0
}
```
