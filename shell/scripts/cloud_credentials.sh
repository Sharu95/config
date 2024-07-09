# code from: https://stackoverflow.com/questions/296536/how-to-urlencode-data-for-curl-command
urlencode() {
  local string="${1}"
  local strlen=${#string}
  local encoded=""
  local pos c o

  for (( pos=0 ; pos<strlen ; pos++ )); do
     c=${string:$pos:1}
     case "$c" in
        [-_.~a-zA-Z0-9] ) o="${c}" ;;
        * )               printf -v o '%%%02x' "'$c"
     esac
     encoded+="${o}"
  done
  echo "${encoded}"
}


# AWS Cloud credentials management, either using leapp or granted
awsenv() {
	if [[ "$#" < 1 ]]
	then
		echo "Usage: awsenv [leapp] [envs] - example: 'awsenv dev prod insight'"
		return
	fi

	if [[ "$1" == "leapp" ]]
	then 
		for e in "$@"
		do
			if [[ "$e" != "leapp" ]]
			then
				# Assume container name is same as provided env session name
				# if not the same, change container name to same
				AWS_ENV_SESSION_NAME=$e
				FIREFOX_CONTAINER_TAB_NAME=$e
				echo "| Creating new session: $AWS_ENV_SESSION_NAME"
                leapp session start $AWS_ENV_SESSION_NAME --sessionRole=PowerUserAccess
				SESSION_ID=$(leapp session list -x | grep -e '\bactive\b' | grep -e "\b${AWS_ENV_SESSION_NAME}\b" | cut -f2 -w)
				SESSION_URL=$(leapp session open-web-console --sessionId=$SESSION_ID --print)
				ENCODED_SESSION_URL=$(urlencode $SESSION_URL)

				echo "| Opening console URL in container tab: $FIREFOX_CONTAINER_TAB_NAME"
				echo "$AWS_ENV_SESSION_NAME: $SESSION_URL\n\n" | tee >(pbcopy)
				firefox --new-tab "ext+container:name=${FIREFOX_CONTAINER_TAB_NAME}&url=${ENCODED_SESSION_URL}"
			fi
		done
	else
		for e in "$@"
		do
			assume "$e" --export
			assume -c "$e"
		done
	fi 
	
}