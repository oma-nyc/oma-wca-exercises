# IBM watsonx Code Assistant Prompting Guide: Practical hands-on

<img src="https://github.com/user-attachments/assets/d44d99e9-8d0b-42f8-a0af-639145e79839" width="300" align="left" alt="prompt-guide-8">
  
▶️ _A code editor extension that captures and transmits prompt and context information for inference and captures feed-back from the user to improve model and service quality._

▶️ _An inference pipeline for combining and processing natural language and code to get code suggestions from a Large Language Models (LLMs)._

▶️ _A content matching pipeline that finds training examples that are similar to the code suggestions._

▶️ _An analysis framework that collects and processes feedback data to make it consumable by a wide range of analysis tools, ultimately for the purpose of improving model quality and user experience._

One of the key advantages of watsonx Code Assistant is its ability to leverage **context** and industry **best practices** to generate intelligent suggestions. As you use watsonx Code Assistant, you'll notice that it incorporates context from the overall source file and the specific paragraph to provide more accurate recommendations. It analyzes the code you have already written and suggests improvements or additions based on established best practices.

---

## Here are a few key examples of simple ways to enhance your experience👇

### Use personas or role names to provide context

The LLM supporting watsonx Code Assistant is tuned to support 116 different programming languages. When prompting for content, explanations, or opportunities for improvement, it's important to provide context that includes the role or persona that would otherwise be expected to produce the content without AI. 

Let's start with a basic query for language recommendations. Suppose you work for an operational technology company that produces embedded systems, sensors, and other instruments. You want to implement the UNIX `cat` command and ask the following question:

**Good:** `Between C, C++, and Ada, which language is best for implementing the UNIX "cat" command?`

This is a good start, and one improvement would be to prepend a sentence that provides more context. Consider the following:

**Better:** `You are an embedded systems programmer. Between C, C++, and Ada, which language is best for implementing the UNIX "cat" command?`

This is better because the needed skillset is now much clearer. Finally, it would help to include any specific requirements. For example:

**Best:** `You are an embedded systems programmer building secure fielded instruments. Between C, C++, and Ada, which language is best for implementing the UNIX "cat" command?`

This is better than **Better** because the prompt makes visible the security needs, thus avoiding a follow up prompt such as, `What if I need robust security capabilities?`

<br>

### Avoid "give me a rock / no, not that rock" by starting with specific details, to reduce iterations

Remember when you first learned how to code? Perhaps your instructor said that computers will do exactly what you tell them to do. LLMs aren't very different in that regard, so take the time to add important details to your prompts. For example:

**Good:** `You are an Ansible engineer. Write a playbook that deploys IBM MQ on OpenShift.`

This is also a good start, but you might get content that supports older versions of OpenShift like OCP 3. If you need OpenShift 4 support, modify your prompt by adding a "4" at the end.

**Better:** `You are an Ansible engineer. Write a playbook that deploys IBM MQ on OpenShift 4.`

This is more specific, but then you notice the proposed content suggests passing OpenShift CLI commands instead of using a bespoke Ansible module, which may not be idempotent. Further, the proposed content uses short module names which is a linting violation; and you remember that, in OpenShift, services are not exposed as routes by default.

**Best:** `You are an Ansible engineer. Write a playbook that deploys IBM MQ on OpenShift 4 with an exposed route. Use the kubernetes.core collection. Use fully qualified collection names.`

By being more specific, you can generate more useful code and spend less time correcting. The good news here is that watsonx Code Assistant retains context in each chat, which means you can propose corrections conversationally instead of having to rewrite the entire prompt.

### Parameterize Parameterize Parameterize

If you use hard-coded information in your prompt, there's an excellent chance the response will be anonymized or otherwise different from what you prompted. For example, if you prompt with:

```bash
You are a Cisco NXOS engineer. Write a script that sets the secondary interface IPv4 address for Ethernet1/2 to 194.99.2.254/24.
```

You might get a response that uses a different number in the fourth octet of the IPv4 address, or a different IPv4 address entirely. Consider this improvement:

```bash
You are a Cisco NXOS engineer. Write a script that sets the secondary interface IPv4 address for a parameterized layer 1 interface name to a parameterized IPv4 address formatted as CIDR.
```

You could even give an example:

```bash
You are a Cisco NXOS engineer. Write a script that sets the secondary interface IPv4 address for a parameterized layer 1 interface name like "Ethernet1/2" to a parameterized IPv4 address formatted as CIDR like "192.168.1.200/24."
```

Experiment with different approaches, but remember that the use of hard-coded data is an anti-pattern.


### Generating API version specific code.

When working with certain APIs such as Azure API, the code  will use an API with a specific version date:

The Prompt:

```
Write a bicep to create a keyvault
```

The code output generated by WCA includes the following dated Azure API version:

```
...
resource keyVault 'Microsoft.KeyVault/vaults@2019-09-01' = {
  name: keyVaultName

```

But is that the newest API version available in the training data? We can ask the model:

```
List only the dates of the KeyVault Azure API available to you.
```

We receive the following output:

```
Here are the dates for the available Key Vault API versions as of April 2024:

2015-06-01
2016-10-01
2017-09-01
2018-02-14
2018-11-30
2019-09-01
2019-10-01
2020-01-01
2021-04-01
2021-10-01
2023-02-01
```

So we can take this information and request that a specific API version is used:

The Prompt:

```
Write a bicep to create a keyvault using this API version Microsoft.KeyVault/vaults@2023-02-01
```

And the output:

```
...
resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' 
```



### Also good to remember

**Neatness counts!** Be sure to capitalize the beginning of your sentences, separate sections using commas, and end sentences with periods or question marks. You may even find that good manners get you different results: try using "please" and see what happens!

**Write down your good prompts!** It's good practice to create a simple `prompts.md` file to keep your prompts in after they are producing good results. You can use them to test updated LLMs as well.

## Test your knowledge so far: Personas & Details

Here's another example, where we need to refactor an Azure bicep.

**Initial attempt:** Update the @deploy.bicep for keyvault to include an event grid system topic which will stream to an azure logic app uri

Based on the guidelines discussed above, how might you improve this prompt?

**Your attempt:**


---

<img src="https://github.com/user-attachments/assets/6ac1505e-ac0a-4cf8-bf8f-74cb78a4e9ca" width="290" align="right" alt="prompt-guide-10">

**_Final Tips for an Optimal Usability Experience_**

**1** - _Although generative AI can be incredibly useful, it can sometimes produce answers that aren't exactly what you're looking for, or it can give you suggestions that seem off track. If this happens, don't hesitate to rewrite or reformulate your request. Your opinion is fundamental in guiding the AI to provide more precise, meaningful and relevant answers._

**2** - _Do not hesitate to utilize extensive prompts; in certain scenarios, this approach can enhance the accuracy of prompt suggestions generated by the AI. In summary, a well-crafted prompt is crucial for optimal outcomes._

---
