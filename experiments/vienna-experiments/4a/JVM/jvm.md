# jvm.MD

Summary: The playbook stops and starts the WebSphere Application Server on AIX.

Pre-requisites: The following variables must be defined in the playbook's vars section:

server_name: The name of the server to be managed.
was_user: The user name to be used to connect to the server.
was_password: The password for the was_user.
was_profile: The profile name of the server.
was_service_name: The name of the server's service.
was_stop_script: The script to stop the server.
was_start_script: The script to start the server.
was_status_script: The script to check the server's status.
log_file: The path to the log file where the restart operation's output will be stored.
Task Explanations:

The playbook stops the WebSphere Server gracefully using the was_stop_script.
It waits for the process to fully terminate by checking for the server's service name in the /tmp/stopServer.log file.
It verifies that the server is down by checking its status using the was_status_script.
It restarts the WebSphere Server using the was_start_script.
It verifies that the server is running by checking its status using the was_status_script.
It logs the restart operation's output to the specified log_file.