# TPosition

Specifies position on screen of rectangle place for that is the dialog displayed - **it is not the dialog's area itself!**  
The place can be for example TreeGrid cell.
Inside the place is displayed dialog's Header if any.
The dialog is attached to some side outside or inside the place or can be also centered inside the place, see Align.
If the place has not set width and height, it specifies the exact position of the dialog.

- int `X` , `Y`: X, Y specifies left top position of the place on screen (as `position:absolute` tag).  
Or if not set `Width` and `Height`, it specifies an exact position of the dialog.  
Or if set `Mouse`, it is relative position to actual mouse position.  
Or if set `Tag`, it is position relative to the tag.

- int `Width`: A width of the place in pixels.  
Or if set Tag, it is modification to the tag width. In this case, it can be even negative.  
If not set, the X specifies an exact dialog position.

- int `Height`: A height of the place in pixels.  
Or if set Tag, it is modification to the tag height In this case, it can be even negative.  
If not set, the Y specifies an exact dialog position.

- object `Tag`: If set, it specifies the place instead of X, Y, Width, Height - for this tag will be dialog displayed.  
It can be a string as tag id or the HTMLElement itself.  
If set, the X, Y are relative to the tag and Width, Height are modification of the tag width, height.  
It can be e.g. `document.body` for the whole screen.

- bool `Mouse`
If set to 1, the X, Y are relative to mouse pointer.

- _upd 14.0_ string Align [`"left,below"`]
An align of the dialog to the place,
It can contain two keywords, one for horizontal and one for vertical align
By default is dialog is displayed under the place, left aligned "left below"  
_Since 14.0_ the Align can be set to `"none"` to not set the dialog position at all, for custom position routine.
  - Horizontal alignment
    - `prev`: outside attached to left side, can be automatically changed to "next" if dialog cannot fit to screen
    - `next`: outside attached to right side, can be automatically changed to "prev" if dialog cannot fit to screen
    - `left`: inside left aligned, minimal width is Width, can be automatically changed to "right" if dialog cannot fit to screen
    - `right`: inside right aligned, minimal width is Width, can be automatically changed to "left" if dialog cannot fit to screen
    - `center`: inside centered horizontally, can be automatically shifted horizontally if dialog cannot fit to screen
  - Vertical alignment
    - `above`: outside attached from top, can be automatically changed to "below" if dialog cannot fit to screen
    - `below`: outside attached from bottom, can be automatically changed to "above" if dialog cannot fit to screen
    - `top`: inside aligned to top, can be automatically changed to "bottom" if dialog cannot fit to screen
    - `bottom`: inside aligned to bottom, can be automatically changed to "top" if dialog cannot fit to screen
    - `middle`: inside centered vertically, can be shifted vertically if dialog cannot fit to screen

- bool `Move` [`null`]: If the dialog can be automatically moved to fit into screen  
If set to null, it is 1 for Align center and middle and 0 for the rest

- int `MoveMouse`: If set Move and Mouse and it automatically moves the dialog above the mouse to fit to screen and adds here the MoveMouse pixels.

- bool `Resize` [`null`]: If the dialog can be automatically resized to fit into screen  
If set to null, it is 1 for Align center and middle and 0 for the rest

- bool `Realign` [`null`]: If the Align can be changed to fit into screen  
If set to null, it is 1 for all Align settings except center and middle

- string `AlignHeader` [`"justify middle"`]: Align of Header inside the place. It can contain two keywords, one for horizontal and one for vertical align  
  - Horizontally:
    - `justify`: fill the whole place horizontally,
    - `left`: left aligned
    - `right`: right aligned
  - Vertically:
    - `middle`: fill the whole place vertically
    - `top`: top aligned
    - `bottom`: bottom aligned
