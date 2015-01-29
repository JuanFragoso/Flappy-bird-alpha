-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
display.setStatusBar( display.HiddenStatusBar )
display.setDefault( "textureWrapX", "repeat" )
display.setDefault( "textureWrapY", "repeat" )

local x,y = display.contentCenterX, display.contentCenterY
local o = display.newRect( x, (y-45), (display.viewableContentWidth + 50), display.viewableContentHeight )
o.fill = { type="image", filename="assets/bg.png" }
 o.fill.scaleX = 1
 o.fill.scaleY = 1

display.setDefault( "textureWrapX", "repeat" )
display.setDefault( "textureWrapY", "repeat" )

local x,y = display.contentCenterX, display.contentCenterY
local u = display.newRect(x,480, (display.viewableContentWidth + 50), 150 )
u.fill = { type="image", filename="assets/ground.png" }
 u.fill.scaleX = 1
 u.fill.scaleY = 1