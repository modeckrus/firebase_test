class FirestoreToJson {
  final fquerry = '''
  {
  "name": "projects/testplatform-modeck/databases/(default)/documents/test/test",
  "fields": {
    "bool": {
      "booleanValue": true
    },
    "ref": {
      "referenceValue": "projects/testplatform-modeck/databases/(default)/documents/huis/yazza"
    },
    "number": {
      "doubleValue": 12.2
    },
    "array": {
      "arrayValue": {
        "values": [
          {
            "stringValue": "zero"
          },
          {
            "integerValue": "80"
          }
        ]
      }
    },
    "timestamp": {
      "timestampValue": "2020-11-22T18:34:00Z"
    },
    "map": {
      "mapValue": {
        "fields": {
          "huis": {
            "mapValue": {
              "fields": {
                "huis": {
                  "stringValue": "yzza"
                }
              }
            }
          },
          "string": {
            "stringValue": "Teststring"
          }
        }
      }
    },
    "geo": {
      "geoPointValue": {
        "latitude": 1,
        "longitude": 2
      }
    },
    "null": {
      "nullValue": null
    },
    "string": {
      "stringValue": "testString"
    }
  },
  "createTime": "2020-05-04T15:06:08.148161Z",
  "updateTime": "2020-11-22T21:46:37.075249Z"
}


  ''';
  static getFireStoreProp(dynamic value) {
    const prop = {
      'arrayValue': 1,
      'bytesValue': 1,
      'booleanValue': 1,
      'doubleValue': 1,
      'geoPointValue': 1,
      'integerValue': 1,
      'mapValue': 1,
      'nullValue': 1,
      'referenceValue': 1,
      'stringValue': 1,
      'timestampValue': 1
    };
  }
}
