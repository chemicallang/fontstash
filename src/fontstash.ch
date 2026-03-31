public namespace fontstash {

public struct FONSparams {
    public var width : int
    public var height : int
    public var flags : u8
    public var userPtr : *mut void
    public var renderCreate : (uptr : *mut void, width : int, height : int) => int
    public var renderResize : (uptr : *mut void, width : int, height : int) => int
    public var renderUpdate : (uptr : *mut void, rect : *mut int, data : *u8) => void
    public var renderDraw : (uptr : *mut void, verts : *float, tcoords : *float, colors : *uint, nverts : int) => void
    public var renderDelete : (uptr : *mut void) => void
}

public struct FONSquad {
    public var x0 : float
    public var y0 : float
    public var s0 : float
    public var t0 : float
    public var x1 : float
    public var y1 : float
    public var s1 : float
    public var t1 : float
}

public struct FONStextIter {
    public var x : float
    public var y : float
    public var nextx : float
    public var nexty : float
    public var scale : float
    public var spacing : float
    public var codepoint : uint
    public var isize : short
    public var iblur : short
    public var font : *mut void
    public var prevGlyphIndex : int
    public var str : *char
    public var next : *char
    public var end : *char
    public var utf8state : uint
}

public struct FONScontext {}

public struct ffi {
    @extern
    func fonsCreateInternal(params : *mut FONSparams) : *mut FONScontext;

    @extern
    func fonsDeleteInternal(s : *mut FONScontext) : void;

    @extern
    func fonsGetAtlasSize(s : *mut FONScontext, width : *mut int, height : *mut int) : void;

    @extern
    func fonsExpandAtlas(s : *mut FONScontext, width : int, height : int) : int;

    @extern
    func fonsResetAtlas(stash : *mut FONScontext, width : int, height : int) : int;

    @extern
    func fonsAddFont(s : *mut FONScontext, name : *char, path : *char) : int;

    @extern
    func fonsAddFontMem(s : *mut FONScontext, name : *char, data : *u8, dataSize : int, freeData : int) : int;

    @extern
    func fonsGetFontByName(s : *mut FONScontext, name : *char) : int;

    @extern
    func fonsPushState(s : *mut FONScontext) : void;

    @extern
    func fonsPopState(s : *mut FONScontext) : void;

    @extern
    func fonsClearState(s : *mut FONScontext) : void;

    @extern
    func fonsSetSize(s : *mut FONScontext, size : float) : void;

    @extern
    func fonsSetColor(s : *mut FONScontext, color : uint) : void;

    @extern
    func fonsSetSpacing(s : *mut FONScontext, spacing : float) : void;

    @extern
    func fonsSetBlur(s : *mut FONScontext, blur : float) : void;

    @extern
    func fonsSetAlign(s : *mut FONScontext, align : int) : void;

    @extern
    func fonsSetFont(s : *mut FONScontext, font : int) : void;

    @extern
    func fonsDrawText(s : *mut FONScontext, x : float, y : float, string : *char, end : *char) : float;

    @extern
    func fonsTextBounds(s : *mut FONScontext, x : float, y : float, string : *char, end : *char, bounds : *mut float) : float;

    @extern
    func fonsLineBounds(s : *mut FONScontext, y : float, miny : *mut float, maxy : *mut float) : void;

    @extern
    func fonsVertMetrics(s : *mut FONScontext, ascender : *mut float, descender : *mut float, lineh : *mut float) : void;

    @extern
    func fonsGetTextureData(stash : *mut FONScontext, width : *mut int, height : *mut int) : *u8;
}

public const FONS_ALIGN_LEFT = 1
public const FONS_ALIGN_CENTER = 2
public const FONS_ALIGN_RIGHT = 4
public const FONS_ALIGN_TOP = 8
public const FONS_ALIGN_MIDDLE = 16
public const FONS_ALIGN_BOTTOM = 32
public const FONS_ALIGN_BASELINE = 64

}
