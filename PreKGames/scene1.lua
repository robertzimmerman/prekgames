-------------------------------------------------------------------------------
--
-- <scene>.lua
--
-------------------------------------------------------------------------------

local sceneName = ...

local composer = require( "composer" )
local MatchCardsManager = require( "MatchCardsManager" )
-- Load scene with same root filename as this file
local scene = composer.newScene( sceneName )

-------------------------------------------------------------------------------

function scene:create( event )
    local sceneGroup = self.view

    -- Called when the scene's view does not exist
    -- 
    -- INSERT code here to initialize the scene
    

    
end

function scene:show( event )
    local sceneGroup = self.view
    local phase = event.phase

    if phase == "will" then
        -- Called when the scene is off screen and is about to move on screen
    elseif phase == "did" then
        -- Called when the scene is now on screen
        -- 
        -- INSERT code here to make the scene come alive
        -- e.g. start timers, begin animation, play audio, etc
        -- e.g. add display objects to 'sceneGroup', add touch listeners, etc
    local function myTouchListener( event )
    	if ( event.phase == "began" ) then
        	--code executed when the button is touched
        	print( "object touched = "..tostring(event.target) )  --'event.target' is the touched object
    		
    		local objectThis = event.target
    		print("object Name"..objectThis.objectName)
    		objectThis:setFillColor ( 0.72, 0.9, 0.16, 0.78 )
    	end
    	return true  --prevents touch propagation to underlying objects
    end

 
    -- adding eventListeners for each square 
    -- TODO: lets make this dynamic with class
    MatchCardsManager:create()
    --MatchCardsManager:display(self)
    
    --local redBox = self:getObjectByTag( "Rect5" )
    --redBox.objectName="rect5Name"
    --redBox:addEventListener ( "touch", myTouchListener )
    end
end

function scene:hide( event )
    local sceneGroup = self.view
    local phase = event.phase

    if event.phase == "will" then
        -- Called when the scene is on screen and is about to move off screen
        --
        -- INSERT code here to pause the scene
        -- e.g. stop timers, stop animation, unload sounds, etc.)
    elseif phase == "did" then
        -- Called when the scene is now off screen
    end 
end


function scene:destroy( event )
    local sceneGroup = self.view

    -- Called prior to the removal of scene's "view" (sceneGroup)
    -- 
    -- INSERT code here to cleanup the scene
    -- e.g. remove display objects, remove touch listeners, save state, etc
end

-------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-------------------------------------------------------------------------------

return scene
