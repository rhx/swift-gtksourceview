#!/usr/bin/awk
#
# Patch the generated wrapper Swift code to handle special cases
#
BEGIN { depr_init = 0 ; comment = 0 ; slist = 0 ; overr = 0 ;
        no_fields = 0 ; close_comment = 0;
}
/Creates a new ``StyleSchemeChooserButton``\.$/ { overr = 1 }
/Creates a new ``View``\.$/ { overr = 1 }
/Creates a `GtkSourceTag`.$/ { overr = 1 ; sub("GtkSourceTag", "`SourceTag`") }
/Creates a new `GtkSourceMap`.$/ { overr = 1 ; sub("GtkSourceMap", "`SourceMap`") }
/Creates a new `GtkSourceView`.$/ { overr = 1 ; sub("GtkSourceView", "`SourceView`") }
/^    @inlinable var [a-z]/ {
	if (no_fields) {
		print "#if false"
		no_fields = 0;
		close_comment = 1;
	}
}
/^    }$/ {
	if (close_comment) {
		print
		print "#endif"
		close_comment = 0;
		next
	}
}
/^[^ ]/ { slist = 0; }
/ UnsafeMutablePointer<GSList>! {/ {
	slist = 1
	gsub("UnsafeMutablePointer.GSList..", "SListRef!")
}
/return cast.rv.$/ {
	if (slist) {
		gsub("cast.rv.", "rv.map { SListRef($0) }")
	}
}
/cast.newValue./ {
	if (slist) {
		gsub("cast.newValue.", "cast(newValue.map { $0.ptr })")
		slist = 0
	}
}
/^    }$/ { slist = 0 }
/^    @inlinable public init[<(]/ {
	if (overr) {
		gsub("public", "override public")
		overr = 0
	}
}
/ init.. {/ {
	if (depr_init) {
		printf("    @available(*, deprecated)\n")
		depr_init = 0
	}
}
// {
	if (comment) {
		printf("// ")
	}
	print
}
/^    }$/ { comment = 0; overr = 0; }
