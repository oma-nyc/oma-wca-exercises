# watsonx Code Assistant Guide

## Table of Contents
- [watsonx Code Assistant Guide](#watsonx-code-assistant-guide)
  - [Table of Contents](#table-of-contents)
  - [Overview](#overview)
  - [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Setup](#setup)
  - [Available Demos](#available-demos)
  - [Experiments](#experiments)
  - [Best Practices](#best-practices)
  - [Resources](#resources)

## Overview

watsonx Code Assistant (WCA) is an AI-powered coding assistant that helps developers write, understand, and transform code. This guide provides information on how to use the WCA demos and experiments in this repository.

## Getting Started

### Prerequisites

- Microsoft Visual Studio Code
- IBM watsonx Code Assistant extension for VS Code
- IBM watsonx Code Assistant subscription with API key configured

### Setup

1. Install the IBM watsonx Code Assistant extension for VS Code
2. Configure your API key in the extension settings
3. Clone this repository and navigate to the `wca` directory

## Available Demos

The `wca/demos` directory contains structured demos showcasing specific use cases:

- **ai-venv**: Demonstrates using WCA with virtual environments
- **db-explanation**: Shows how WCA can explain database concepts and queries
- **unix-cat-c**: Illustrates implementing a Unix `cat` command in C with WCA assistance
- **bladelogic**: Examples of using WCA with BladeLogic automation scripts

Each demo directory contains:
- A README.md with instructions
- Sample code and prompts
- Expected outputs or results

## Experiments

The `wca/experiments` directory contains experimental projects and proof of concepts:

- **atl-experiments**: Experiments conducted in Atlanta
- **rva-experiments**: Experiments conducted in Richmond
- **vienna/4gp**: Vienna-specific experiments for general programming

These experiments demonstrate more advanced or exploratory uses of WCA.

## Best Practices

When using watsonx Code Assistant:

1. **Be specific in your prompts**: Clearly state what you want to achieve
2. **Provide context**: Include relevant code snippets or requirements
3. **Iterate**: Refine your prompts based on the responses
4. **Verify**: Always review and test the generated code

## Resources

- [Official watsonx Code Assistant Documentation](https://www.ibm.com/products/watsonx-code-assistant)
- [Prompting Guide](./prompting-guide/4a-prompting-guide.md)
- [IBM Developer Portal](https://developer.ibm.com/)