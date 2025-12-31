DAMN = DAMN or {}
DAMN.OnConvert = {}

function DAMN.OnConvert.convertYeOldTires(items, result, player, selectedItem)

	local tireCond = selectedItem:getCondition();

        selectedItem:setCondition(tireCond);

end