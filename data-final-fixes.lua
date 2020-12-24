-- ------------------------------------------------------------------------------------------------
-- -------- 调整物品堆叠 --------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------

local function GetCount( rail )
	if rail then
		local placeBy = rail.placeable_by or {}
		return placeBy.count or 1
	else return 1 end
end

for itemType , itemTypeName in pairs( SITypes.stackableItem ) do
	for name , item in pairs( SIGen.GetList( itemTypeName ) ) do
		if itemTypeName == SITypes.item.railPlanner then
			local railStraight = GetCount( SIGen.GetData( SITypes.entity.railStraight , item.straight_rail ) )
			local railCurved = GetCount( SIGen.GetData( SITypes.entity.railCurved , item.curved_rail ) )
			item.stack_size = math.max( math.max( railStraight , railCurved ) , 1 )
		else item.stack_size = 1 end
	end
end

-- ------------------------------------------------------------------------------------------------
-- -------- 调整容器大小 --------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------

for entityType , entityTypeName in pairs( SITypes.containerEntity ) do
	for name , entity in pairs( SIGen.GetList( entityTypeName ) ) do
		if entity.inventory_size then entity.inventory_size = math.min( entity.inventory_size*2 , 65535 ) end
	end
end

for name , item in pairs( SIGen.GetList( SITypes.item.armor ) ) do
	if item.inventory_size_bonus then item.inventory_size_bonus = item.inventory_size_bonus * 2 end
end