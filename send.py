import requests

while True:
    key = input('Search... ')
    request = requests.get(f'http://127.0.0.1:8000/search/?q={key}')
    request.text
    response = request.json()
    if 'error' in response:
        print(response['error'])
        continue
    else:
        for i in response:
            title = i['title']
            content = i['content']

            print(
                f"""
                Title: {title},
                Content: {content},
                """
            )
        break
