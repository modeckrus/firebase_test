import 'dart:convert';

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
        "latitude",
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
  static String getFireStoreProp(Map<String, dynamic> value) {
    const props = [
      'arrayValue',
      'bytesValue',
      'booleanValue',
      'doubleValue',
      'geoPointValue',
      'integerValue',
      'mapValue',
      'nullValue',
      'referenceValue',
      'stringValue',
      'timestampValue',
    ];
    return value.keys.firstWhere((element) => props.contains(element));
  }

  static iterateMap(Map<String, dynamic> json) {}

  static firestoreParser(Map<String, dynamic> value) {
    iterateMap(value);
    // final prop = getFireStoreProp(value['value']);
    // var result;
    // if (prop == 'doubleValue') {
    //   result = double.parse(value[prop]);
    // }
    // if (prop == 'integerValue') {
    //   result = int.parse(value[prop]);
    // }
    // if (prop == 'arrayValue') {
    //   result = (value[prop] && value[prop].values);
    // }
    // return result;
  }
}
