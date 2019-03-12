local luaxp = require('luaxpModule')

local insightModule = {}

function insightModule.addNumbers(body)
  local dataIN = body.data
  local constants = body.args.constants
  local dataOUT = {}

-- dataIN is a list of datapoints
  for _, dp in pairs(dataIN) do

    -- Each signal value in dataOUT should keep the incoming metadata
    dp.value = dp.value + constants.adder

    table.insert(dataOUT, dp)
  end
  return dataOUT
end

function insightModule.addSquareNumber(body)
  local dataIN = body.data
  local constants = body.args.constants
  local dataOUT = {}

-- dataIN is a list of datapoints
  for _, dp in pairs(dataIN) do

    -- Each signal value in dataOUT should keep the incoming metadata
    dp.value = dp.value + constants.numbertobesqured * constants.numbertobesqured

    table.insert(dataOUT, dp)
  end
  return dataOUT
end

function insightModule.mathFormulaOne(body)
  local dataIN = body.data
  local constants = body.args.constants
  local pr, message
  pr,message = luaxp.compile(constants.formula)

  local dataOUT = {}

  -- dataIN is a list of datapoints
  for _, dp in pairs(dataIN) do

    -- Each signal value in dataOUT should keep the incoming metadata
    dp.value = luaxp.run(pr, {x = dp.value})

    table.insert(dataOUT, dp)
  end
  return dataOUT
end

function insightModule.mathFormulaTwo(body)
  local dataIN = body.data
  local constants = body.args.constants
  local history = body.history
  local pr, message
  pr,message = luaxp.compile(constants.formula)

  local dataOUT = {}

  local hisValue = {}
  local obj

  -- transform history data
  for _, val in pairs(history) do
    obj = val[1]

    if obj and obj.tags and obj.tags.inlet then
      hisValue[tonumber(obj.tags.inlet)+1] = obj.value
    end
  end

  local inlets = {}
  -- dataIN is a list of datapoints
  for _, dp in pairs(dataIN) do
    inlets[1] = hisValue[1]
    inlets[2] = hisValue[2]

    inlets[tonumber(dp.tags.inlet) + 1] = dp.value

    -- Each signal value in dataOUT should keep the incoming metadata
    dp.value = luaxp.run(pr, {x = inlets[1], y = inlets[2]})

    table.insert(dataOUT, dp)
  end
  return dataOUT
end

function insightModule.httpPost(body)
  local dataIN = body.data
  local constants = body.args.constants
  local url = constants.url
  local headers = constants.headers

  local httpResult

  if headers then
    headers = from_json(headers)
  else
    headers = nil
  end
    
  -- API Reference: https://docs.exosite.com/reference/services/http/#post
  httpResult = Http.post({
    url = url,
    headers = headers,
    json = body
  })

  return from_json(httpResult.body)
end

return insightModule