insightModule = {}

function insightModule.addNumbers(body)
  local dataIN = body.data
  local constants = body.args.constants
  dataOUT = {}

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
  dataOUT = {}

-- dataIN is a list of datapoints
  for _, dp in pairs(dataIN) do

    -- Each signal value in dataOUT should keep the incoming metadata
    dp.value = dp.value + constants.numbertobesqured * constants.numbertobesqured

    table.insert(dataOUT, dp)
  end
  return dataOUT
end

function insightModule.customRuleThreshold(body) 
  local dataIN = body.data
  local constants = body.args.constants
  dataOUT = {}

-- dataIN is a list of datapoints
  for _, dp in pairs(dataIN) do

    if dp.value > constants['numberabove'] then
      -- Each signal value in dataOUT should keep the incoming metadata
      dp.value = {
        level = 3,  -- critical
        type = 'customRuleThreshold',
        value = dp.value,
        numberabove = constants['numberabove'],
      }
    else
      dp.value = {
        level = 0,  -- normal
        type = 'customRuleThreshold',
        value = dp.value,
        numberabove = constants['numberabove'],
      }
    end

    table.insert(dataOUT, dp)
  end
  return dataOUT
end