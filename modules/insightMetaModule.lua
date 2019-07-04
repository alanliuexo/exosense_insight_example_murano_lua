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
      primitive_type = "numeric",
      description = "One number"
    }
  },
  outlets = {
    primitive_type = "numeric"
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
      primitive_type = "numeric",
      description = "One number"
    }
  },
  outlets = {
    primitive_type = "numeric",
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
      primitive_type = "numeric",
      name = "x",
      description = "x variable"
    }
  },
  outlets = {
    primitive_type = "numeric",
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
      primitive_type = "numeric",
      name = "x",
      description = "x variable"
    }, {
      primitive_type = "numeric",
      name = "y",
      description = "y variable"
    }
  },
  outlets = {
    primitive_type = "numeric",
  },
  history = {
    limit = {value = 1}
  }
}

insightMeta.testHistory = {
  id = "testHistory",
  name = "testHistory",
  description = "testHistory",
  constants = {
    {
        name = "relative_start",
        type = "string",
        description = "relative_start"
    },
    {
      name = "limit",
      type = "string",
      description = "limit"
    },
  },
  inlets = {
    {
      primitive_type = "numeric",
      name = "x",
      description = "x variable"
    }
  },
  outlets = {
    primitive_type = "numeric",
  },
  history = {
    limit = {
      constant = "limit"
    },
    relative_start = {
      constant = "relative_start"
    }
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
      primitive_type = "numeric",
      name = "signal",
      description = "input signal"
    }
  },
  outlets = {
    primitive_type = "numeric",
  }
}

insightMeta.wifiMacGeoLocation = {
  id = "wifiMacGeoLocation",
  name = "wifiMacGeoLocation",
  description = "Detect Geolocation based on Wifi AP mac address.",
  constants = {
    {
        name = "api_key",
        type = "string",
        description = "Google API Key"
    }
  },
  inlets = {
    {
      primitive_type = "JSON",
      name = "inlet",
      description = "input signal"
    }
  },
  outlets = {
    primitive_type = "JSON",
    data_type = "LOCATION",
    data_unit = "LAT_LONG"
  }
}

return insightMeta