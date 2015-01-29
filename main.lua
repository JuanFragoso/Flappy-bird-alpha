-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
display.setDefault( "textureWrapX", "repeat" )
display.setDefault( "textureWrapY", "repeat" )

local x,y = display.contentCenterX, display.contentCenterY
local o = display.newRect( x, y, display.contentWidth, display.contentHeight )
o.fill = { type="image", filename="assets/bg.png" }
-- o.fill.scaleX = 0.1
-- o.fill.scaleY = 0.1

display.setDefault( "textureWrapX", "repeat" )
display.setDefault( "textureWrapY", "repeat" )

local x,y = display.contentCenterX, display.contentCenterY
local o = display.newRect(x,650, display.contentWidth, display.contentHeight )
o.fill = { type="image", filename="assets/ground.png" }
-- o.fill.scaleX = 0.1
-- o.fill.scaleY = 0.1