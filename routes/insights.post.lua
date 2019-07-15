--#ENDPOINT POST /insights

local insightsByGroup = {}
local emptyList = {}
local insightGroup
setmetatable(emptyList, {['__type']='slice'})

local insightMeta = require('insightMetaModule')

insightsByGroup["test"] = {
  insightMeta.httpPost,
  insightMeta.testHistory,
}

if request.body.group_id == nil or request.body.group_id == '' then
  insightGroup = {
    insightMeta.mathFormulaOne, 
    insightMeta.mathFormulaTwo,
    insightMeta.wifiMacGeoLocation,
  } 
else
  insightGroup = insightsByGroup[request.body.group_id]
end

local requestedGroup = insightGroup
if insightGroup == nil then
  return {error = "group_id "..request.body.group_id.." does not exist"}
end
local count = table.getn(requestedGroup)
local total = table.getn(requestedGroup)

return {
  count = count,
  total = total,
  insights = requestedGroup
}
