# prompts

## Simple JVM Restart example

### Initial attempts

Log into each IBM WebSphere Application Server in the aix inventory group. Use Ansible variables to parameterize the following

server_name
was_user

### From Boris's as-is intake

Log into each IBM WebSphere Application Server in the aix inventory group and restart the WebSphere service gracefully. Use Ansible variables to parameterize the following:
server_name – WebSphere server name
was_user – WebSphere username
was_password – WebSphere password
was_profile – WebSphere profile directory
was_service_name – WebSphere service name
was_stop_script – Script to stop WebSphere (stopServer.sh)
was_start_script – Script to start WebSphere (startServer.sh)
was_status_script – Script to check WebSphere status (serverStatus.sh)
log_file – Path to store restart logs
Ensure the playbook performs the following steps:
1. Stop WebSphere Server Gracefully
Execute stopServer.sh to stop the JVM.
Wait for the process to fully terminate.
2. Verify the Server is Down
Use serverStatus.sh to confirm the server stopped successfully.
If the server is still running, attempt a force stop.
3. Restart the WebSphere Server
Use startServer.sh to restart the WebSphere application server.
4. Verify the Server is Running
Use serverStatus.sh to confirm a successful restart.
5. Log the Restart Operation
Capture restart logs and store them in log_file for troubleshooting and audit purposes.
*Ensure the playbook includes error handling, retries if needed, and logs all steps to maintain visibility into the restart process.

## JVM server count before & after server reboot

Capture java processes running on a redhat server before and after redhat server reboot. Filter out PID for each java process. Compare the before and after processes.

Capture java processes running on a redhat server before and after redhat server reboot. Grep out PID for each java process. Compare the before and after processes.

Capture WebSpere JVM processes running on a Red Hat server before and after a server reboot. Filter only WebSpher-related Java processes. Extract and compare the PIDs of WebSphere JVMs before and after the reboot to ensure all expected instances restarted successfully.

Capture WebSphere JVM processes running on a red hat server before and after a server reboot. Filter only websphere-related java processes. extract and store the process list and process names before reboot. After reboot, retrieve the new process list and compare it with the previous one to identify missing or additional JVP instances. Log discrepancies and ensure all expected WebEsphere processes restarted successfully.

## The John Brown Special (EUE)


