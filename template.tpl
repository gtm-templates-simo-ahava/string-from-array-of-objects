___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "categories": [
    "UTILITY",
    "TAG_MANAGEMENT"
  ],
  "displayName": "String from array of objects",
  "__wm": "VGVtcGxhdGUtQXV0aG9yX1N0cmluZy1mcm9tLWFycmF5LW9mLW9iamVjdHMtU2ltby1BaGF2YQ\u003d\u003d",
  "description": "Create a concatenated string of a key in an array of objects.",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "LABEL",
    "name": "helpText",
    "displayName": "Use this variable to turn an array of objects (e.g. \u003cstrong\u003e[{id: \u0027123\u0027, name: \u0027first\u0027},{id: \u0027234\u0027, name: \u0027second}]\u003c/strong\u003e) into a string (e.g. \u003cstrong\u003e\u0027123,234\u0027\u003c/strong\u003e)."
  },
  {
    "type": "SELECT",
    "name": "inputArray",
    "displayName": "Input array",
    "macrosInSelect": true,
    "selectItems": [],
    "simpleValueType": true
  },
  {
    "type": "TEXT",
    "name": "keyToConcatenate",
    "displayName": "Object property",
    "simpleValueType": true,
    "help": "Choose a key that can be found in the objects within the array. The values of this key will be used to create the string.",
    "valueHint": "e.g. id",
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ],
    "alwaysInSummary": true
  },
  {
    "type": "TEXT",
    "name": "delimiter",
    "displayName": "Delimiter",
    "simpleValueType": true,
    "help": "Choose a delimiter symbol or string used to separate each value in the string.",
    "defaultValue": ",",
    "alwaysInSummary": true
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

/* GTMTEMPLATESCOM_CHECKSUM:[5137355874762752,1560849757732,942c276e7337c95ce19c733c46ed8899] */

const callInWindow = require('callInWindow');
const getType = require('getType');

const inputArray = data.inputArray;
const keyToConcatenate = data.keyToConcatenate;
const delimiter = data.delimiter;

// If not an array, return undefined
if (getType(inputArray) !== 'array') {
  return;
}

return inputArray
  .map(obj => obj[keyToConcatenate])
  .filter(obj => obj)
  .join(delimiter);


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "access_globals",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keys",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "toString.call"
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios:
- name: Return undefined if not array
  code: |-
    // Call runCode to run the template's code.
    const mockData = {
      inputArray: 'notAnArray',
      keyToConcatenate: 'name',
      delimiter: ','
    };

    const variableResult = runCode(mockData);

    // Verify that the variable returns a result.
    assertThat(variableResult).isEqualTo(undefined);
- name: Return empty string if no objects in array
  code: |-
    // Call runCode to run the template's code.
    const mockData = {
      inputArray: [1, 2, 3],
      keyToConcatenate: 'name',
      delimiter: ','
    };

    const expected = '';

    const variableResult = runCode(mockData);

    // Verify that the variable returns a result.
    assertThat(variableResult).isEqualTo(expected);
- name: Return empty string if objects in array do not have the key
  code: |-
    // Call runCode to run the template's code.
    const mockData = {
      inputArray: [{id: '123'},{category: 'shoes'}],
      keyToConcatenate: 'name',
      delimiter: ','
    };

    const expected = '';

    const variableResult = runCode(mockData);

    // Verify that the variable returns a result.
    assertThat(variableResult).isEqualTo(expected);
- name: Return concatenated string with delimiter for valid object keys
  code: |-
    // Call runCode to run the template's code.
    const mockData = {
      inputArray: [{name: 'firstName'},{name: 'secondName'}],
      keyToConcatenate: 'name',
      delimiter: ','
    };

    const expected = 'firstName,secondName';

    const variableResult = runCode(mockData);

    // Verify that the variable returns a result.
    assertThat(variableResult).isEqualTo(expected);


___NOTES___

Created on 22/05/2019, 10:54:06


