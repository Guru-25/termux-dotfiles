from pyrogram import Client

API_KEY = int(input("Enter api_id: "))
API_HASH = input("Enter api_hash: ")
with Client(name='user', in_memory=True, api_id=API_KEY, api_hash=API_HASH) as app:
    print(app.export_session_string())
