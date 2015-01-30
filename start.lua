-- Start.lua

local composer = require( "composer" )
local scene = composer.newScene()
physics = require "physics"
physics.start()
physics.setGravity(0,0)

-- funciones
function game(event)
     if event.phase == "ended" then
        composer.gotoScene( "game" )
     end
end
function scrollground(event)
    local xOffset = -8
    ground1.x = ground1.x + xOffset
    ground2.x = ground2.x + xOffset
    ground3.x = ground3.x + xOffset
    ground4.x = ground4.x + xOffset
    if (ground1.x) < -(display.contentWidth) then
        ground1.x = (display.contentWidth*1.55)
    end
    if (ground2.x) < -(display.contentWidth) then
        ground2.x = (display.contentWidth*1.55)
    end
    if (ground3.x) < -(display.contentWidth) then
        ground3.x = (display.contentWidth*1.55)
    end
    if (ground4.x) < -(display.contentWidth) then
        ground4.x = (display.contentWidth*1.55)
    end 
end

--iniciliazar start
function scene:create( event )
   local sceneGroup = self.view
   display.setDefault( "textureWrapX", "repeat" )
   display.setDefault( "textureWrapY", "repeat" )
   x,y = display.contentCenterX, display.contentCenterY
   background = display.newRect( x, (y-45), (display.viewableContentWidth + 50), (display.viewableContentHeight + 100) )
   background.fill = { type="image", filename="assets/bg.png" }
   sceneGroup:insert(background)
   ground1 = display.newRect(x,480, (display.viewableContentWidth + 50), 150 )
   physics.addBody(ground1, "static", {density=.1, bounce=0.1, friction=.2})
   ground1.fill = { type="image", filename="assets/ground.png" }
   sceneGroup:insert(ground1)
   ground2 = display.newRect((x*2),480, (display.viewableContentWidth + 50), 150 )
   physics.addBody(ground2, "static", {density=.1, bounce=0.1, friction=.2})
   ground2.fill = { type="image", filename="assets/ground.png" }
   sceneGroup:insert(ground2)
   ground3 = display.newRect((x*3),480, (display.viewableContentWidth + 50), 150 )
   physics.addBody(ground3, "static", {density=.1, bounce=0.1, friction=.2})
   ground3.fill = { type="image", filename="assets/ground.png" }
   sceneGroup:insert(ground3)
   ground4 = display.newRect((x*4),480, (display.viewableContentWidth + 50), 150 )
   physics.addBody(ground4, "static", {density=.1, bounce=0.1, friction=.2})
   ground4.fill = { type="image", filename="assets/ground.png" }
   sceneGroup:insert(ground4)
   titulo = display.newRect( x, (y-100), (display.viewableContentWidth/2), 80 )
   titulo.fill = { type="image", filename="assets/titulo.png" }
   sceneGroup:insert(titulo)
   playb = display.newRect( x, (y+130), (display.viewableContentWidth/3), 75 )
   playb.fill = { type="image", filename="assets/play.png" }
   sceneGroup:insert(playb)
end

-- iniciar funciones
function scene:show( event )
   local sceneGroup = self.view
   local phase = event.phase
   if ( phase == "will" ) then
   elseif ( phase == "did" ) then
        playb:addEventListener("touch", game)
        Runtime:addEventListener( "enterFrame", scrollground )
   end
end

-- finalizar funciones
function scene:hide( event )
   local sceneGroup = self.view
   local phase = event.phase
   if ( phase == "will" ) then
        playb:removeEventListener("touch", game)
        Runtime:removeEventListener( "enterFrame", scrollground )
   elseif ( phase == "did" ) then
   end
end

--finalizar start
function scene:destroy( event )
   local sceneGroup = self.view
end

-- listeners
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene