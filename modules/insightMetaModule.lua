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

insightMeta.mathFormulaTwo = {
  id = "mathFormulaTwo",
  name = "Two Variable Formula",
  description = "Use LuaXP to apply equation calculation. ",
  constants = {
    {
        name = "formula",
        type = "string",
        description = "Ex: log(sqrt(x*10)) + y"
    }
  },
  inlets = {
    {
        data_type = "NUMBER",
        data_unit = "",
        name = "x",
        description = "x variable"
    }, {
      data_type = "NUMBER",
      data_unit = "",
      name = "x",
      description = "x variable"
    }
  },
  outlets = {
    data_type = "NUMBER",
    data_unit = "",
  },
  history = {
    limit = {value = 1}
  }
}

insightMeta.httpPost = {
  id = "httpPost",
  name = "HTTP Post",
  description = "bypass payload to external service through HTTP Post",
  constants = {
    {
      name = "url",
      type = "string",
      description = "Endpoint url to receveive data"
    }, {
      name = "headers",
      type = "string",
      description = "Headers send with (json)"
    }, {
      name = "add_payload",
      type = "string",
      description ="Your additional payload"
    }
  },
  inlets = {
    {
      data_type = "",
      data_unit = "",
      name = "signal",
      description = "input signal"
    }
  },
  outlets = {
    data_type = "",
    data_unit = "",
  }
}

return insightMeta