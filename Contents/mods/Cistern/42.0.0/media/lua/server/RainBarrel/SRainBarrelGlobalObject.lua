if isClient() then return end

require "Map/SGlobalObject"

SRainBarrelGlobalObject = SGlobalObject:derive("SRainBarrelGlobalObject")

smallCisternWaterMax = 800

smallCisternThresholds = {}
smallCisternThresholds[0] = 0.1
smallCisternThresholds[1] = 0.3
smallCisternThresholds[2] = 0.7

function SRainBarrelGlobalObject:changeSprite()
	local isoObject = self:getIsoObject()
	if not isoObject then return end
	local spriteName = nil
	if self.waterMax == RainCollectorBarrel.smallWaterMax then
		if self.waterAmount >= self.waterMax * 0.75 then
			spriteName = "carpentry_02_55"
		else
			spriteName = "carpentry_02_54"
		end
	elseif self.waterMax == RainCollectorBarrel.largeWaterMax then
		if self.waterAmount >= self.waterMax * 0.75 then
			spriteName = "carpentry_02_53"
		else
			spriteName = "carpentry_02_52"
		end
	end
	if spriteName and (not isoObject:getSprite() or spriteName ~= isoObject:getSprite():getName()) then
		self:noise('sprite changed to '..spriteName..' at '..self.x..','..self.y..','..self.z)
		isoObject:setSprite(spriteName)
		isoObject:transmitUpdatedSpriteToClients()
	end
end