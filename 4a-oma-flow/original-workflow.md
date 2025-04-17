# original-workflow.md

Here’s an example of a “Full Workflow Automation Example”

1. Execute Ansible URI module call to retrieve a JSON response body.
  1. Prompt: Using the following URL: https://www.frbservices.org, execute a get request and store the response in a register named ‘result’. In the request body include a username and password field that requires being passed as a form.
1. Create a Python filter to parse JSON structured objects(dictionaries).
  1. Prompt: Create a python filter named ‘deleteDataType’ that takes in two parameters, a dictionary and a data type. The filter will return an updated dictionary with the key-values corresponding with the data type removed.
     ```json
     {
         key1: int,
         key2: str,
         key3: dict
     }
     ```
1. Use the python filter from an ansible playbook on the above dictionary object with a data type parameter.
  1. Prompt: Use the ‘deleteDataType’ filter on the dictionary above with ‘str’ as a parameter and save it to a variable named ‘result’.
1. Send an email with the resulting dictionary.
  1. Prompt: Send an email to xyz@gmail.com with the result in the body.
