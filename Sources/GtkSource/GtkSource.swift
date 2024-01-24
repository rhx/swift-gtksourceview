import CGtkSource

/// Convenience typealias for ``View``.
///
/// This typealias provides convenience access
/// to the ``View`` class that wraps `GtkSourceView`.
/// Using `SourceView` instead of `View` can help
/// mitigate namespace clashes with other libraries
/// that provide a `View` type.
public typealias SourceView = View

/// Get the major version number of the GtkSourceView library.
/// 
/// This function wraps the underlying `gtk_source_get_major_version()`
/// function, returning the major version of the GtkSourceView library as an `Int`.
/// This version can be compared to the ``majorVersion`` compile-time constant.
/// - Returns: The major version number of the GtkSourceView library.
@inlinable
public func getMajorVersion() -> Int {
    return Int(gtk_source_get_major_version())
}

/// Get the minor version number of the GtkSourceView library.
///
/// This function wraps the underlying `gtk_source_get_minor_version()`
/// function, returning the minor version of the GtkSourceView library as an `Int`.
/// This version can be compared to the ``minorVersion`` compile-time constant.
/// - Returns: The minor version number of the GtkSourceView library.
@inlinable
public func getMinorVersion() -> Int {
    return Int(gtk_source_get_minor_version())
}

/// Get the micro version number of the GtkSourceView library.
///
/// This function wraps the underlying `gtk_source_get_minor_version()`
/// function, returning the micro version of the GtkSourceView library as an `Int`.
/// This version can be compared to the ``microVersion`` compile-time constant.
/// - Returns: The micro version number of the GtkSourceView library.
@inlinable
public func getMicroVersion() -> Int {
    return Int(gtk_source_get_micro_version())
}
