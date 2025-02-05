# DeepSeek

The DeepSeek-R1 model is now available on [Azure](https://azure.microsoft.com/blog/deepseek-r1-is-now-available-on-azure-ai-foundry-and-github/). This repo provides links to DeepSeek-related Azure samples in various languages.

## Python

Use [DeepSeek on Azure with Python](https://github.com/Azure-Samples/deepseek-python), with Azure Container Apps.

## JavaScript

Use [DeepSeek on Azure with JavaScript](https://github.com/Azure-Samples/deepseek-js), with Azure Functions.

For more samples, refer to [Others](https://github.com/Azure-Samples/deepseek-azure-javascript), with OpenAI Node.js SDK, LangChain.js or Llamaindex.TS.

## Java

A Spring Boot project that demonstrates how to use [DeepSeek-R1 on Azure with Java (LangChain4j)](https://github.com/Azure-Samples/DeepSeek-on-Azure-with-LangChain4j). These either run locally (using Ollama) or in the Azure cloud (using [GitHub Models](https://github.blog/changelog/2025-01-29-deepseek-r1-is-now-available-in-github-models-public-preview/)).

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
    azd env get-value AZURE_AISERVICES_ENDPOINT
    ```
