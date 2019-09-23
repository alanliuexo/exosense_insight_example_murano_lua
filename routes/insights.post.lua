--#ENDPOINT POST /insights
-- insight information

local emptyList = {}
setmetatable(emptyList, {['__type']='slice'})

local addNumber = {
  id = "addNumbers",
  name = "Add Numbers",
  description = "Sum one data point and a user-defined value",
  constants = {
    {
      name = "adder",
      type = "number"
    }
  },
  inlets = {
    {
      primitive_type = "NUMERIC",
      description = "One number"
    }
  },
  outlets = {
    primitive_type = "NUMERIC",
  }
}

local addSquareNumber = {
  id = "addSquareNumber",
  name = "Add Square Numbers",
  description = "Sum one data point with a squared user-defined value",
  constants = {
    {
      name = "numbertobesqured",
      type = "number"
    }
  },
  inlets = {
    {
      primitive_type = "NUMERIC",
      description = "One number"
    }
  },
  outlets = {
    primitive_type = "NUMERIC",
  }
}

local dataout = {
  id = "dataout",
  name = 'Data Out',
  description = 'Cross products data out',
  constants = {
    {
      name = 'productid',
      type = 'string',
      description = 'product id',
      required = true,
    },
    {
      name = 'deviceid',
      type = 'string',
      description = 'device id',
      required = true,
    },
    {
      name = 'threshold',
      type = 'number',
      description = 'threshold',
      required = true,
    },
    {
      name = 'command_gt',
      type = 'string',
      description = 'command will be send when value > threshold',
      required = true,
    },
    {
      name = 'command_lt',
      type = 'string',
      description = 'command will be send when value < threshold',
      required = true,
    }
  },
  inlets = {
    {
      primitive_type = 'NUMERIC',
    }
  },
  outlets = {
    {
      primitive_type = 'STRING',
    },
  },
}

local requestedGroup = {dataout}
local count = table.getn(requestedGroup)
local total = table.getn(requestedGroup)

return {
  count = count,
  total = total,
  insights = requestedGroup
}
