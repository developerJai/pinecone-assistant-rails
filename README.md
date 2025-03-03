# README

* Ruby version: 3.3.3

* Rails version: 7.2.2

## .env setup
``
PINECONE_API_KEY=Your_Pinecone_API_Key
ASSISTANT_NAME=Your_Pinecone_Assistant_Name
``

## Setup Custom GPT Action:

```
{
  "openapi": "3.1.0",
  "info": {
    "title": "Pinecone Assistant API",
    "description": "API for interacting with a Pinecone Assistant to ask questions and receive answers.",
    "version": "1.0.0"
  },
  "servers": [
    {
      "url": "https://natureswarehouse.co"
    }
  ],
  "paths": {
    "/ask": {
      "post": {
        "summary": "Ask a question to the Pinecone Assistant",
        "description": "Send a question to the Pinecone Assistant and receive an answer.",
        "operationId": "askQuestion",
        "requestBody": {
          "description": "Question to ask the assistant",
          "required": true,
          "content": {
            "application/json": {
              "schema": {
                "type": "object",
                "properties": {
                  "question": {
                    "type": "string",
                    "description": "The question to ask the Pinecone Assistant."
                  }
                },
                "required": ["question"]
              }
            }
          }
        },
        "responses": {
          "200": {
            "description": "Successful response with the assistant's answer",
            "content": {
              "application/json": {
                "schema": {
                  "type": "object",
                  "properties": {
                    "answer": {
                      "type": "string",
                      "description": "The answer provided by the Pinecone Assistant."
                    }
                  }
                }
              }
            }
          },
          "400": {
            "description": "Bad request - typically when no question is provided",
            "content": {
              "application/json": {
                "schema": {
                  "type": "object",
                  "properties": {
                    "error": {
                      "type": "string",
                      "description": "Error message describing the issue with the request."
                    }
                  }
                }
              }
            }
          },
          "500": {
            "description": "Internal server error",
            "content": {
              "application/json": {
                "schema": {
                  "type": "object",
                  "properties": {
                    "error": {
                      "type": "string",
                      "description": "Error message describing the internal server error."
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  },
  "components": {
    "schemas": {}
  }
}
```