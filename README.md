# DeepSeek

The DeepSeek-R1 model is now available on [Azure](https://azure.microsoft.com/blog/deepseek-r1-is-now-available-on-azure-ai-foundry-and-github/). This repo provides links to DeepSeek-related Azure samples in various languages.

## Deploy DeepSeek on Azure

1. Login to Azure:

    ```shell
    azd auth login
    ```

2. Provision the AIServices resource with a DeepSeek-R1 deployment:

    ```shell
    azd provision
    ```

3. See the endpoint by running:

    ```shell
    azd env get-value https://jiauq6f53bo7o-aiservices.cognitiveservices.azure.com/
    ```

## JavaScript

Use [DeepSeek on Azure with JavaScript/TypeScript](https://github.com/Azure-Samples/deepseek-azure-javascript), with OpenAI Node.js SDK or LangChain.js

## Java

A Spring Boot project that demonstrates how to use [DeepSeek-R1 on Azure with Java (LangChain4j)](https://github.com/Azure-Samples/DeepSeek-on-Azure-with-LangChain4j). These either run locally (using Ollama) or in the Azure cloud (using [GitHub Models](https://github.blog/changelog/2025-01-29-deepseek-r1-is-now-available-in-github-models-public-preview/)).
