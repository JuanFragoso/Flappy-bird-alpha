--game.lua
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
physics = require "physics"
physics.start()


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
      tube1.x = (display.contentWidth*1.7)
    end
    if (tube2.x) < -(display.contentWidth*0.25) then
    	tube2.y =tube1.y+520
    	tube2.x = (display.contentWidth*1.7)
    end
    if (tube3.x) < -(display.contentWidth*0.25) then
    	tube3.y =coordenadas[math.random (20)]
    	tube3.x = (display.contentWidth*1.7)
    end
    if (tube4.x) < -(display.contentWidth*0.25) then
    	tube4.y =tube3.y+520
    	tube4.x = (display.contentWidth*1.7)
    end
    if (tube5.x) < -(display.contentWidth*0.25) then
    	tube5.y =coordenadas[math.random (20)]
    	tube5.x = (display.contentWidth*1.7)
    end
    if (tube6.x) < -(display.contentWidth*0.25) then
    	tube6.y =tube5.y+520
    	tube6.x = (display.contentWidth*1.7)
    end
end
function fly(event)
  if playing == false then
    bird:setLinearVelocity( 0,-300 )
    physics.setGravity(0,50)
    playing = true
    getready.isVisible = false
  else
    bird:setLinearVelocity( 0,-300 )
  end
end
function onCollision( event )
    if ( event.phase == "began" ) then
      lose = true
      bird:pause()
      gameover.isVisible = true
      transition.moveTo( scoreboard, { x=x, y=y, time=500 } )
      Runtime:removeEventListener("touch", fly)
      playb.isVisible = true
      Runtime:removeEventListener( "collision", onCollision )
    end

end
function game(event)
     if event.phase == "ended" then
     storyboard.gotoScene("game")
     end
end

--iniciliazar start
function scene:createScene( event )
   local sceneGroup = self.view
   display.setDefault( "textureWrapX", "repeat" )
   display.setDefault( "textureWrapY", "repeat" )
   x,y = display.contentCenterX, display.contentCenterY
   background = display.newImageRect("assets/bg.png" , display.viewableContentWidth + 50, display.viewableContentHeight + 100 )
   background.x = x; background.y = y-45
   sceneGroup:insert(background)
   coordenadas = {-130,-120,-110,-100,-90,-80,-70,-60,-50,-40,-30,-20,-10,0,10,20,30,40,50,60}
   tube1 = display.newImageRect("assets/tube1.png" , display.viewableContentWidth / 6, 420 )
   tube1.x = display.contentWidth*1.5; tube1.y = coordenadas[math.random (20)]
   physics.addBody(tube1, "kinematic",{density=1, bounce=0.1, friction=.2})
   sceneGroup:insert(tube1)
   tube2 = display.newImageRect("assets/tube2.png" , display.viewableContentWidth / 6, 420 )
   tube2.x = display.contentWidth*1.5; tube2.y = tube1.y+520
   physics.addBody(tube2, "kinematic",{density=1, bounce=0.1, friction=.2})
   sceneGroup:insert(tube2)
   tube3 = display.newImageRect("assets/tube1.png" , display.viewableContentWidth / 6, 420 )
   tube3.x = display.contentWidth*2.15; tube3.y = coordenadas[math.random (20)]
   physics.addBody(tube3, "kinematic",{density=1, bounce=0.1, friction=.2})
   sceneGroup:insert(tube3)
   tube4 = display.newImageRect("assets/tube2.png" , display.viewableContentWidth / 6, 420 )
   tube4.x = display.contentWidth*2.15; tube4.y = tube3.y+520
   physics.addBody(tube4, "kinematic",{density=1, bounce=0.1, friction=.2})
   sceneGroup:insert(tube4)
   tube5 = display.newImageRect("assets/tube1.png" , display.viewableContentWidth / 6, 420 )
   tube5.x = display.contentWidth*2.8; tube5.y = coordenadas[math.random (20)]
   physics.addBody(tube5, "kinematic",{density=1, bounce=0.1, friction=.2})
   sceneGroup:insert(tube5)
   tube6 = display.newImageRect("assets/tube2.png" , display.viewableContentWidth / 6, 420 )
   tube6.x = display.contentWidth*2.8; tube6.y = tube5.y+520
   physics.addBody(tube6, "kinematic",{density=1, bounce=0.1, friction=.2})
   sceneGroup:insert(tube6)
   ground1 = display.newImageRect("assets/ground.png" , display.viewableContentWidth + 50, 150)
   ground1.x = x; ground1.y = 480
   physics.addBody(ground1, "static",{density=1, bounce=0.1, friction=.2})
   sceneGroup:insert(ground1)
   ground2 = display.newImageRect("assets/ground.png" , display.viewableContentWidth + 50, 150)
   ground2.x = x*2; ground2.y = 480
   physics.addBody(ground2, "static",{density=1, bounce=0.1, friction=.2})
   sceneGroup:insert(ground2)
   ground3 = display.newImageRect("assets/ground.png" , display.viewableContentWidth + 50, 150)
   ground3.x = x*3; ground3.y = 480
   physics.addBody(ground3, "static",{density=1, bounce=0.1, friction=.2})
   sceneGroup:insert(ground3)
   ground4 = display.newImageRect("assets/ground.png" , display.viewableContentWidth + 50, 150)
   ground4.x = x*4; ground4.y = 480
   physics.addBody(ground4, "static",{density=1, bounce=0.1, friction=.2})
   sceneGroup:insert(ground4)
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
   getready = display.newImageRect("assets/getready.png" , display.viewableContentWidth/2, display.viewableContentHeight/2)
   getready.x = x; getready.y = y
   sceneGroup:insert(getready)
   scoreboard = display.newImageRect("assets/scoreboard.png" , display.viewableContentWidth/1.5, display.viewableContentHeight/2)
   scoreboard.x = x; scoreboard.y = y*3
   sceneGroup:insert(scoreboard)
   gameover = display.newImageRect("assets/gameover.png" , display.viewableContentWidth/1.3, 120)
   gameover.x = x; gameover.y = 100
   sceneGroup:insert(gameover)
   gameover.isVisible = false
   playb = display.newImageRect("assets/play.png" , display.viewableContentWidth/3, 75)
   playb.x = x; playb.y = y+130
   playb.isVisible = false
   sceneGroup:insert(playb)


end

-- iniciar funciones antes de que todo este en la pantalla
function scene:willEnterScene( event )
        local sceneGroup = self.view
        playing = false
        lose = false
end

-- iniciar funciones ya que esta la pantalla
function scene:enterScene( event )
   local sceneGroup = self.view
    playb:addEventListener("touch", game)
    Runtime:addEventListener( "collision", onCollision )
   	Runtime:addEventListener("touch", fly)
    Runtime:addEventListener( "enterFrame", scrollground )
end

-- finalizar funciones antes de que salga la pantalla
function scene:exitScene( event )
        local sceneGroup = self.view
end
-- finalizar funciones ya que salio la pantalla
function scene:didExitScene( event )
   local sceneGroup = self.view
    Runtime:removeEventListener( "enterFrame", scrollground )
    physics.setGravity(0,0)
    storyboard.removeScene("game")
end

--finalizar start
function scene:destroyScene( event )
   local sceneGroup = self.view
end

-- cuando llamo el overlay
function scene:overlayBegan( event )
        local group = self.view
        local overlay_name = event.sceneName
end


-- cuando oculto el overlay
function scene:overlayEnded( event )
        local group = self.view
        local overlay_name = event.sceneName
end


-- listeners
scene:addEventListener( "createScene", scene )
scene:addEventListener( "willEnterScene", scene )
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "exitScene", scene )
scene:addEventListener( "didExitScene", scene )
scene:addEventListener( "destroyScene", scene )
scene:addEventListener( "overlayBegan", scene )
scene:addEventListener( "overlayEnded", scene )

return scene