# XGB_Rules_Parser
Parse XGB Classifier Rules to Dart Code. Feel free to pull request if you want to port this code to another programming languange

## How to use
- Dumps XGB model to json `model._Booster.dump_model('xgb.json', dump_format='json')`
- Convert model to Dart Code `parseRule(xgbFile, fileCode, clazz)`

## Result
XGB Dart Rule:
```dart
/// Get decision of given parameters pattern,diff,width
/// [pattern] parameter of pattern should be [int] value
/// [diff] parameter of diff should be [double] value
/// [width] parameter of width should be [int] value
/// Returns one of [R01_CALL, R02_PUT, R03_CALL, R04_PUT, R05_CALL, R06_PUT, R07_CALL, R08_PUT]
Map getDecision(int pattern, double diff, int width) {
  if (pattern < 3 && diff < 0.238766268 && diff < 0.235913947) {
    return {"class": "CALL", "confident": 0.0277777798, "rule_id": "R01_CALL"};
  } else if (pattern < 3 && diff < 0.238766268 && diff < 0.235913947) {
    return {"class": "PUT", "confident": -0.127272725, "rule_id": "R02_PUT"};
  } else if (pattern < 3 && diff < 0.238766268 && diff < 0.330286235) {
    return {"class": "CALL", "confident": 0.0734177232, "rule_id": "R03_CALL"};
  } else if (pattern < 3 && diff < 0.238766268 && diff < 0.330286235) {
    return {"class": "PUT", "confident": 0.0388489217, "rule_id": "R04_PUT"};
  } else if (pattern < 3 && width < 226 && diff < 0.0330512151) {
    return {"class": "CALL", "confident": 0.0500000007, "rule_id": "R05_CALL"};
  } else if (pattern < 3 && width < 226 && diff < 0.0330512151) {
    return {"class": "PUT", "confident": -0.103448272, "rule_id": "R06_PUT"};
  } else if (pattern < 3 && width < 226 && diff < 0.351385921) {
    return {"class": "CALL", "confident": -0.0344827585, "rule_id": "R07_CALL"};
  } else if (pattern < 3 && width < 226 && diff < 0.351385921) {
    return {"class": "PUT", "confident": 0.127272725, "rule_id": "R08_PUT"};
  }
  return {};
}
```
XGB Models:
```json
[
  {
    "nodeid": 0,
    "depth": 0,
    "split": "pattern",
    "split_condition": 3,
    "yes": 1,
    "no": 2,
    "missing": 1,
    "children": [
      {
        "nodeid": 1,
        "depth": 1,
        "split": "diff",
        "split_condition": 0.238766268,
        "yes": 3,
        "no": 4,
        "missing": 3,
        "children": [
          {
            "nodeid": 3,
            "depth": 2,
            "split": "diff",
            "split_condition": 0.235913947,
            "yes": 7,
            "no": 8,
            "missing": 7,
            "children": [
              {
                "nodeid": 7,
                "leaf": 0.0277777798
              },
              {
                "nodeid": 8,
                "leaf": -0.127272725
              }
            ]
          },
          {
            "nodeid": 4,
            "depth": 2,
            "split": "diff",
            "split_condition": 0.330286235,
            "yes": 9,
            "no": 10,
            "missing": 9,
            "children": [
              {
                "nodeid": 9,
                "leaf": 0.0734177232
              },
              {
                "nodeid": 10,
                "leaf": 0.0388489217
              }
            ]
          }
        ]
      },
      {
        "nodeid": 2,
        "depth": 1,
        "split": "width",
        "split_condition": 226,
        "yes": 5,
        "no": 6,
        "missing": 5,
        "children": [
          {
            "nodeid": 5,
            "depth": 2,
            "split": "diff",
            "split_condition": 0.0330512151,
            "yes": 11,
            "no": 12,
            "missing": 11,
            "children": [
              {
                "nodeid": 11,
                "leaf": 0.0500000007
              },
              {
                "nodeid": 12,
                "leaf": -0.103448272
              }
            ]
          },
          {
            "nodeid": 6,
            "depth": 2,
            "split": "diff",
            "split_condition": 0.351385921,
            "yes": 13,
            "no": 14,
            "missing": 13,
            "children": [
              {
                "nodeid": 13,
                "leaf": -0.0344827585
              },
              {
                "nodeid": 14,
                "leaf": 0.127272725
              }
            ]
          }
        ]
      }
    ]
  },
  {
    "nodeid": 0,
    "depth": 0,
    "split": "pattern",
    "split_condition": 3,
    "yes": 1,
    "no": 2,
    "missing": 1,
    "children": [
      {
        "nodeid": 1,
        "depth": 1,
        "split": "width",
        "split_condition": 153,
        "yes": 3,
        "no": 4,
        "missing": 3,
        "children": [
          {
            "nodeid": 3,
            "depth": 2,
            "split": "diff",
            "split_condition": 0.225068927,
            "yes": 7,
            "no": 8,
            "missing": 7,
            "children": [
              {
                "nodeid": 7,
                "leaf": -0.00195653061
              },
              {
                "nodeid": 8,
                "leaf": 0.0383645482
              }
            ]
          },
          {
            "nodeid": 4,
            "depth": 2,
            "split": "diff",
            "split_condition": 0.494040489,
            "yes": 9,
            "no": 10,
            "missing": 9,
            "children": [
              {
                "nodeid": 9,
                "leaf": 0.0395517945
              },
              {
                "nodeid": 10,
                "leaf": 0.119828366
              }
            ]
          }
        ]
      },
      {
        "nodeid": 2,
        "depth": 1,
        "split": "width",
        "split_condition": 226,
        "yes": 5,
        "no": 6,
        "missing": 5,
        "children": [
          {
            "nodeid": 5,
            "depth": 2,
            "split": "diff",
            "split_condition": 0.0766830593,
            "yes": 11,
            "no": 12,
            "missing": 11,
            "children": [
              {
                "nodeid": 11,
                "leaf": 0.0192011651
              },
              {
                "nodeid": 12,
                "leaf": -0.0991709083
              }
            ]
          },
          {
            "nodeid": 6,
            "depth": 2,
            "split": "diff",
            "split_condition": 0.351385921,
            "yes": 13,
            "no": 14,
            "missing": 13,
            "children": [
              {
                "nodeid": 13,
                "leaf": -0.0315184742
              },
              {
                "nodeid": 14,
                "leaf": 0.119491577
              }
            ]
          }
        ]
      }
    ]
  },
  {
    "nodeid": 0,
    "depth": 0,
    "split": "pattern",
    "split_condition": 3,
    "yes": 1,
    "no": 2,
    "missing": 1,
    "children": [
      {
        "nodeid": 1,
        "depth": 1,
        "split": "width",
        "split_condition": 196,
        "yes": 3,
        "no": 4,
        "missing": 3,
        "children": [
          {
            "nodeid": 3,
            "depth": 2,
            "split": "diff",
            "split_condition": 0.0857445076,
            "yes": 7,
            "no": 8,
            "missing": 7,
            "children": [
              {
                "nodeid": 7,
                "leaf": 0.00154181744
              },
              {
                "nodeid": 8,
                "leaf": 0.0272910446
              }
            ]
          },
          {
            "nodeid": 4,
            "depth": 2,
            "split": "diff",
            "split_condition": 0.428984553,
            "yes": 9,
            "no": 10,
            "missing": 9,
            "children": [
              {
                "nodeid": 9,
                "leaf": 0.0512643829
              },
              {
                "nodeid": 10,
                "leaf": -0.00112724875
              }
            ]
          }
        ]
      },
      {
        "nodeid": 2,
        "depth": 1,
        "split": "width",
        "split_condition": 226,
        "yes": 5,
        "no": 6,
        "missing": 5,
        "children": [
          {
            "nodeid": 5,
            "depth": 2,
            "split": "diff",
            "split_condition": 0.0766830593,
            "yes": 11,
            "no": 12,
            "missing": 11,
            "children": [
              {
                "nodeid": 11,
                "leaf": 0.0179792214
              },
              {
                "nodeid": 12,
                "leaf": -0.0913943499
              }
            ]
          },
          {
            "nodeid": 6,
            "depth": 2,
            "split": "width",
            "split_condition": 301,
            "yes": 13,
            "no": 14,
            "missing": 13,
            "children": [
              {
                "nodeid": 13,
                "leaf": 0.0440547355
              },
              {
                "nodeid": 14,
                "leaf": -0.107510708
              }
            ]
          }
        ]
      }
    ]
  },
  {
    "nodeid": 0,
    "depth": 0,
    "split": "diff",
    "split_condition": 0.493918359,
    "yes": 1,
    "no": 2,
    "missing": 1,
    "children": [
      {
        "nodeid": 1,
        "depth": 1,
        "split": "pattern",
        "split_condition": 3,
        "yes": 3,
        "no": 4,
        "missing": 3,
        "children": [
          {
            "nodeid": 3,
            "depth": 2,
            "split": "diff",
            "split_condition": 0.454268187,
            "yes": 7,
            "no": 8,
            "missing": 7,
            "children": [
              {
                "nodeid": 7,
                "leaf": 0.0293304417
              },
              {
                "nodeid": 8,
                "leaf": -0.0168143008
              }
            ]
          },
          {
            "nodeid": 4,
            "depth": 2,
            "split": "breakout",
            "split_condition": 1.91962886,
            "yes": 9,
            "no": 10,
            "missing": 9,
            "children": [
              {
                "nodeid": 9,
                "leaf": -0.0445504338
              },
              {
                "nodeid": 10,
                "leaf": 0.0372038335
              }
            ]
          }
        ]
      },
      {
        "nodeid": 2,
        "depth": 1,
        "split": "width",
        "split_condition": 185,
        "yes": 5,
        "no": 6,
        "missing": 5,
        "children": [
          {
            "nodeid": 5,
            "leaf": -0.027126316
          },
          {
            "nodeid": 6,
            "leaf": 0.138322577
          }
        ]
      }
    ]
  },
  {
    "nodeid": 0,
    "depth": 0,
    "split": "diff",
    "split_condition": 0.493918359,
    "yes": 1,
    "no": 2,
    "missing": 1,
    "children": [
      {
        "nodeid": 1,
        "depth": 1,
        "split": "pattern",
        "split_condition": 3,
        "yes": 3,
        "no": 4,
        "missing": 3,
        "children": [
          {
            "nodeid": 3,
            "depth": 2,
            "split": "diff",
            "split_condition": 0.454268187,
            "yes": 7,
            "no": 8,
            "missing": 7,
            "children": [
              {
                "nodeid": 7,
                "leaf": 0.0264531709
              },
              {
                "nodeid": 8,
                "leaf": -0.0151865082
              }
            ]
          },
          {
            "nodeid": 4,
            "depth": 2,
            "split": "width",
            "split_condition": 226,
            "yes": 9,
            "no": 10,
            "missing": 9,
            "children": [
              {
                "nodeid": 9,
                "leaf": -0.0584475957
              },
              {
                "nodeid": 10,
                "leaf": 0.00304584741
              }
            ]
          }
        ]
      },
      {
        "nodeid": 2,
        "depth": 1,
        "split": "width",
        "split_condition": 185,
        "yes": 5,
        "no": 6,
        "missing": 5,
        "children": [
          {
            "nodeid": 5,
            "leaf": -0.0253744107
          },
          {
            "nodeid": 6,
            "leaf": 0.128595352
          }
        ]
      }
    ]
  },
  {
    "nodeid": 0,
    "depth": 0,
    "split": "width",
    "split_condition": 196,
    "yes": 1,
    "no": 2,
    "missing": 1,
    "children": [
      {
        "nodeid": 1,
        "depth": 1,
        "split": "pattern",
        "split_condition": 3,
        "yes": 3,
        "no": 4,
        "missing": 3,
        "children": [
          {
            "nodeid": 3,
            "depth": 2,
            "split": "diff",
            "split_condition": 0.406993151,
            "yes": 7,
            "no": 8,
            "missing": 7,
            "children": [
              {
                "nodeid": 7,
                "leaf": 0.00946629141
              },
              {
                "nodeid": 8,
                "leaf": 0.040895965
              }
            ]
          },
          {
            "nodeid": 4,
            "depth": 2,
            "split": "diff",
            "split_condition": 0.0451274626,
            "yes": 9,
            "no": 10,
            "missing": 9,
            "children": [
              {
                "nodeid": 9,
                "leaf": 0.0230093449
              },
              {
                "nodeid": 10,
                "leaf": -0.0889260843
              }
            ]
          }
        ]
      },
      {
        "nodeid": 2,
        "depth": 1,
        "split": "diff",
        "split_condition": 0.493918359,
        "yes": 5,
        "no": 6,
        "missing": 5,
        "children": [
          {
            "nodeid": 5,
            "depth": 2,
            "split": "diff",
            "split_condition": 0.428984553,
            "yes": 11,
            "no": 12,
            "missing": 11,
            "children": [
              {
                "nodeid": 11,
                "leaf": 0.0363740325
              },
              {
                "nodeid": 12,
                "leaf": -0.0294319876
              }
            ]
          },
          {
            "nodeid": 6,
            "leaf": 0.114507213
          }
        ]
      }
    ]
  },
  {
    "nodeid": 0,
    "depth": 0,
    "split": "diff",
    "split_condition": 0.243916124,
    "yes": 1,
    "no": 2,
    "missing": 1,
    "children": [
      {
        "nodeid": 1,
        "depth": 1,
        "split": "diff",
        "split_condition": 0.19950299,
        "yes": 3,
        "no": 4,
        "missing": 3,
        "children": [
          {
            "nodeid": 3,
            "depth": 2,
            "split": "width",
            "split_condition": 164,
            "yes": 7,
            "no": 8,
            "missing": 7,
            "children": [
              {
                "nodeid": 7,
                "leaf": 0.000959462894
              },
              {
                "nodeid": 8,
                "leaf": 0.0256037395
              }
            ]
          },
          {
            "nodeid": 4,
            "depth": 2,
            "split": "width",
            "split_condition": 203,
            "yes": 9,
            "no": 10,
            "missing": 9,
            "children": [
              {
                "nodeid": 9,
                "leaf": -0.0384209864
              },
              {
                "nodeid": 10,
                "leaf": 0.0364317708
              }
            ]
          }
        ]
      },
      {
        "nodeid": 2,
        "depth": 1,
        "split": "pattern",
        "split_condition": 3,
        "yes": 5,
        "no": 6,
        "missing": 5,
        "children": [
          {
            "nodeid": 5,
            "depth": 2,
            "split": "diff",
            "split_condition": 0.330286235,
            "yes": 11,
            "no": 12,
            "missing": 11,
            "children": [
              {
                "nodeid": 11,
                "leaf": 0.0534702055
              },
              {
                "nodeid": 12,
                "leaf": 0.0212589167
              }
            ]
          },
          {
            "nodeid": 6,
            "depth": 2,
            "split": "breakout",
            "split_condition": 1.91962886,
            "yes": 13,
            "no": 14,
            "missing": 13,
            "children": [
              {
                "nodeid": 13,
                "leaf": -0.0627292916
              },
              {
                "nodeid": 14,
                "leaf": 0.0717488006
              }
            ]
          }
        ]
      }
    ]
  },
  {
    "nodeid": 0,
    "depth": 0,
    "split": "diff",
    "split_condition": 0.493918359,
    "yes": 1,
    "no": 2,
    "missing": 1,
    "children": [
      {
        "nodeid": 1,
        "depth": 1,
        "split": "pattern",
        "split_condition": 3,
        "yes": 3,
        "no": 4,
        "missing": 3,
        "children": [
          {
            "nodeid": 3,
            "depth": 2,
            "split": "diff",
            "split_condition": 0.454268187,
            "yes": 7,
            "no": 8,
            "missing": 7,
            "children": [
              {
                "nodeid": 7,
                "leaf": 0.0199784767
              },
              {
                "nodeid": 8,
                "leaf": -0.0171507783
              }
            ]
          },
          {
            "nodeid": 4,
            "depth": 2,
            "split": "width",
            "split_condition": 301,
            "yes": 9,
            "no": 10,
            "missing": 9,
            "children": [
              {
                "nodeid": 9,
                "leaf": -0.011475184
              },
              {
                "nodeid": 10,
                "leaf": -0.102959149
              }
            ]
          }
        ]
      },
      {
        "nodeid": 2,
        "depth": 1,
        "split": "width",
        "split_condition": 185,
        "yes": 5,
        "no": 6,
        "missing": 5,
        "children": [
          {
            "nodeid": 5,
            "leaf": -0.027751511
          },
          {
            "nodeid": 6,
            "leaf": 0.113339089
          }
        ]
      }
    ]
  },
  {
    "nodeid": 0,
    "depth": 0,
    "split": "diff",
    "split_condition": 0.238766268,
    "yes": 1,
    "no": 2,
    "missing": 1,
    "children": [
      {
        "nodeid": 1,
        "depth": 1,
        "split": "diff",
        "split_condition": 0.235913947,
        "yes": 3,
        "no": 4,
        "missing": 3,
        "children": [
          {
            "nodeid": 3,
            "depth": 2,
            "split": "width",
            "split_condition": 334,
            "yes": 7,
            "no": 8,
            "missing": 7,
            "children": [
              {
                "nodeid": 7,
                "leaf": 0.010307977
              },
              {
                "nodeid": 8,
                "leaf": -0.0992209688
              }
            ]
          },
          {
            "nodeid": 4,
            "leaf": -0.127566025
          }
        ]
      },
      {
        "nodeid": 2,
        "depth": 1,
        "split": "pattern",
        "split_condition": 3,
        "yes": 5,
        "no": 6,
        "missing": 5,
        "children": [
          {
            "nodeid": 5,
            "depth": 2,
            "split": "diff",
            "split_condition": 0.330286235,
            "yes": 9,
            "no": 10,
            "missing": 9,
            "children": [
              {
                "nodeid": 9,
                "leaf": 0.0455798768
              },
              {
                "nodeid": 10,
                "leaf": 0.0178540014
              }
            ]
          },
          {
            "nodeid": 6,
            "depth": 2,
            "split": "breakout",
            "split_condition": 1.91962886,
            "yes": 11,
            "no": 12,
            "missing": 11,
            "children": [
              {
                "nodeid": 11,
                "leaf": -0.0575034209
              },
              {
                "nodeid": 12,
                "leaf": 0.0683926865
              }
            ]
          }
        ]
      }
    ]
  },
  {
    "nodeid": 0,
    "depth": 0,
    "split": "width",
    "split_condition": 210,
    "yes": 1,
    "no": 2,
    "missing": 1,
    "children": [
      {
        "nodeid": 1,
        "depth": 1,
        "split": "width",
        "split_condition": 204,
        "yes": 3,
        "no": 4,
        "missing": 3,
        "children": [
          {
            "nodeid": 3,
            "depth": 2,
            "split": "width",
            "split_condition": 196,
            "yes": 7,
            "no": 8,
            "missing": 7,
            "children": [
              {
                "nodeid": 7,
                "leaf": 0.00689911796
              },
              {
                "nodeid": 8,
                "leaf": 0.0462638251
              }
            ]
          },
          {
            "nodeid": 4,
            "depth": 2,
            "split": "breakout",
            "split_condition": 1.08380008,
            "yes": 9,
            "no": 10,
            "missing": 9,
            "children": [
              {
                "nodeid": 9,
                "leaf": -0.0833787546
              },
              {
                "nodeid": 10,
                "leaf": 0.00322939013
              }
            ]
          }
        ]
      },
      {
        "nodeid": 2,
        "depth": 1,
        "split": "width",
        "split_condition": 218,
        "yes": 5,
        "no": 6,
        "missing": 5,
        "children": [
          {
            "nodeid": 5,
            "depth": 2,
            "split": "width",
            "split_condition": 215,
            "yes": 11,
            "no": 12,
            "missing": 11,
            "children": [
              {
                "nodeid": 11,
                "leaf": 0.0457588769
              },
              {
                "nodeid": 12,
                "leaf": 0.10467241
              }
            ]
          },
          {
            "nodeid": 6,
            "depth": 2,
            "split": "width",
            "split_condition": 227,
            "yes": 13,
            "no": 14,
            "missing": 13,
            "children": [
              {
                "nodeid": 13,
                "leaf": -0.0413424671
              },
              {
                "nodeid": 14,
                "leaf": 0.0286589153
              }
            ]
          }
        ]
      }
    ]
  },
  {
    "nodeid": 0,
    "depth": 0,
    "split": "diff",
    "split_condition": 0.493918359,
    "yes": 1,
    "no": 2,
    "missing": 1,
    "children": [
      {
        "nodeid": 1,
        "depth": 1,
        "split": "diff",
        "split_condition": 0.488751888,
        "yes": 3,
        "no": 4,
        "missing": 3,
        "children": [
          {
            "nodeid": 3,
            "depth": 2,
            "split": "diff",
            "split_condition": 0.00254472345,
            "yes": 7,
            "no": 8,
            "missing": 7,
            "children": [
              {
                "nodeid": 7,
                "leaf": -0.0569296964
              },
              {
                "nodeid": 8,
                "leaf": 0.0130140958
              }
            ]
          },
          {
            "nodeid": 4,
            "depth": 2,
            "split": "breakout",
            "split_condition": 0.789159298,
            "yes": 9,
            "no": 10,
            "missing": 9,
            "children": [
              {
                "nodeid": 9,
                "leaf": 0.0143202916
              },
              {
                "nodeid": 10,
                "leaf": -0.0830241963
              }
            ]
          }
        ]
      },
      {
        "nodeid": 2,
        "depth": 1,
        "split": "width",
        "split_condition": 185,
        "yes": 5,
        "no": 6,
        "missing": 5,
        "children": [
          {
            "nodeid": 5,
            "leaf": -0.0275572371
          },
          {
            "nodeid": 6,
            "depth": 2,
            "split": "width",
            "split_condition": 293,
            "yes": 11,
            "no": 12,
            "missing": 11,
            "children": [
              {
                "nodeid": 11,
                "leaf": 0.117776446
              },
              {
                "nodeid": 12,
                "leaf": 0.0303126853
              }
            ]
          }
        ]
      }
    ]
  },
  {
    "nodeid": 0,
    "depth": 0,
    "split": "diff",
    "split_condition": 0.263571203,
    "yes": 1,
    "no": 2,
    "missing": 1,
    "children": [
      {
        "nodeid": 1,
        "depth": 1,
        "split": "width",
        "split_condition": 303,
        "yes": 3,
        "no": 4,
        "missing": 3,
        "children": [
          {
            "nodeid": 3,
            "depth": 2,
            "split": "width",
            "split_condition": 158,
            "yes": 7,
            "no": 8,
            "missing": 7,
            "children": [
              {
                "nodeid": 7,
                "leaf": -0.0082178982
              },
              {
                "nodeid": 8,
                "leaf": 0.0143090757
              }
            ]
          },
          {
            "nodeid": 4,
            "depth": 2,
            "split": "breakout",
            "split_condition": 1.70306396,
            "yes": 9,
            "no": 10,
            "missing": 9,
            "children": [
              {
                "nodeid": 9,
                "leaf": -0.105065838
              },
              {
                "nodeid": 10,
                "leaf": 0.0362248532
              }
            ]
          }
        ]
      },
      {
        "nodeid": 2,
        "depth": 1,
        "split": "diff",
        "split_condition": 0.290682971,
        "yes": 5,
        "no": 6,
        "missing": 5,
        "children": [
          {
            "nodeid": 5,
            "depth": 2,
            "split": "width",
            "split_condition": 125,
            "yes": 11,
            "no": 12,
            "missing": 11,
            "children": [
              {
                "nodeid": 11,
                "leaf": -0.0397127345
              },
              {
                "nodeid": 12,
                "leaf": 0.0777135715
              }
            ]
          },
          {
            "nodeid": 6,
            "depth": 2,
            "split": "diff",
            "split_condition": 0.29763326,
            "yes": 13,
            "no": 14,
            "missing": 13,
            "children": [
              {
                "nodeid": 13,
                "leaf": -0.105761491
              },
              {
                "nodeid": 14,
                "leaf": 0.0192096587
              }
            ]
          }
        ]
      }
    ]
  },
  {
    "nodeid": 0,
    "depth": 0,
    "split": "diff",
    "split_condition": 0.493918359,
    "yes": 1,
    "no": 2,
    "missing": 1,
    "children": [
      {
        "nodeid": 1,
        "depth": 1,
        "split": "diff",
        "split_condition": 0.488751888,
        "yes": 3,
        "no": 4,
        "missing": 3,
        "children": [
          {
            "nodeid": 3,
            "depth": 2,
            "split": "width",
            "split_condition": 227,
            "yes": 7,
            "no": 8,
            "missing": 7,
            "children": [
              {
                "nodeid": 7,
                "leaf": 0.00576934917
              },
              {
                "nodeid": 8,
                "leaf": 0.0240729023
              }
            ]
          },
          {
            "nodeid": 4,
            "depth": 2,
            "split": "width",
            "split_condition": 170,
            "yes": 9,
            "no": 10,
            "missing": 9,
            "children": [
              {
                "nodeid": 9,
                "leaf": -0.0978889987
              },
              {
                "nodeid": 10,
                "leaf": -0.00447245967
              }
            ]
          }
        ]
      },
      {
        "nodeid": 2,
        "depth": 1,
        "split": "width",
        "split_condition": 185,
        "yes": 5,
        "no": 6,
        "missing": 5,
        "children": [
          {
            "nodeid": 5,
            "leaf": -0.0270168371
          },
          {
            "nodeid": 6,
            "depth": 2,
            "split": "width",
            "split_condition": 293,
            "yes": 11,
            "no": 12,
            "missing": 11,
            "children": [
              {
                "nodeid": 11,
                "leaf": 0.111480631
              },
              {
                "nodeid": 12,
                "leaf": 0.0279965084
              }
            ]
          }
        ]
      }
    ]
  },
  {
    "nodeid": 0,
    "depth": 0,
    "split": "diff",
    "split_condition": 0.103134125,
    "yes": 1,
    "no": 2,
    "missing": 1,
    "children": [
      {
        "nodeid": 1,
        "depth": 1,
        "split": "diff",
        "split_condition": 0.0687831491,
        "yes": 3,
        "no": 4,
        "missing": 3,
        "children": [
          {
            "nodeid": 3,
            "depth": 2,
            "split": "breakout",
            "split_condition": 1.21329629,
            "yes": 7,
            "no": 8,
            "missing": 7,
            "children": [
              {
                "nodeid": 7,
                "leaf": 0.0485766008
              },
              {
                "nodeid": 8,
                "leaf": 0.000367123022
              }
            ]
          },
          {
            "nodeid": 4,
            "depth": 2,
            "split": "diff",
            "split_condition": 0.0861706212,
            "yes": 9,
            "no": 10,
            "missing": 9,
            "children": [
              {
                "nodeid": 9,
                "leaf": -0.107488774
              },
              {
                "nodeid": 10,
                "leaf": 0.000655305979
              }
            ]
          }
        ]
      },
      {
        "nodeid": 2,
        "depth": 1,
        "split": "diff",
        "split_condition": 0.117954694,
        "yes": 5,
        "no": 6,
        "missing": 5,
        "children": [
          {
            "nodeid": 5,
            "depth": 2,
            "split": "diff",
            "split_condition": 0.11555028,
            "yes": 11,
            "no": 12,
            "missing": 11,
            "children": [
              {
                "nodeid": 11,
                "leaf": 0.0384907462
              },
              {
                "nodeid": 12,
                "leaf": 0.139949903
              }
            ]
          },
          {
            "nodeid": 6,
            "depth": 2,
            "split": "width",
            "split_condition": 113,
            "yes": 13,
            "no": 14,
            "missing": 13,
            "children": [
              {
                "nodeid": 13,
                "leaf": -0.0330811776
              },
              {
                "nodeid": 14,
                "leaf": 0.0123603726
              }
            ]
          }
        ]
      }
    ]
  },
  {
    "nodeid": 0,
    "depth": 0,
    "split": "diff",
    "split_condition": 0.493918359,
    "yes": 1,
    "no": 2,
    "missing": 1,
    "children": [
      {
        "nodeid": 1,
        "depth": 1,
        "split": "pattern",
        "split_condition": 3,
        "yes": 3,
        "no": 4,
        "missing": 3,
        "children": [
          {
            "nodeid": 3,
            "depth": 2,
            "split": "diff",
            "split_condition": 0.454268187,
            "yes": 7,
            "no": 8,
            "missing": 7,
            "children": [
              {
                "nodeid": 7,
                "leaf": 0.011084822
              },
              {
                "nodeid": 8,
                "leaf": -0.021748459
              }
            ]
          },
          {
            "nodeid": 4,
            "depth": 2,
            "split": "breakout",
            "split_condition": 0.646265507,
            "yes": 9,
            "no": 10,
            "missing": 9,
            "children": [
              {
                "nodeid": 9,
                "leaf": 0.0410378613
              },
              {
                "nodeid": 10,
                "leaf": -0.038450893
              }
            ]
          }
        ]
      },
      {
        "nodeid": 2,
        "depth": 1,
        "split": "width",
        "split_condition": 185,
        "yes": 5,
        "no": 6,
        "missing": 5,
        "children": [
          {
            "nodeid": 5,
            "leaf": -0.0260696597
          },
          {
            "nodeid": 6,
            "depth": 2,
            "split": "width",
            "split_condition": 293,
            "yes": 11,
            "no": 12,
            "missing": 11,
            "children": [
              {
                "nodeid": 11,
                "leaf": 0.1062335
              },
              {
                "nodeid": 12,
                "leaf": 0.0261192825
              }
            ]
          }
        ]
      }
    ]
  },
  {
    "nodeid": 0,
    "depth": 0,
    "split": "diff",
    "split_condition": 0.243916124,
    "yes": 1,
    "no": 2,
    "missing": 1,
    "children": [
      {
        "nodeid": 1,
        "depth": 1,
        "split": "diff",
        "split_condition": 0.19950299,
        "yes": 3,
        "no": 4,
        "missing": 3,
        "children": [
          {
            "nodeid": 3,
            "depth": 2,
            "split": "width",
            "split_condition": 291,
            "yes": 7,
            "no": 8,
            "missing": 7,
            "children": [
              {
                "nodeid": 7,
                "leaf": 0.0070371218
              },
              {
                "nodeid": 8,
                "leaf": -0.0599614643
              }
            ]
          },
          {
            "nodeid": 4,
            "depth": 2,
            "split": "width",
            "split_condition": 203,
            "yes": 9,
            "no": 10,
            "missing": 9,
            "children": [
              {
                "nodeid": 9,
                "leaf": -0.0419535898
              },
              {
                "nodeid": 10,
                "leaf": 0.0244339388
              }
            ]
          }
        ]
      },
      {
        "nodeid": 2,
        "depth": 1,
        "split": "diff",
        "split_condition": 0.249187529,
        "yes": 5,
        "no": 6,
        "missing": 5,
        "children": [
          {
            "nodeid": 5,
            "leaf": 0.105953924
          },
          {
            "nodeid": 6,
            "depth": 2,
            "split": "diff",
            "split_condition": 0.257176578,
            "yes": 11,
            "no": 12,
            "missing": 11,
            "children": [
              {
                "nodeid": 11,
                "leaf": -0.0588023253
              },
              {
                "nodeid": 12,
                "leaf": 0.0158960223
              }
            ]
          }
        ]
      }
    ]
  },
  {
    "nodeid": 0,
    "depth": 0,
    "split": "diff",
    "split_condition": 0.00317146024,
    "yes": 1,
    "no": 2,
    "missing": 1,
    "children": [
      {
        "nodeid": 1,
        "depth": 1,
        "split": "diff",
        "split_condition": 0.00168125937,
        "yes": 3,
        "no": 4,
        "missing": 3,
        "children": [
          {
            "nodeid": 3,
            "depth": 2,
            "split": "diff",
            "split_condition": 0.00100493594,
            "yes": 7,
            "no": 8,
            "missing": 7,
            "children": [
              {
                "nodeid": 7,
                "leaf": -0.0143392012
              },
              {
                "nodeid": 8,
                "leaf": 0.0135978376
              }
            ]
          },
          {
            "nodeid": 4,
            "leaf": -0.103293918
          }
        ]
      },
      {
        "nodeid": 2,
        "depth": 1,
        "split": "diff",
        "split_condition": 0.0124239903,
        "yes": 5,
        "no": 6,
        "missing": 5,
        "children": [
          {
            "nodeid": 5,
            "depth": 2,
            "split": "diff",
            "split_condition": 0.00915367156,
            "yes": 9,
            "no": 10,
            "missing": 9,
            "children": [
              {
                "nodeid": 9,
                "leaf": 0.0302794259
              },
              {
                "nodeid": 10,
                "leaf": 0.129637703
              }
            ]
          },
          {
            "nodeid": 6,
            "depth": 2,
            "split": "diff",
            "split_condition": 0.0865868479,
            "yes": 11,
            "no": 12,
            "missing": 11,
            "children": [
              {
                "nodeid": 11,
                "leaf": -0.014877907
              },
              {
                "nodeid": 12,
                "leaf": 0.00993687008
              }
            ]
          }
        ]
      }
    ]
  },
  {
    "nodeid": 0,
    "depth": 0,
    "split": "diff",
    "split_condition": 0.493918359,
    "yes": 1,
    "no": 2,
    "missing": 1,
    "children": [
      {
        "nodeid": 1,
        "depth": 1,
        "split": "diff",
        "split_condition": 0.488751888,
        "yes": 3,
        "no": 4,
        "missing": 3,
        "children": [
          {
            "nodeid": 3,
            "depth": 2,
            "split": "diff",
            "split_condition": 0.00254472345,
            "yes": 7,
            "no": 8,
            "missing": 7,
            "children": [
              {
                "nodeid": 7,
                "leaf": -0.0526887476
              },
              {
                "nodeid": 8,
                "leaf": 0.00669868523
              }
            ]
          },
          {
            "nodeid": 4,
            "depth": 2,
            "split": "breakout",
            "split_condition": 0.789159298,
            "yes": 9,
            "no": 10,
            "missing": 9,
            "children": [
              {
                "nodeid": 9,
                "leaf": 0.0143857272
              },
              {
                "nodeid": 10,
                "leaf": -0.0760456324
              }
            ]
          }
        ]
      },
      {
        "nodeid": 2,
        "depth": 1,
        "split": "width",
        "split_condition": 185,
        "yes": 5,
        "no": 6,
        "missing": 5,
        "children": [
          {
            "nodeid": 5,
            "leaf": -0.0260543656
          },
          {
            "nodeid": 6,
            "depth": 2,
            "split": "width",
            "split_condition": 293,
            "yes": 11,
            "no": 12,
            "missing": 11,
            "children": [
              {
                "nodeid": 11,
                "leaf": 0.101031303
              },
              {
                "nodeid": 12,
                "leaf": 0.0237149987
              }
            ]
          }
        ]
      }
    ]
  },
  {
    "nodeid": 0,
    "depth": 0,
    "split": "breakout",
    "split_condition": 0.50591594,
    "yes": 1,
    "no": 2,
    "missing": 1,
    "children": [
      {
        "nodeid": 1,
        "leaf": 0.0925522596
      },
      {
        "nodeid": 2,
        "depth": 1,
        "split": "breakout",
        "split_condition": 0.528378367,
        "yes": 3,
        "no": 4,
        "missing": 3,
        "children": [
          {
            "nodeid": 3,
            "depth": 2,
            "split": "breakout",
            "split_condition": 0.512424231,
            "yes": 5,
            "no": 6,
            "missing": 5,
            "children": [
              {
                "nodeid": 5,
                "leaf": 0.00184617599
              },
              {
                "nodeid": 6,
                "leaf": -0.104252927
              }
            ]
          },
          {
            "nodeid": 4,
            "depth": 2,
            "split": "diff",
            "split_condition": 0.00469513424,
            "yes": 7,
            "no": 8,
            "missing": 7,
            "children": [
              {
                "nodeid": 7,
                "leaf": -0.0391088277
              },
              {
                "nodeid": 8,
                "leaf": 0.00711014634
              }
            ]
          }
        ]
      }
    ]
  },
  {
    "nodeid": 0,
    "depth": 0,
    "split": "diff",
    "split_condition": 0.493918359,
    "yes": 1,
    "no": 2,
    "missing": 1,
    "children": [
      {
        "nodeid": 1,
        "depth": 1,
        "split": "breakout",
        "split_condition": 0.50591594,
        "yes": 3,
        "no": 4,
        "missing": 3,
        "children": [
          {
            "nodeid": 3,
            "leaf": 0.0884473473
          },
          {
            "nodeid": 4,
            "depth": 2,
            "split": "breakout",
            "split_condition": 0.528378367,
            "yes": 7,
            "no": 8,
            "missing": 7,
            "children": [
              {
                "nodeid": 7,
                "leaf": -0.0599007308
              },
              {
                "nodeid": 8,
                "leaf": 0.00463675661
              }
            ]
          }
        ]
      },
      {
        "nodeid": 2,
        "depth": 1,
        "split": "width",
        "split_condition": 185,
        "yes": 5,
        "no": 6,
        "missing": 5,
        "children": [
          {
            "nodeid": 5,
            "leaf": -0.0248330813
          },
          {
            "nodeid": 6,
            "depth": 2,
            "split": "width",
            "split_condition": 293,
            "yes": 9,
            "no": 10,
            "missing": 9,
            "children": [
              {
                "nodeid": 9,
                "leaf": 0.0970277935
              },
              {
                "nodeid": 10,
                "leaf": 0.0222944729
              }
            ]
          }
        ]
      }
    ]
  },
  {
    "nodeid": 0,
    "depth": 0,
    "split": "width",
    "split_condition": 125,
    "yes": 1,
    "no": 2,
    "missing": 1,
    "children": [
      {
        "nodeid": 1,
        "depth": 1,
        "split": "pattern",
        "split_condition": 2,
        "yes": 3,
        "no": 4,
        "missing": 3,
        "children": [
          {
            "nodeid": 3,
            "depth": 2,
            "split": "diff",
            "split_condition": 0.301875889,
            "yes": 7,
            "no": 8,
            "missing": 7,
            "children": [
              {
                "nodeid": 7,
                "leaf": -0.0322934352
              },
              {
                "nodeid": 8,
                "leaf": -0.109573714
              }
            ]
          },
          {
            "nodeid": 4,
            "depth": 2,
            "split": "diff",
            "split_condition": 0.276687562,
            "yes": 9,
            "no": 10,
            "missing": 9,
            "children": [
              {
                "nodeid": 9,
                "leaf": -0.016995322
              },
              {
                "nodeid": 10,
                "leaf": 0.0312352777
              }
            ]
          }
        ]
      },
      {
        "nodeid": 2,
        "depth": 1,
        "split": "diff",
        "split_condition": 0.493918359,
        "yes": 5,
        "no": 6,
        "missing": 5,
        "children": [
          {
            "nodeid": 5,
            "depth": 2,
            "split": "diff",
            "split_condition": 0.442818731,
            "yes": 11,
            "no": 12,
            "missing": 11,
            "children": [
              {
                "nodeid": 11,
                "leaf": 0.00816915371
              },
              {
                "nodeid": 12,
                "leaf": -0.0172046367
              }
            ]
          },
          {
            "nodeid": 6,
            "depth": 2,
            "split": "width",
            "split_condition": 185,
            "yes": 13,
            "no": 14,
            "missing": 13,
            "children": [
              {
                "nodeid": 13,
                "leaf": 0.0170843247
              },
              {
                "nodeid": 14,
                "leaf": 0.0825305358
              }
            ]
          }
        ]
      }
    ]
  }
]
```
