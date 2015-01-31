--game.lua
local composer = require( "composer" )
local scene = composer.newScene()
physics = require "physics"
physics.start()
playing = false
lose = false
-- funciones
function scrollground(event)
    local xOffset = -5
    if lose == false then
     ground1.x = ground1.x + xOffset
     ground2.x = ground2.x + xOffset
     ground3.x = ground3.x + xOffset
     ground4.x = ground4.x + xOffset
     if playing == true then
     tube1.x = tube1.x + xOffset
     tube2.x = tube2.x + xOffset
     tube3.x = tube3.x + xOffset
     tube4.x = tube4.x + xOffset
     tube5.x = tube5.x + xOffset
     tube6.x = tube6.x + xOffset
     end
   end
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
    if (tube1.x) < -(display.contentWidth*0.25) then
    	tube1.y =coordenadas[math.random (20)]
        tube1.x = (display.contentWidth*1.25)
    end
    if (tube2.x) < -(display.contentWidth*0.25) then
    	tube2.y =tube1.y+520
    	tube2.x = (display.contentWidth*1.25)
    end
    if (tube3.x) < -(display.contentWidth*0.25) then
    	tube3.y =coordenadas[math.random (20)]
    	tube3.x = (display.contentWidth*1.25)
    end
    if (tube4.x) < -(display.contentWidth*0.25) then
    	tube4.y =tube3.y+520
    	tube4.x = (display.contentWidth*1.25)
    end
    if (tube5.x) < -(display.contentWidth*0.25) then
    	tube5.y =coordenadas[math.random (20)]
    	tube5.x = (display.contentWidth*1.25)
    end
    if (tube6.x) < -(display.contentWidth*0.25) then
    	tube6.y =tube5.y+520
    	tube6.x = (display.contentWidth*1.25)
    end
end
function fly(event)
  if event.phase == "ended" then
    if lose == true then
      lose = false
      game()
    else
      if playing == false then
        print (playing)
        bird:setLinearVelocity( 0,-300 )
        physics.setGravity(0,50)
        playing = true
        getready.isVisible = false
      else
        bird:setLinearVelocity( 0,-300 )
      end
    end
  end
end
function onCollision( event )
    if ( event.phase == "began" ) then
      lose = true
      bird:pause()
      gameover.isVisible = true
      scoreboard.x = x
      scoreboard.y = y
      playb.isVisible = true
    end
end
function game ()
     lose = false
     scoreboard.x = x
     scoreboard.y = y*3
     playing = false
     bird:play()
     physics.setGravity (0,0)
     gameover.isVisible = false
     playb.isVisible = false
     tube1.x = display.contentWidth*1.5
     tube1.y = coordenadas[math.random (20)]
     tube2.x = display.contentWidth*1.5
     tube2.y = tube1.y+520
     tube3.x = display.contentWidth*2
     tube3.y = coordenadas[math.random (20)]
     tube4.x = display.contentWidth*2
     tube4.y = tube3.y+520
     tube5.x = display.contentWidth*2.5
     tube5.y = coordenadas[math.random (20)]
     tube6.x = display.contentWidth*2.5
     tube6.y = tube5.y+520
     ground1.x = x
     ground1.y = 480
     ground2.x = x*2
     ground2.y = 480
     ground3.x = x*3
     ground3.y = 480
     ground4.x = x*4
     ground4.y = 480
     bird.x = 70
     bird.y = y
     getready.x = x
     getready.y = y
     getready.isVisible = true
     bird:setLinearVelocity( 0,0 )

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
   coordenadas = {-130,-120,-110,-100,-90,-80,-70,-60,-50,-40,-30,-20,-10,0,10,20,30,40,50,60}
   tube1 = display.newRect(display.contentWidth*1.5,coordenadas[math.random (20)], (display.viewableContentWidth / 6), 420 )
   tube1.fill = { type="image", filename="assets/tube1.png" }
   physics.addBody(tube1, "kinematic",{density=1, bounce=0.1, friction=.2})
   sceneGroup:insert(tube1)
   tube1.myName = "tube1"
   tube2 = display.newRect(display.contentWidth*1.5,tube1.y+520, (display.viewableContentWidth / 6 ), 420 )
   tube2.fill = { type="image", filename="assets/tube2.png" }
   physics.addBody(tube2, "kinematic",{density=1, bounce=0.1, friction=.2})
   sceneGroup:insert(tube2)
   tube2.myName = "tube2"
   tube3 = display.newRect(display.contentWidth*2,coordenadas[math.random (20)], (display.viewableContentWidth / 6), 420 )
   tube3.fill = { type="image", filename="assets/tube1.png" }
   physics.addBody(tube3, "kinematic",{density=1, bounce=0.1, friction=.2})
   sceneGroup:insert(tube3)
   tube3.myName = "tube3"
   tube4 = display.newRect(display.contentWidth*2,tube3.y+520, (display.viewableContentWidth / 6 ), 420 )
   tube4.fill = { type="image", filename="assets/tube2.png" }
   physics.addBody(tube4, "kinematic",{density=1, bounce=0.1, friction=.2})
   sceneGroup:insert(tube4)
   tube4.myName = "tube4"
   tube5 = display.newRect(display.contentWidth*2.5,coordenadas[math.random (20)], (display.viewableContentWidth / 6), 420 )
   tube5.fill = { type="image", filename="assets/tube1.png" }
   physics.addBody(tube5, "kinematic",{density=1, bounce=0.1, friction=.2})
   sceneGroup:insert(tube5)
   tube5.myName = "tube5"
   tube6 = display.newRect(display.contentWidth*2.5,tube5.y+520, (display.viewableContentWidth / 6 ), 420 )
   tube6.fill = { type="image", filename="assets/tube2.png" }
   physics.addBody(tube6, "kinematic",{density=1, bounce=0.1, friction=.2})
   sceneGroup:insert(tube6)
   tube6.myName = "tube6"
   ground1 = display.newRect(x,480, (display.viewableContentWidth + 50), 150 )
   physics.addBody(ground1, "static",{density=1, bounce=0.1, friction=.2})
   ground1.fill = { type="image", filename="assets/ground.png" }
   sceneGroup:insert(ground1)
   ground1.myName = "ground1"
   ground2 = display.newRect((x*2),480, (display.viewableContentWidth + 50), 150 )
   physics.addBody(ground2, "static",{density=1, bounce=0.1, friction=.2})
   ground2.fill = { type="image", filename="assets/ground.png" }
   sceneGroup:insert(ground2)
   ground2.myName = "ground2"
   ground3 = display.newRect((x*3),480, (display.viewableContentWidth + 50), 150 )
   physics.addBody(ground3, "static",{density=1, bounce=0.1, friction=.2})
   ground3.fill = { type="image", filename="assets/ground.png" }
   sceneGroup:insert(ground3)
   ground3.myName = "ground3"
   ground4 = display.newRect((x*4),480, (display.viewableContentWidth + 50), 150 )
   physics.addBody(ground4, "static",{density=1, bounce=0.1, friction=.2})
   ground4.fill = { type="image", filename="assets/ground.png" }
   sceneGroup:insert(ground4)
   ground4.myName = "ground4"
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
   bird.x = 70
   bird.y = y
   bird:play()
   physics.addBody(bird,{ density=1.0, friction=0.3, bounce=0.2 })
   bird.myName = "bird"
   bird.anchorX = 0.5
   bird.anchorY = 0.5
   sceneGroup:insert(bird)
   bird.isFixedRotation = true
   getready = display.newRect( x, (y), (display.viewableContentWidth/2),display.viewableContentHeight/2 )
   getready.fill = { type="image", filename="assets/getready.png" }
   sceneGroup:insert(getready)
   scoreboard = display.newRect( x,y*3, (display.viewableContentWidth/1.5),display.viewableContentHeight/2 )
   scoreboard.fill = { type="image", filename="assets/scoreboard.png" }
   sceneGroup:insert(scoreboard)
   gameover = display.newRect( x,100, (display.viewableContentWidth/1.3),120 )
   gameover.fill = { type="image", filename="assets/gameover.png" }
   sceneGroup:insert(gameover)
   gameover.isVisible = false
   playb = display.newRect( x, (y+130), (display.viewableContentWidth/3), 75 )
   playb.fill = { type="image", filename="assets/play.png" }
   sceneGroup:insert(playb)
   playb.isVisible = false


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
    playb:removeEventListener("touch", game)
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