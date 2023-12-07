#!/bin/bash

AWS_REGION="ca-central-1"

# Output file
OUTPUT_FILE="list.txt"

# List all parameters in Parameter Store
parameter_list=$(aws ssm describe-parameters --region $AWS_REGION --query "Parameters[*].Name" --output text)

# Iterate through each parameter
for parameter_name in $parameter_list; do
	#   # Get parameter type
	     parameter_type=$(aws ssm get-parameter --name $parameter_name --region $AWS_REGION --query "Parameter.Type" --output text)
	#   # Get parameter type
	     parameter_type=$(aws ssm get-parameter --name $parameter_name --region $AWS_REGION --query "Parameter.Type" --output text)

	# Check if the parameter is of type SecureString
	if [ "$parameter_type" == "SecureString" ]; then
		# Decrypt the SecureString parameter
		decrypted_value=$(aws ssm get-parameter --name $parameter_name --region $AWS_REGION --with-decryption --query "Parameter.Value" --output text)

		# Print the parameter name and decrypted value to the output file
		echo "Parameter Name: $parameter_name -------- Decrypted Value: $decrypted_value" >> $OUTPUT_FILE
	fi
done

echo "Results have been saved to $OUTPUT_FILE"