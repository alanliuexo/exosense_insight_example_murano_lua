local insightMeta = {}

insightMeta.addNumber = {
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
      data_type = "NUMBER",
      data_unit = "",
      description = "One number"
    }
  },
  outlets = {
    data_type = "NUMBER",
    data_unit = ""
  }
}

insightMeta.addSquareNumber = {
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
      data_type = "NUMBER",
      data_unit = "",
      description = "One number"
    }
  },
  outlets = {
    data_type = "NUMBER",
    data_unit = ""
  }
}

insightMeta.mathFormulaOne = {
  id = "mathFormulaOne",
  name = "One Variable Formula",
  description = "Use LuaXP to apply equation calculation. ",
  constants = {
    {
        name = "formula",
        type = "string",
        description = "Ex: log(sqrt(x*10))"
    }
  },
  inlets = {
    {
        data_type = "NUMBER",
        data_unit = "",
        name = "x",
        description = "x variable"
    }
  },
  outlets = {
    data_type = "NUMBER",
    data_unit = "",
  }
}

return insightMeta