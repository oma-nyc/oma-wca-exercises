# prompts.md

Create a custom ruleset based on CIS benchmarks for RHEL9 x86_64. The custom ruleset should not scan for SELinux state. Output the findings. Remediate the critical and high findings on the servers in violation.

Download cis benchmark for rhel9 x86_64. Make a copy of the benchmark files. Create a custom benchmark file that excludes all selinux checks. Create a directory /tmp/cis_scans/ to store findings & remediations in. Scan servers based on the custom benchmark and output the findings. Remediate the critical and high findings on the servers in violation.
