athena() {
    if [[ -z $AWS_PROFILE ]];
    then
        read "AWS_PROFILE?AWS_PROFILE not specified. Enter AWS profile > "
    fi
    echo "Using profile $AWS_PROFILE"
    AWS_ACCOUNT=$(aws sts get-caller-identity --query Account --output text --profile=$AWS_PROFILE)
    S3_OUTPUT_LOCATION="s3://aws-athena-query-results-${AWS_ACCOUNT}-us-east-1"
    athenacli --s3-staging-dir $S3_OUTPUT_LOCATION --work_group primary --profile $AWS_PROFILE
}
