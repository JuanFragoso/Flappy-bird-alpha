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

display.setDefault( "textureWrapX", "repeat" )
display.setDefault( "textureWrapY", "repeat" )

local x,y = display.contentCenterX, display.contentCenterY
local back1 = display.newRect(x,480, (display.viewableContentWidth + 50), 150 )
back1.fill = { type="image", filename="assets/ground.png" }
local back2 = display.newRect((x*2),480, (display.viewableContentWidth + 50), 150 )
back2.fill = { type="image", filename="assets/ground.png" }
local back3 = display.newRect((x*3),480, (display.viewableContentWidth + 50), 150 )
back3.fill = { type="image", filename="assets/ground.png" }
local back4 = display.newRect((x*4),480, (display.viewableContentWidth + 50), 150 )
back4.fill = { type="image", filename="assets/ground.png" }
--local back5 = display.newRect((x*5),480, (display.viewableContentWidth + 50), 150 )
--back5.fill = { type="image", filename="assets/ground.png" }


 local function scrollBackground(event)
    local xOffset = -8
    
    back1.x = back1.x + xOffset
    back2.x = back2.x + xOffset
    back3.x = back3.x + xOffset
    back4.x = back4.x + xOffset
    --back5.x = back5.x + xOffset
    if (back1.x) < -(display.contentWidth) then
        back1.x = (display.contentWidth*1.55)
    end
    if (back2.x) < -(display.contentWidth) then
        back2.x = (display.contentWidth*1.55)
    end
    if (back3.x) < -(display.contentWidth) then
        back3.x = (display.contentWidth*1.55)
    end
    if (back4.x) < -(display.contentWidth) then
        back4.x = (display.contentWidth*1.55)
    end
    --if (back5.x) < -(display.contentWidth) then
    --    back5.x = (display.contentWidth*2)
    --end
    
end

Runtime:addEventListener( "enterFrame", scrollBackground )





p_options = 
    {
        -- Required params
        width = 36,
        height = 26,
        numFrames = 3,
        -- content scaling
        sheetContentWidth = 108,
        sheetContentHeight = 26,
    }


-- local sheet_runningCat = graphics.newImageSheet( "assets/bird.png", p_options )
-- local sequences_runningCat = {
--     -- consecutive frames sequence
--     {
--         name = "normalRun",
--         start = 1,
--         count = 3,
--         time = 500,
--         loopCount = 0,
--         loopDirection = "forward"
--     }
-- }

-- sequences_runningCat.x = 200
-- sequences_runningCat.y = 200

local playerSheet = graphics.newImageSheet( "assets/bird.png", p_options )
local bird = display.newSprite( playerSheet, { name="player", start=1, count=3, time=500, loopCount = 0 } )

bird.x = 150
bird.y = 200
bird:play()

 
bird.anchorX = 0.5
bird.anchorY = 0.5

vs = 0
gvt = 6

--player:translate(display.contentCenterX, display.contentCenterY)

function o:mouse(event)
    if event.isPrimaryButtonDown then
        --ab.y = ab.y - 150
        vs = 30
  
    end
end

o:addEventListener('mouse', bg)

local function gravity (event)
    movementParams = {
        x = bird.x,
        y = bird.y - vs,
        time = 175
    }
    transition.moveTo(bird, movementParams)
    vs = vs - gvt

end

timer.performWithDelay(50, gravity, -1)




