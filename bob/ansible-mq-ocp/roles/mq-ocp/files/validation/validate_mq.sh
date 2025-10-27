#!/bin/bash
# IBM MQ validation script
# This script validates an IBM MQ deployment on OpenShift

set -e

# Check if required variables are set
if [ -z "$MQ_NAMESPACE" ]; then
  echo "Error: MQ_NAMESPACE environment variable is not set"
  exit 1
fi

if [ -z "$MQ_QMGR_NAME" ]; then
  echo "Error: MQ_QMGR_NAME environment variable is not set"
  exit 1
fi

# Get the MQ pod name
MQ_POD=$(oc get pods -n $MQ_NAMESPACE -l app=ibm-mq -o jsonpath='{.items[0].metadata.name}')

if [ -z "$MQ_POD" ]; then
  echo "Error: No IBM MQ pod found in namespace $MQ_NAMESPACE"
  exit 1
fi

echo "Found IBM MQ pod: $MQ_POD"

# Check if the queue manager is running
QMGR_STATUS=$(oc exec -n $MQ_NAMESPACE $MQ_POD -- dspmq -m $MQ_QMGR_NAME)

if ! echo "$QMGR_STATUS" | grep -q "RUNNING"; then
  echo "Error: Queue manager $MQ_QMGR_NAME is not running"
  echo "Status: $QMGR_STATUS"
  exit 1
fi

echo "Queue manager $MQ_QMGR_NAME is running"

# Create a test queue
echo "Creating test queue TEST.VALIDATION.QUEUE"
oc exec -n $MQ_NAMESPACE $MQ_POD -- /bin/bash -c "echo 'DEFINE QLOCAL(TEST.VALIDATION.QUEUE) REPLACE' | runmqsc $MQ_QMGR_NAME"

# Put a test message
echo "Putting test message on TEST.VALIDATION.QUEUE"
oc exec -n $MQ_NAMESPACE $MQ_POD -- /bin/bash -c "echo 'This is a test message' | /opt/mqm/samp/bin/amqsput TEST.VALIDATION.QUEUE $MQ_QMGR_NAME"

# Get the test message
echo "Getting test message from TEST.VALIDATION.QUEUE"
MESSAGE=$(oc exec -n $MQ_NAMESPACE $MQ_POD -- /opt/mqm/samp/bin/amqsget TEST.VALIDATION.QUEUE $MQ_QMGR_NAME)

if ! echo "$MESSAGE" | grep -q "This is a test message"; then
  echo "Error: Failed to retrieve test message from queue"
  exit 1
fi

echo "Successfully retrieved test message from queue"

# Delete the test queue
echo "Deleting test queue TEST.VALIDATION.QUEUE"
oc exec -n $MQ_NAMESPACE $MQ_POD -- /bin/bash -c "echo 'DELETE QLOCAL(TEST.VALIDATION.QUEUE)' | runmqsc $MQ_QMGR_NAME"

echo "Validation completed successfully"
exit 0

# Made with Bob
