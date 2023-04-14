#!/opt/homebrew/bin/bash

MWAA_ENVIRONMENT='tfx-airflow'

# Get CLI token and web server hostname from AWS MWAA CLI
CLI_JSON=$(aws mwaa create-cli-token --name $MWAA_ENVIRONMENT --output json)

# Parse results
CLI_TOKEN=$(echo "$CLI_JSON" | jq -r '.CliToken')
WEB_SERVER_HOSTNAME=$(echo "$CLI_JSON" | jq -r '.WebServerHostname')

# Trigger request of Airflow CLI from Amazon MWAA
RESPONSE=$(curl -s --request POST "https://$WEB_SERVER_HOSTNAME/aws_mwaa/cli" \
	--header "Authorization: Bearer $CLI_TOKEN" \
	--header "Content-Type: text/plain" \
	--data-raw "$*")

# Check if we have a valid JSON to be parsed...
if jq -e . >/dev/null 2>&1 <<<"$RESPONSE"; then
	# If JSON is valid then get stdout and stderr
	STDOUT=$(echo "$RESPONSE" | jq -r '.stdout')
	STDERR=$(echo "$RESPONSE" | jq -r '.stderr')

	# Decode the results from Base64
	echo "$STDOUT" | base64 -d

	if [ "$STDERR" != "" ]; then
		echo "Error:"
		echo "$STDERR" | base64 -d
	fi
else
	# In case of invalid JSON just return the message to the terminal
	echo "$RESPONSE"
fi
