import json

type
    Message* = object
        username*: string
        message*: string

proc parseMessage*(data: string): Message =
    let dataJson = parseJson(data)
    result.username = dataJson["username"].getStr()
    result.message = dataJson["message"].getStr()

when isMainModule:
    block:
        let data = """{"username": "John", "message": "Hi!"}"""
        let parsed = parseMessage(data)
        doAssert parsed.username == "John"
        doAssert parsed.message == "Hi!"
        echo("All tests passed!")