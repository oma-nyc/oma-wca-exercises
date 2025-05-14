#BLD_SCRIPT_VERSION=1

# Define variables
TARGET_HOST="your_mssql_server"
MSSQL_ADMIN_USER="sa"
MSSQL_ADMIN_PASS="YourPassword"
DB_NAME="MyDatabase"
DB_TEMPLATE="/path/to/mydatabase.sql"


# Function to execute SQL command
function ExecuteSQLCommand {
    nsh -h $1 -e "mssql -S $2 -U $3 -P $4 -d master -i '$(cat)' >> /tmp/mssql_output.log 2>&1"
}


# Stop MSSQL service if it's running
ExecuteSQLCommand $TARGET_HOST mssql stop
sleep 5


# Start MSSQL service
ExecuteSQLCommand $TARGET_HOST mssql start


# Create database from template
ExecuteSQLCommand $TARGET_HOST mssql -Q "CREATE DATABASE [$DB_NAME];"

# Sleep for a moment to ensure creation is complete before granting permissions
sleep 10


# Grant permissions to the admin user
ExecuteSQLCommand $TARGET_HOST mssql -Q "USE $DB_NAME; CREATE LOGIN $MSSQL_ADMIN_USER WITH PASSWORD = '$MSSQL_ADMIN_PASS'; ALTER SERVER ROLE [db_owner] ADD MEMBER
$MSSQL_ADMIN_USER;"


# Import database from template file
ExecuteSQLCommand $TARGET_HOST mssql -S "$TARGET_HOST" -d $DB_NAME -U sa -P $MSSQL_ADMIN_PASS -i $(cat $DB_TEMPLATE) >> /tmp/mssql_output.log 2>&1


# Check for errors in the log file
if grep -q "ERROR" /tmp/mssql_output.log; then
    echo "Errors found during MSSQL operations."
    cat /tmp/mssql_output.log
else
    echo "MSSQL operations completed successfully."
fi
