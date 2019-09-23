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

function insightModule.dataout(request)
  local dataIN = request.data
  local constants = request.args.constants
  local threshold = constants.threshold
  local dataOUT = {}

  local product = _G[constants.productid]

  log.info('IN: ' .. to_json(dataIN))

  -- dataIN is a list of data points
  for _, dp in pairs(dataIN) do

    -- Each signal value in dataOUT should keep the incoming metadata
    -- dp.value = result
    local value = dp.value
    if value > threshold then
      product.setIdentityState({
        identity = constants.deviceid,
        data_out = constants.command_gt
      })
      dp.value = constants.command_gt
    elseif value < threshold then
      product.setIdentityState({
        identity = constants.deviceid,
        data_out = constants.command_lt
      })
      dp.value = constants.command_lt
    else
      dp.value = ""
    end

    table.insert(dataOUT, dp)
  end

  log.info('OUT: ' .. to_json({dataOUT}))
  return {dataOUT}
end