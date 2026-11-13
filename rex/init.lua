rex.bind("ctrl+s>shift+'", "pane.split", { direction = "down" })
rex.bind("ctrl+s>shift+\\", "pane.split", { direction = "right" })

rex.bind("ctrl+s>h", "pane.focus.left")
rex.bind("ctrl+s>j", "pane.focus.down")
rex.bind("ctrl+s>k", "pane.focus.up")
rex.bind("ctrl+s>l", "pane.focus.right")

rex.bind("ctrl+s>o", "pane.focus_next")
rex.bind("ctrl+s>;", "pane.focus_previous")
rex.bind("ctrl+s>z", "pane.zoom")
rex.bind("ctrl+s>x", "pane.close")
rex.bind("ctrl+s>c", "client.tab.new")
