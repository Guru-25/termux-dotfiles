from pyrogram import Client, filters

print()
ses = input("Enter Session String: ")
api_id = int(input("Enter api_id: "))
api_hash = input("Enter api_hash: ")

app = Client(':memory:', session_string=ses, api_id=api_id, api_hash=api_hash)
with app as c:
    for h in c.search_messages(777000, query='Do not give this code to anyone', limit=1):
    	print()
    	print(h.text)