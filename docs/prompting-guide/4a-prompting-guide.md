# Ansible Lightspeed Prompting Guide: Practical hands-on

<img src="https://github.com/user-attachments/assets/d44d99e9-8d0b-42f8-a0af-639145e79839" width="300" align="left" alt="prompt-guide-8">
  
▶️ _A code editor extension that captures and transmits prompt and context information for inference and captures feed-back from the user to improve model and service quality._

▶️ _An inference pipeline for combining and processing natural language and Ansible-YAML to get code suggestions from a Large Language Models (LLMs)._

▶️ _A content matching pipeline that finds training examples that are similar to the code suggestions._

▶️ _An analysis framework that collects and processes feedback data to make it consumable by a wide range of analysis tools, ultimately for the purpose of improving model quality and user experience._

One of the key advantages of Ansible Lightspeed is its ability to leverage **context** and industry **best practices** to generate intelligent suggestions. As you use Ansible Lightspeed, you'll notice that it incorporates context from the overall Playbook and the specific task to provide more accurate recommendations. It analyzes the code you have already written and suggests improvements or additions based on established best practices.

---

### Here are a few key examples for your reference to enhance your experience👇
**1. The clearer your Ansible task description, the better the inline prompt suggestions.**
```
- name: Ensure the RPM package [yum-utils] is installed on RHEL Linux servers
      # Content suggestion provided by Ansible Lightspeed
      when: ansible_os_family == "RedHat"
      ansible.builtin.package:
        name: yum-utils
        state: present

- name: Execute command needs-restarting -r to check if reboot is required
    # Content suggestion provided by Ansible Lightspeed
    ansible.builtin.command: needs-restarting -r
    register: reboot_required_result
    changed_when: false
    failed_when: false
```
<br>

**2. Provide as much detail as possible in the task description, especially when copying/moving source and destination locations.**
```
- name: Copy chroot_tasks.j2 to dest as chroot_tasks.sh on remote host(s)
      # Content suggestion provided by Ansible Lightspeed
      ansible.builtin.template:
        src: chroot_tasks.j2
        dest: /tmp/chroot_tasks.sh
        mode: '0755'
        owner: root
        group: root
```

<br>

**3. If you require an item to be present at its destination, you essentially need to command its placement there.**
```
- name: Ensure /var/tmp/ansible is in place
      # Content suggestion provided by Ansible Lightspeed
      ansible.builtin.file:
        path: /var/tmp/ansible
        state: directory
        mode: '0755'
```

<br>

**4. If the suggestions or prompts don't return with the desired variable name, you can accept the suggestions and subsequently modify the variable name as usual.**
```
- name: Copy httpd.conf.j2 template to /etc/httpd/conf/
    # Content suggestion provided by Ansible Lightspeed
    ansible.builtin.template:
    src: httpd.conf.j2
    dest: /etc/httpd/conf/httpd.conf
    mode: '0644'
    owner: root
    group: root
```

<br>

**5. Take the opportunity to create tasks with register data that was generated in the previous task.**
```
- name: "Get subscription status - Check if the system is already registered"
      # Content suggestion provided by Ansible Lightspeed
      ansible.builtin.command: subscription-manager status
      register: subscription_status
      changed_when: false
      failed_when: false
```

<br>

**6. Ensure that if you require variables to be populated with values from previously filled variables, you declare this in the vars file and specify it in the Task description field.**
```
vars:
    oscap_rhel_pkgs:
        - openscap
        - openscap-scanner
        - openscap-utils
        - scap-security-guide
        - mailx

    - name: Ensure OpenSCAP RPM Packages are installed for {{ oscap_rhel_pkgs }}
      # Content suggestion provided by Ansible Lightspeed
      ansible.builtin.package:
        name: "{{ oscap_rhel_pkgs }}"
        state: present
```

<br>

**7. To automatically fill a service or content with a value from a variable, specify this requirement clearly in the task description.**
```
vars:
    welcome_note: "Welcome to Demo Web Server"

    - name: Create new file /var/www/html/index.html with content of var welcome_note
        # Content suggestion provided by Ansible Lightspeed
        ansible.builtin.copy:
        content: "{{ welcome_note }}"
        dest: /var/www/html/index.html
```

<br>

**8. Ensure that clear and objective specifications are provided, especially when certain conditions must be met for a task to be completed, as commonly utilized in the `when:` condition.**
```
- name: Inserts/replaces the openat rule in /etc/audit/audit.rules when on x86_64
      # Content suggestion provided by Ansible Lightspeed
      ansible.builtin.lineinfile:
        path: /etc/audit/audit.rules
        regexp: '^.*openat.*'
        line: '-a always,exit -F arch=b64 -S openat'
        state: present
      when: ansible_architecture == "x86_64"
```

<br>

**9. If any inline suggestions don't come up with the variable name you want, instead of accepting it and then changing the name of that variable, you can try changing the task name, there are several synonyms or alternative phrases that you can use it.**
```
- name: Print on screen the upgrade_inhibited var
    ansible.builtin.debug:
    msg: "{{ upgrade_inhibited }}"

- name: Debug the upgrade_inhibited var
    ansible.builtin.debug:
    msg: "{{ upgrade_inhibited }}"

- name: Output upgrade_inhibited var
    ansible.builtin.debug:
    msg: "{{ upgrade_inhibited }}"

- name: Present upgrade_inhibited var
    ansible.builtin.debug:
    msg: "{{ upgrade_inhibited }}"

- name: Create /var/tmp/ansible directory if it does not exist
    ansible.builtin.file:
    path: /var/tmp/ansible
    state: directory
    mode: '0755'

- name: Generate /var/tmp/ansible directory if it does not exist
    ansible.builtin.file:
    path: /var/tmp/ansible
    state: directory
    mode: '0755'

- name: Produce /var/tmp/ansible directory if it does not exist
    ansible.builtin.file:
    path: /var/tmp/ansible
    state: directory
    mode: '0755'

- name: Form /var/tmp/ansible directory if it does not exist
    ansible.builtin.file:
    path: /var/tmp/ansible
    state: directory
    mode: '0755'

- name: Craft /var/tmp/ansible directory if it does not exist
    ansible.builtin.file:
    path: /var/tmp/ansible
    state: directory
    mode: '0755'

- name: Build /var/tmp/ansible directory if it does not exist
    ansible.builtin.file:
    path: /var/tmp/ansible
    state: directory
    mode: '0755'

- name: Ensure /var/tmp/ansible is in place
    ansible.builtin.file:
    path: /var/tmp/ansible
    state: directory
    mode: '0755'

- name: Guarantee /var/tmp/ansible is in place
    ansible.builtin.file:
    path: /var/tmp/ansible
    state: directory
    mode: '0755'

- name: Ensure NTP service is running on RedHat Server(s)
    ansible.builtin.service:
    name: ntpd
    state: started
    enabled: true
    when: ansible_os_family == "RedHat"
```

<br>

**10. If you want to use values in a variable, you can call it in a few ways calling `{{ <VARIABLE_NAME> }}`, `var`, `variable` and so on...**
```
- name: Start and enable {{ wordpress_app }} services
      # Content suggestion provided by Ansible Lightspeed
      ansible.builtin.service:
        name: "{{ item }}"
        state: started
        enabled: true
      loop:
        - "{{ wordpress_app }}"
```

<br>

**11. Previously highlighted, generative AI demonstrates robust contextual understanding. Consequently, when addressing specific tasks or activities, the AI adeptly maintains and adheres to established contextual parameters.**
```
- name: Check if /var/lib/pgsql/data exists
    # Content suggestion provided by Ansible Lightspeed
    ansible.builtin.stat:
    path: /var/lib/pgsql/data
    register: var_lib_pgsql_data

- name: End play if /var/lib/psql/data does not exist
    # Content suggestion provided by Ansible Lightspeed
    ansible.builtin.meta: end_play
    when: not var_lib_pgsql_data.stat.exists

- name: Take a Backup of file /var/lib/pgsql/data
    # Content suggestion provided by Ansible Lightspeed
    ansible.builtin.copy:
    src: /var/lib/pgsql/data
    dest: /var/lib/pgsql/data.bak
    remote_src: true

- name: Remove the file /var/lib/pgsql/data after backup
    # Content suggestion provided by Ansible Lightspeed
    ansible.builtin.file:
    path: /var/lib/pgsql/data
    state: absent

- name: Get all mountpoints with noexec option
    # Content suggestion provided by Ansible Lightspeed
    ansible.builtin.shell: mount | grep noexec
    register: mountpoints

- name: Remount noexec partitions with exec option if it's found any
    # Content suggestion provided by Ansible Lightspeed
    ansible.posix.mount:
    path: "{{ item }}"
    state: remounted
    src: "{{ item }}"
    fstype: "{{ item }}"p
    opts: exec
    when: mountpoints.stdout | length > 0
    loop: "{{ mountpoints.stdout_lines |flatten(levels=1) }}"
```

<br>

**12. If you require the execution of any module or command by the Ansible Controller node, ensure a clear and explicit specification.**
```
- name: Send an e-mail with official module using the Ansible controller node without superuser
    # Content suggestion provided by Ansible Lightspeed
    delegate_to: localhost
    community.general.mail:
    host: localhost
    port: 25
    subject: Ansible mail
    to: root
    body: Ansible mail body

- name: Sending an e-mail only once using the Ansible delegate node {{ bastion_ip }} without superuser
    # Content suggestion provided by Ansible Lightspeed
    community.general.mail:
    host: localhost
    port: 25
    subject: Ansible mail test
    to: root
    from: oliver4@example.com
    body: Ansible mail test body
    delegate_to: "{{ bastion_ip }}"
    become: false
    run_once: true
```

<br>

**13. if the prompting suggestions doesn't make sense the Regular expression to find, replace something you can teach the Watsonx Code Assistant to use your regular expression, into the requisite module requested**
```
- name: Find /etc/audit/ file(s) matching ^audit(\.rules|d\.conf)$
    # Content suggestion provided by Ansible Lightspeed
    ansible.builtin.find:
    paths: /etc/audit/
    patterns: audit(\.rules|d\.conf)$
    register: audit_files

or

- name: Replace in the /etc/fstab file that matches (.*)cifs(.*)
    # Content suggestion provided by Ansible Lightspeed
    ansible.builtin.replace:
    path: /etc/fstab
    regexp: ^(.*)cifs(.*)
    replace: '#\1cifs\2'
```

---

<img src="https://github.com/user-attachments/assets/6ac1505e-ac0a-4cf8-bf8f-74cb78a4e9ca" width="290" align="right" alt="prompt-guide-10">

**_Final Tips for an Optimal Usability Experience_**

**1** - _Although generative AI can be incredibly useful, it can sometimes produce answers that aren't exactly what you're looking for, or it can give you suggestions that seem off track. If this happens, don't hesitate to rewrite or reformulate your request. Your opinion is fundamental in guiding the AI to provide more precise, meaningful and relevant answers._

**2** - _Do not hesitate to utilize extensive prompts; in certain scenarios, this approach can enhance the accuracy of prompt suggestions generated by the AI. In summary, a well-crafted prompt is crucial for optimal outcomes._

---