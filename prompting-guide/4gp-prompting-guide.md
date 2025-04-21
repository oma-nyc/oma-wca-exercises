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



### Encapsulate separate contexts into separate chats

The IBM watsonx Code Assistant extension for Microsoft VS Code is based on a chat-oriented core. When you start a new chat, there is no context until after you have submitted your first prompt. Using the context and persona practices above, you can establish context early and link to specific files in your repo using `@<filename>`. Your subsequent prompts may then refer to previous outputs, and you can use relative language without needing to re-input your progress or generated content. 

For example, given the following initial prompt:

```txt
You are an Ansible engineer. Begin developing a new Ansible role called mq-ocp that deploys IBM MQ to OpenShift 4 with an exposed route. Use the kubernetes.core collection. Use fully qualified collection names. Use parameterization for the kubernetes and MQ resources wherever possible. Format the output as tasks only, suitable for tasks/main.yml.
```

Once you are happy with the generated content, you can follow up with subsequent prompts like the following:

```txt
Generate defaults/main.yml.

Generate argSpec.

Generate meta/main.yml.

Generate a README.md that includes a synopsis, prerequisites, dependencies, up & running, task explanations, parameter explanations, author, and license information.

Generate a top-level play called ibm-mq-day0-playbook.yml that runs this role on an inventory called rhel9Servers.
```

**NOTE:** Before you start a new coding session, be sure to start a new chat if you need to start from a clean slate!

### Also good to remember

**Neatness counts!** Be sure to capitalize the beginning of your sentences, separate sections using commas, and end sentences with periods or question marks. You may even find that good manners get you different results: try using "please" and see what happens!

**Write down your good prompts!** It's good practice to create a simple `prompts.md` file to keep your prompts in after they are producing good results. You can use them to test updated LLMs as well.

## Test your knowledge so far

Here are some example prompts for you to consider. First, how might you consolidate these two prompts into one, and then how would you improve the final version? What might you need to clarify later?

```txt
Update the @deploy.bicep for keyvault to include an event grid system topic which will stream to an azure logic app uri

The section above has a source and topictype missing. Can you please update this to include those parameters?
```

Consider this more complex prompt to build an SSH factory using Rust. What do you notice about it? How specific is it? What would you change?

```txt
You are a Rust programmer. Generate a Rust struct named SshFactory for managing SSH connections. The struct should have fields for inventory, a flag to forward the SSH agent, and an optional login password. Implement the ConnectionFactory trait with methods get_local_connection and get_connection to create local and remote SSH connections, respectively. Use the ssh2 crate for SSH functionality and ensure the code is thread-safe with appropriate use of Arc and RwLock.
```

---

<img src="https://github.com/user-attachments/assets/6ac1505e-ac0a-4cf8-bf8f-74cb78a4e9ca" width="290" align="right" alt="prompt-guide-10">

**_Final Tips for an Optimal Usability Experience_**

**1** - _Although generative AI can be incredibly useful, it can sometimes produce answers that aren't exactly what you're looking for, or it can give you suggestions that seem off track. If this happens, don't hesitate to rewrite or reformulate your request. Your opinion is fundamental in guiding the AI to provide more precise, meaningful and relevant answers._

**2** - _Do not hesitate to utilize extensive prompts; in certain scenarios, this approach can enhance the accuracy of prompt suggestions generated by the AI. In summary, a well-crafted prompt is crucial for optimal outcomes._




---
# Persona‑Based Prompting Guide suggestions

Use this cheat‑sheet when you need quick, clear prompts for IBM watsonx Code Assistant.

---

## Why personas help

- Tell the model **who is speaking** and **what matters**.
- Reduce back‑and‑forth by embedding context (role, domain, constraints) in one line.

---

## Build a strong persona line

| Element | Example |
|---------|---------|
| **Role** | backend developer, site‑reliability engineer |
| **Seniority** | junior, senior, principal |
| **Domain** | fintech, healthcare, edge devices |
| **Key constraints** | FIPS, low latency, 256 MB RAM cap |
| **Audience / voice** | mentoring a junior, writing a blog post |

Combine only what drives the answer. Extra words add noise.

---

## Prompt progression patterns

### 1 – Terraform module

| Level | Prompt |
|-------|--------|
| Good | `Write Terraform to deploy an S3 bucket.` |
| Better | `You are a cloud engineer. Write Terraform to deploy an encrypted S3 bucket.` |
| Best | `You are a senior cloud engineer in a healthcare firm. Write Terraform that deploys an S3 bucket with SSE‑KMS, public access blocked, and versioning on.` |

### 2 – Python ETL script

```
Good   : Write a Python script that loads a CSV into Postgres.
Better : You are a data engineer. Write a Python script that loads a CSV into Postgres using psycopg2.
Best   : You are a data engineer at a pharma company. Write a Python script that loads a large CSV into Postgres using COPY, tracks row count, and logs failures to CloudWatch.
```

### 3 – Security review

```
Good   : Review this Node.js code for bugs.
Better : You are an application security auditor. Review this Node.js code for common OWASP issues.
Best   : You are an application security auditor preparing a PCI report. Review this Node.js Express handler for OWASP Top 10 issues and suggest fixes inline.
```

### 4 – Postgres tuning

| Level | Prompt |
|-------|--------|
| Good | `Suggest Postgres settings for high load.` |
| Better | `You are a database administrator. Suggest Postgres settings for steady 5 k writes per second.` |
| Best | `You are a senior DBA at an ad‑tech firm. Suggest Postgres 15 settings to sustain 5 k writes per second on an m6i.2xlarge, 64 GB RAM, 2 TB gp3.` |

---

## Quick templates

```txt
You are a <role> focused on <domain>.
Task: <what you need>.
Constraints: <list>.
Output: <code / steps / table>.
```

```txt
Act as a <seniority> <role>.
Goal: <create / improve / review>.
Follow <style guide or standard>.
```

Copy, tweak, reuse.

---

## Extra tips

- Keep sentences short.
- Capitalize and punctuate.
- Use parameter names instead of hard‑coding secrets or IPs.
- Store proven prompts in `prompts.md` for easy reuse.
- Start a **new chat** when you switch to a different project.

---


# Persona‑Based Prompting Guide

Use this cheat‑sheet when you need quick, clear prompts for IBM watsonx Code Assistant.

---

## Why personas help

- Tell the model **who is speaking** and **what matters**.
- Reduce back‑and‑forth by embedding context (role, domain, constraints) in one line.

---

## Build a strong persona line

| Element | Example |
|---------|---------|
| **Role** | backend developer, site‑reliability engineer |
| **Seniority** | junior, senior, principal |
| **Domain** | fintech, healthcare, edge devices |
| **Key constraints** | FIPS, low latency, 256 MB RAM cap |
| **Audience / voice** | mentoring a junior, writing a blog post |

Combine only what drives the answer. Extra words add noise.

---

## Prompt progression patterns

### 1 – Terraform module

| Level | Prompt |
|-------|--------|
| Good | `Write Terraform to deploy an S3 bucket.` |
| Better | `You are a cloud engineer. Write Terraform to deploy an encrypted S3 bucket.` |
| Best | `You are a senior cloud engineer in a healthcare firm. Write Terraform that deploys an S3 bucket with SSE‑KMS, public access blocked, and versioning on.` |

### 2 – Python ETL script

```
Good   : Write a Python script that loads a CSV into Postgres.
Better : You are a data engineer. Write a Python script that loads a CSV into Postgres using psycopg2.
Best   : You are a data engineer at a pharma company. Write a Python script that loads a large CSV into Postgres using COPY, tracks row count, and logs failures to CloudWatch.
```

### 3 – Security review

```
Good   : Review this Node.js code for bugs.
Better : You are an application security auditor. Review this Node.js code for common OWASP issues.
Best   : You are an application security auditor preparing a PCI report. Review this Node.js Express handler for OWASP Top 10 issues and suggest fixes inline.
```

### 4 – Postgres tuning

| Level | Prompt |
|-------|--------|
| Good | `Suggest Postgres settings for high load.` |
| Better | `You are a database administrator. Suggest Postgres settings for steady 5 k writes per second.` |
| Best | `You are a senior DBA at an ad‑tech firm. Suggest Postgres 15 settings to sustain 5 k writes per second on an m6i.2xlarge, 64 GB RAM, 2 TB gp3.` |

---

## Quick templates

```txt
You are a <role> focused on <domain>.
Task: <what you need>.
Constraints: <list>.
Output: <code / steps / table>.
```

```txt
Act as a <seniority> <role>.
Goal: <create / improve / review>.
Follow <style guide or standard>.
```

Copy, tweak, reuse.

---

## Extra tips

- Keep sentences short.
- Capitalize and punctuate.
- Use parameter names instead of hard‑coding secrets or IPs.
- Store proven prompts in `prompts.md` for easy reuse.
- Start a **new chat** when you switch to a different project.

---

## Avoid "Give me a rock / no, not that rock" – be specific

When a prompt is vague, the assistant guesses and you burn time correcting it.

### Quick checklist

- State **what** you need, **how** it will be used, and **where** it runs.
- Add versions, limits, or standards.
- Mark parameters instead of hard‑coding.

### Prompt ladders

#### 1 – Kubernetes manifest

```
Good   : Generate a Deployment for nginx.
Better : Generate a Kubernetes Deployment for nginx 1.25.
Best   : You are a platform engineer. Generate a Kubernetes Deployment for nginx 1.25 in namespace web, 2 replicas, CPU 250m, memory 256Mi, plus a ClusterIP Service.
```

#### 2 – Java unit test

| Level | Prompt |
|-------|--------|
| Good | `Write a JUnit test for my Calculator class.` |
| Better | `You are a Java developer. Write a JUnit 5 test for the add() method in Calculator.` |
| Best | `You are a senior Java developer. Write a JUnit 5 test for Calculator.add() covering positive, negative, and overflow cases. Mock external calls with Mockito.` |

#### 3 – PowerShell backup script

```
Good   : Create a script to back up files.
Better : You are a sysadmin. Create a PowerShell script that zips C:/Logs nightly.
Best   : You are a sysadmin. Create a PowerShell script that zips C:/Logs nightly, retains 30 archives, and writes to the Windows event log.
```

### Templates to tighten your ask

```txt
Task: <do X> on <tool / version> under <constraints>.
Return: <



Happy prompting!

