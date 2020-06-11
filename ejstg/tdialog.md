# TDialog

- string `Body`: Basic HTML content of the dialog

- bool `ClosePlace`: If the dialog is automatically closed when mouse moves outside the place set by TPosition (used for hint).

- bool `CloseIn`: If the dialog is automatically closed when mouse moves into the dialog (used for informational message).

- int `CloseTimeout` [`300`]: How long should be fulfilled the `CloseOut`, `ClosePlace`, `CloseArea` or `CloseIn` condition to close the dialog.

- bool `CloseClick`: If the dialog is automatically closed after click to dialog.

- bool `CloseMove`: If the dialog is automatically closed when mouse moves for given count of pixels (used for tooltip).

- bool `CloseAfter`: If the dialog is automatically closed after given count of milliseconds.

- bool `CloseOut` [`0`]: If it is automatically closed when mouse moves outside the dialog and its header

- bool `CloseClickHeader` [`0`]: If it is automatically closed after click to Header. For predefined header in TreeGrid menu like for Enum type is already set.

- bool `HeadDrag` [`1`]: If the dialog can be moved by mouse dragging the Head.

- int `Shift` [`-1`]: How much (in pixels) will be the dialog moved in align direction from the header (to overlay header and dialog).

- bool `Wrap`: If the dialog lets wrapping of texts,
  - `0`: no
  - `1`: yes
  - `null`: default

- bool `InDiv` [`0`]: Set it to 1 when it is already in div to not surround it by another.

- object `FocusTag`: Tag that is focused after click to scroll, for null it is the main dialog tag.

- string `Head`: Top HTML / menu caption, will not be scrolled.  
  _Since 14.0_ if set to "#" it is not displayed. Setting to "" displays it as empty.

- string `Foot`: Bottom HTML / menu footer, will not be scrolled. It is ignored when shown Buttons.

- bool `Shadow` [`1`]: If it shows shadow under the dialog

- bool `ShadowHeader` [`1`]: If it shows shadow under the header

- int `ShadowWidth` [`7`]: The width of shadow in pixels, it will be reserved to the edge right and bottom edge.

- bool `HeadClose`: Displays close button on the right in the Head. Only if some Head is set.

- bool `AppendHeader` [`1`]: Append dialog next to Header (if any) rather than to the place or to the TreeGrid cell.

- bool `CanFocus` [`1` / `0`]: If the dialog gets key focus, 1 is default for menu, 0 for dialog.

- bool `Modal` [`0`]: If set to 1, disables all other controls at page when the dialog is shown.

- bool `NoScroll` [`0`]: If set to 1, never shows vertical scrollbar

- int `MaxHeight` [`null`]: Maximal height of the dialog in pixels (without header), for higher dialog will be displayed scrollbar.

- int `MinHeight` [`0` / `null`]: Minimal height of the dialog in pixels (without header), so the dialog will be never shrunk below this limit with displayed scrollbars.
For higher dialog it will be displayed with another align to be displayed whole.
0 means always (rather change align than show scrollbars) (default for menu)
null means never (never change align) (default for dialog)

- int `MaxWidth` [`null`]: Maximal width of the dialog in pixels, for wider dialog the rest will be overflowed - hidden.
0 means the Width set in position (the cell width).

- int `MinWidth` [`null`]: Minimal width of the dialog in pixels
0 means the Width set in position (the cell width)
if the dialog cannot be displayed whole, its align is changed

- int `MinEdge` [`3`]: Minimal distance to window edge in pixels, for 0 can be dialog placed immediately next to the edge.

- bool `ResizeUpdate` [`1`]: Automatically updates size when the Area or body resizes.

- bool `ScrollUpdate` [`1`]: Automatically updates size when body scrolls.

- object `Area`: Into this area is dialog overflowed or moved. It means only in this area will be the dialog shown and cannot exceed it.
Affects setting of minimal and maximal extents, align change, resize, move and drag.
By default it is the whole browser window (not page body!)
It can be set as `{X:0,Y:0,Width:0,Height:0}` or `[X,Y,Width,Height]` or HTML tag id or the HTML tag itself.

- TPosition `Position`: Position and align of the menu. The position object has preset its place to the cell the menu is shown for.
You can set especially Position.Align attribute to align the dialog to the cell differently.