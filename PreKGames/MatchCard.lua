--
-- Project: PreKGame
-- Description: 
--
-- Version: 1.0
-- Managed with Outlaw IDE http://OutlawGameTools.com
--
-- Copyright 2015 . All Rights Reserved.
-- 
-- Non static class of MatchCard this will hold each one. 
-- TODO we want to have a MatchCardManager  - that will create the cards in place 


-- Meta Data
local sceneGroup = sceneGroup

MatchCard = {
   id = 0, -- placeId
   imageId = 0, -- imageId for pic to show
   state = 0, -- 1 being touched over 0 not touched
}

-- Derived class method new
function MatchCard:new ( o )
	--STATIC CLASS FUNCTIONS (self refers to the Class)
	local o = o or {}
    setmetatable ( o, self )
    self.__index = self
    return o
end

function MatchCard:show(x, y)
	self.show = display.newRoundedRect( x, y, 59, 47, 5)
	self.show.strokeWidth = 3
	self.show:setFillColor( 0.5 )
	self.show:setStrokeColor( 1, 0, 0 )
	self.show.imageId = self.imageId -- TODO better way of creating a table since self of addEventListener  does not work
	--self.show:addEventListener ( "touch", self)
end

function MatchCard:touch( event )
	if event.phase == "began" then
        print( "You touched the object! "..event.target.imageId)
        return true
    end
end

return MatchCard 

		


