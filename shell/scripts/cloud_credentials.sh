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


# AWS Cloud credentials management, using granted
awsopen() {
	if [[ "$#" < 1 ]]
	then
		if [[ -n "$AWS_PROFILE" ]]; then
			echo "No profile provided, but found $AWS_PROFILE set, opening console"
			assume --console "$AWS_PROFILE"
		else
			echo "Usage: awsopen [envs] - example: 'awsopen dev prod insight'"
			return
		fi
	fi

	for e in "$@"
		do
			if [[ "$e" == */* ]]; then
				service="${e#*/}"  
				profile="${e%%/*}"
				assume --console "$profile" --service "$service"
			else
				profile="$e"
				assume --console "$profile"
			fi
			
		done
	
}

awsinit() {
	# aws sso login --sso-session sharu-sso

	if [[ "$1" == "all" || -z "$1" ]]; then 
		while read profile;
			do
				assume "$profile" --export
			done <<< $(aws configure list-profiles)
	else
		for profile in "$@"
		 	do 
				assume "$profile" --export
			done
	fi
}