# Assisted by watsonx Code Assistant

#!/usr/bin/python

# (c) 2023, [Your Name].
# GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)

from ansible.module_utils.basic import AnsibleModule
import dns.resolver

DOCUMENTATION = '''
module: dns_lookup
short_description: Perform a DNS lookup for a given record in a specified domain.
description:
    - This module performs a DNS lookup for a specified record in a given domain.
    - Supports A, AAAA, CNAME, MX, NS, SOA, and TXT record types.
requirements: [ 'dnspython (>=1.16.0)' ]
author: "[Your Name] (<your.email@example.com>)"
options:
    record:
        description:
        - The DNS record to look up (e.g., 'www').
        - Required.
        required: true
    domain:
        description:
        - The domain to query (e.g., 'example.com').
        - Required.
        required: true
    type:
        description:
        - The DNS record type (default is 'A').
        - Supported types: A, AAAA, CNAME, MX, NS, SOA, TXT.
        default: A
        choices:
          - A
          - AAAA
          - CNAME
          - MX
          - NS
          - SOA
          - TXT
returns:
    dns_records:
        description: A list of DNS records found.
        type: list
        sample: ["192.168.1.1", "2001:db8::1"]
    msg:
        description: Error message if lookup fails.
        type: string
        sample: "No A records found for www.example.com."
'''

def dns_lookup(record, domain, type='A'):
    """
    Perform a DNS lookup for a given record in a specified domain.

    record: The DNS record to look up (e.g., 'www').
    domain: The domain to query (e.g., 'example.com').
    type: The DNS record type (default is 'A').
    """

    result = {'changed': False, 'dns_records': []}

    try:
        answers = dns.resolver.resolve(record + '.' + domain, type)
        for rdata in answers:
            result['dns_records'].append(str(rdata))
    except dns.resolver.NXDOMAIN:
        result['msg'] = f"Domain {domain} does not exist."
    except dns.resolver.NoAnswer:
        result['msg'] = f"No {type} records found for {record}.{domain}."
    except dns.resolver.Timeout:
        result['msg'] = f"Query timed out for {record}.{domain}."
    except Exception as e:
        result['msg'] = str(e)

    return result

def main():
    module = AnsibleModule(
        argument_spec=dict(
            record=dict(required=True),
            domain=dict(required=True),
            type=dict(default='A')
        )
    )

    try:
        result = dns_lookup(module.params['record'], module.params['domain'], module.params['type'])
        module.exit_json(**result)
    except Exception as e:
        module.fail_json(msg=str(e))

if __name__ == '__main__':
    main()
