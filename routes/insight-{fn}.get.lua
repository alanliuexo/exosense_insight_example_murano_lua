--#ENDPOINT GET /insight/{fn}
-- infoInsight

local insightMeta = require('insightMetaModule')

local functionId = request.parameters.fn
return insightMeta[functionId]
