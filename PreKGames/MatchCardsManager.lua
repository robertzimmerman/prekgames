--
-- Project: PreKGame
-- Description: 
--
-- Version: 1.0
-- Managed with Outlaw IDE http://OutlawGameTools.com
--
-- Copyright 2015 . All Rights Reserved.
-- 

--[[
	here we create the matchCard manager game
	we will first need to spawn 6 MatchCard objects from class MatchCard
	this will be a class 
]]--

-- require files
require('MatchCard')

local sceneGroup = sceneGroup
local MatchCardsManager = {} -- originally we should use a displayGroup

-- TODO: insert group into scene

local animalPicsReference = { "dog", "dog", "cat", "cat", "pig", "pig" , "fish", "fish"} 

-- manager class properties
MatchCardsManager.totalCards = 8
MatchCardsManager.totalPairs = 4
MatchCardsManager.pairsFound = 0
MatchCardsManager.firstCardSelected = 0
MatchCardsManager.secondCardSelected = 0
MatchCardsManager.cards = {} -- table to hold card objects


-- lets create 6 MatchCardFiles
function MatchCardsManager:create()

	local animalPics = animalPicsReference
	local x = 108 - 85
	local y = 125
	print("do we go here shit never works")
	local mCard = {}

	for i=1, 4	
		do 
		   x = x + 85 
		   num = math.random(1, #animalPics)
		   temp = animalPics[num]
		   table.remove(animalPics, num) 
		   mCard[i] = MatchCardsManager:displayPlacementCard(i, temp, x, y)
		   mCard[i].show:addEventListener("touch", myTouch)
		  
	end
	
	x = 108 - 85
	y = 195 
	for j = 5, 8 do 
			x = x + 85  		
		   num = math.random(1, #animalPics)
		   temp = animalPics[num]
		   table.remove(animalPics, num) 
		   mCard[j] = MatchCardsManager:displayPlacementCard(j, temp, x, y)
		   mCard[j].show:addEventListener("touch", myTouch)
	end
	return mCard
end

-- touch event for mCard -- is this the best way for OOP it works though
	-- here we should discuss logic in the later functions but still good for now
	-- we will call our logic on another function - maybe even new class 
function  myTouch( event )
	    if event.phase == "began" then
	    	print( "You touched the object! "..event.target.imageId)
	    	
	    	if event.target.state == 1 then
	    		print("already flipped do nothing")
	    		return true
	    	end
	        if MatchCardsManager.firstCardSelected == 0 then -- then we can flip a card
	        	event.target:setFillColor (0.72, 0.9, 0.16, 0.7 )
	        	event.target.state = 1
	        	MatchCardsManager.firstCardSelected = event.target
	    		
	        	print( "You touched the object! bah"..MatchCardsManager.firstCardSelected.imageId)
	    	elseif MatchCardsManager.secondCardSelected == 0 then
	    		event.target:setFillColor (0.72, 0.9, 0.16, 0.7 )
	    		event.target.state = 1
	    		MatchCardsManager.secondCardSelected = event.target
	    		print( "You touched the object! bah"..MatchCardsManager.secondCardSelected.imageId)
	    		checkCardsMatchLogic()
	        end	
        	return true
	    end
end

function checkCardsMatchLogic()
	 if MatchCardsManager.firstCardSelected.imageId == MatchCardsManager.secondCardSelected.imageId then
	        	print ("you have a match")
	        	MatchCardsManager.firstCardSelected = 0
	        	MatchCardsManager.secondCardSelected = 0
	 else
	           MatchCardsManager.firstCardSelected:setFillColor ( 0.5 )
	           MatchCardsManager.secondCardSelected:setFillColor( 0.5 )
	           MatchCardsManager.firstCardSelected.state = 0
	           MatchCardsManager.secondCardSelected.state = 0
	           MatchCardsManager.firstCardSelected = 0
	           MatchCardsManager.secondCardSelected = 0
	 end
end

-- here we plan to display them on the screen -- lets do this horizontal 3 x 2 
function MatchCardsManager:displayPlacementCard(idx, animal, x, y)
	-- randomly place the cards in the object id
	print("animal "..animal.." and id is "..idx)
	local card = MatchCard:new{
		id = idx,
		imageId = animal
	}
	card:show(x,y) -- displays card and that is it
	--print("animal added is "..hotCard.show.imageId)
	return card
end

return MatchCardsManager


