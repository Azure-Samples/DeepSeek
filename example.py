# pip install azure-ai-inference azure-identity python-dotenv
import logging
import os

from azure.ai.inference import ChatCompletionsClient
from azure.ai.inference.models import SystemMessage, UserMessage
from azure.identity import DefaultAzureCredential
from dotenv import load_dotenv

load_dotenv()
logging.basicConfig(level=logging.WARNING)

# With Entra ID credential
client = ChatCompletionsClient(
    endpoint=os.environ["AZURE_AISERVICES_ENDPOINT"],
    credential=DefaultAzureCredential(),
    credential_scopes=["https://cognitiveservices.azure.com/.default"],
    model="DeepSeek-R1",
)

result = client.complete(
    messages=[
        SystemMessage(content="You are a helpful assistant."),
        UserMessage(content="How many languages are in the world?"),
    ],
    max_tokens=2048,
    stream=True,
)

for update in result:
    if update.choices:
        print(update.choices[0].delta.content, end="")
