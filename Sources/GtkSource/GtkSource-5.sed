s/\`GtkSourceView\`/\`\`View\`\`/
s/\(@inlinable public\) \(init<GtkTextTagTableT: Gtk.TextTagTableProtocol>( table: GtkTextTagTableT?) {\)/\1 override \2/
s/^\(public let [a-z]*Version = \)\([A-Z_]*\)/\1Int(\2)/
