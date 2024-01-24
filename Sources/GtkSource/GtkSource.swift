import CGtkSource

/// Convenience typealias for ``View``.
///
/// This typealias provides convenience access
/// to the ``View`` class that wraps `GtkSourceView`.
/// Using `SourceView` instead of `View` can help
/// mitigate namespace clashes with other libraries
/// that provide a `View` type.
public typealias SourceView = View
