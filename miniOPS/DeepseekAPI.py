from openai import OpenAI

client = OpenAI(api_key="sk-eff5a74fd41644a0b13c885432ec0733", base_url="https://api.deepseek.com")

response = client.chat.completions.create(
    model="deepseek-chat",
    messages=[
        {"role": "system", "content": "You are a helpful assistant"},
        {"role": "user", "content": "介绍一下天津的美食"},
    ],
    stream=False
)

print(response.choices[0].message.content)