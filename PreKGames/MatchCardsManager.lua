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

local scene = scene
local MatchCardsManager = {} -- originally we should use a displayGroup

-- TODO: insert group into scene

local animalPicsReference = { "dog", "dog", "cat", "cat", "pig", "pig" , "fish", "fish"} 

-- manager class properties
MatchCardsManager.totalCards = 8
MatchCardsManager.totalPairs = 4
MatchCardsManager.pairsFound = 0
MatchCardsManager.cards = {} -- table to hold card objects

-- require files
require('MatchCard')

-- lets create 6 MatchCardFiles
function MatchCardsManager:create()
	local animalPics = animalPicsReference
	for i=1, MatchCardsManager.totalCards 
		do 
		    -- getting random animal in struct
			num = math.random(1, #animalPics)
			temp = animalPics[num]
			table.remove(animalPics, num)
			local mCard = MatchCard:new( {
				id = i,
				imageId = temp	
			})
			MatchCardsManager.cards[i] = mCard -- TODO : check why table insert does not work
	end
end

-- here we plan to display them on the screen -- lets do this horizontal 3 x 2 
function MatchCardsManager:display(obj)
	-- randomly place the cards in the object id
	local x = 108 - 85
	local y = 125
	
	for i = 1, 4 do
			x = x + 85  		
			mCard = MatchCardsManager.cards[i] -- gettting card object
		    mCard:show(x, y)
	end
	
	-- TODO not the best way to handle grids but for now good
	
	x = 108 - 85
	y = 195 
	for j = 5, 8 do 
			x = x + 85  		
			mCard = MatchCardsManager.cards[j] -- gettting card object
		    mCard:show(x, y)
	end

end

return MatchCardsManager


