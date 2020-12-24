-- ------------------------------------------------------------------------------------------------
-- -------- 调整物品堆叠 --------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------

for itemType , itemTypeName in pairs( SITypes.stackableItem ) do
	for name , item in pairs( SIGen.GetList( itemTypeName ) ) do
		item.stack_size = 1
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