--game.lua
local composer = require( "composer" )
local scene = composer.newScene()
physics = require "physics"
physics.start(true)
physics.setGravity( 0, 100 )

-- funciones
function scrollground(event)
    local xOffset = -8
    ground1.x = ground1.x + xOffset
    ground2.x = ground2.x + xOffset
    ground3.x = ground3.x + xOffset
    ground4.x = ground4.x + xOffset
    tube1.x = tube1.x + xOffset
    tube2.x = tube2.x + xOffset
    tube3.x = tube3.x + xOffset
    tube4.x = tube4.x + xOffset
    tube5.x = tube5.x + xOffset
    tube6.x = tube6.x + xOffset
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
    if (tube1.x) < -(display.contentWidth) then
    	tube1.y =coordenadas[math.random (22)]
        tube1.x = (display.contentWidth*1.25)
    end
    if (tube2.x) < -(display.contentWidth) then
    	tube2.y =tube1.y+500
    	tube2.x = (display.contentWidth*1.25)
    end
    if (tube3.x) < -(display.contentWidth) then
    	tube3.y =coordenadas[math.random (22)]
    	tube3.x = (display.contentWidth*1.25)
    end
    if (tube4.x) < -(display.contentWidth) then
    	tube4.y =tube3.y+500
    	tube4.x = (display.contentWidth*1.25)
    end
    if (tube5.x) < -(display.contentWidth) then
    	tube5.y =coordenadas[math.random (22)]
    	tube5.x = (display.contentWidth*1.25)
    end
    if (tube6.x) < -(display.contentWidth) then
    	tube6.y =tube5.y+500
    	tube6.x = (display.contentWidth*1.25)
    end
end
function fly(event)
        vs = 50
end
function gravity (event)
    movementParams = {
        x = bird.x,
        y = bird.y - vs,
        time = 175
    }
    transition.moveTo(bird, movementParams)
    vs = vs - gvt

end
function onCollision( event )
    if ( event.phase == "began" ) then
       print( "began: COLLISION DETECTED!!!" )
   elseif ( event.phase == "ended" ) then
        print( "ended: " )
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
   coordenadas = {-130,-120,-110,-100,-90,-80,-70,-60,-50,-40,-30,-20,-10,0,10,20,30,40,50,60,70,80}
   tube1 = display.newRect(display.contentWidth*1.25,coordenadas[math.random (22)], (display.viewableContentWidth / 6), 420 )
   tube1.fill = { type="image", filename="assets/tube1.png" }
   physics.addBody(tube1, "kinematic",{density=1, bounce=0.1, friction=.2})
   tube1.isSleepingAllowed = false
   sceneGroup:insert(tube1)
   tube1.myName = "tube1"
   tube2 = display.newRect(display.contentWidth*1.25,tube1.y+500, (display.viewableContentWidth / 6 ), 420 )
   tube2.fill = { type="image", filename="assets/tube2.png" }
   physics.addBody(tube2, "kinematic",{density=1, bounce=0.1, friction=.2})
   sceneGroup:insert(tube2)
   tube2.myName = "tube2"
   tube2.isSleepingAllowed = false
   tube3 = display.newRect(display.contentWidth*2,coordenadas[math.random (22)], (display.viewableContentWidth / 6), 420 )
   tube3.fill = { type="image", filename="assets/tube1.png" }
   physics.addBody(tube3, "kinematic",{density=1, bounce=0.1, friction=.2})
   sceneGroup:insert(tube3)
   tube3.myName = "tube3"
   tube3.isSleepingAllowed = false
   tube4 = display.newRect(display.contentWidth*2,tube3.y+500, (display.viewableContentWidth / 6 ), 420 )
   tube4.fill = { type="image", filename="assets/tube2.png" }
   physics.addBody(tube4, "kinematic",{density=1, bounce=0.1, friction=.2})
   sceneGroup:insert(tube4)
   tube4.myName = "tube4"
   tube5 = display.newRect(display.contentWidth*2.75,coordenadas[math.random (22)], (display.viewableContentWidth / 6), 420 )
   tube5.fill = { type="image", filename="assets/tube1.png" }
   physics.addBody(tube5, "kinematic",{density=1, bounce=0.1, friction=.2})
   sceneGroup:insert(tube5)
   tube5.myName = "tube5"
   tube5.isSleepingAllowed = false
   tube6 = display.newRect(display.contentWidth*2.75,tube5.y+500, (display.viewableContentWidth / 6 ), 420 )
   tube6.fill = { type="image", filename="assets/tube2.png" }
   physics.addBody(tube6, "kinematic",{density=1, bounce=0.1, friction=.2})
   sceneGroup:insert(tube6)
   tube6.myName = "tube6"
   tube6.isSleepingAllowed = false
   ground1 = display.newRect(x,480, (display.viewableContentWidth + 50), 150 )
   physics.addBody(ground1, "static",{density=1, bounce=0.1, friction=.2})
   ground1.fill = { type="image", filename="assets/ground.png" }
   sceneGroup:insert(ground1)
   ground1.myName = "ground1"
   ground1.isSleepingAllowed = false
   ground2 = display.newRect((x*2),480, (display.viewableContentWidth + 50), 150 )
   physics.addBody(ground2, "static",{density=1, bounce=0.1, friction=.2})
   ground2.fill = { type="image", filename="assets/ground.png" }
   sceneGroup:insert(ground2)
   ground2.myName = "ground2"
   ground2.isSleepingAllowed = false
   ground3 = display.newRect((x*3),480, (display.viewableContentWidth + 50), 150 )
   physics.addBody(ground3, "static",{density=1, bounce=0.1, friction=.2})
   ground3.fill = { type="image", filename="assets/ground.png" }
   sceneGroup:insert(ground3)
   ground3.myName = "ground3"
   ground3.isSleepingAllowed = false
   ground4 = display.newRect((x*4),480, (display.viewableContentWidth + 50), 150 )
   physics.addBody(ground4, "static",{density=1, bounce=0.1, friction=.2})
   ground4.fill = { type="image", filename="assets/ground.png" }
   sceneGroup:insert(ground4)
   ground4.myName = "ground4"
   ground4.isSleepingAllowed = false
   p_options = 
   {
       width = 36,
       height = 26,
       numFrames = 3,
       sheetContentWidth = 108,
       sheetContentHeight = 26,
   }
   playerSheet = graphics.newImageSheet( "assets/bird.png", p_options )
   bird = display.newSprite( playerSheet, { name="player", start=1, count=3, time=500, loopCount = 0 } )
   bird.x = 150
   bird.y = 200
   bird:play()
   physics.addBody(bird,{ density=1.0, friction=0.3, bounce=0.2 })
   bird.myName = "bird"
   bird.anchorX = 0.5
   bird.anchorY = 0.5
   sceneGroup:insert(bird)
   vs = 0
   gvt = 6

end

-- iniciar funciones
function scene:show( event )
   local sceneGroup = self.view
   local phase = event.phase
   if ( phase == "will" ) then
   elseif ( phase == "did" ) then
    Runtime:addEventListener( "collision", onCollision )
   	Runtime:addEventListener("touch", fly)
    Runtime:addEventListener( "enterFrame", scrollground )
   end
end

-- finalizar funciones
function scene:hide( event )
   local sceneGroup = self.view
   local phase = event.phase
   if ( phase == "will" ) then
   	Runtime:removeEventListener( "collision", onCollision )
    Runtime:removeEventListener("touch", fly)
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