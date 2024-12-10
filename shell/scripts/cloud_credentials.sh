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
		echo "Usage: awsopen [envs] - example: 'awsopen dev prod insight'"
		return
	fi

	for e in "$@"
		do
			if [[ "$e" == */* ]]; then
				service="${e#*/}"  
				profile="${e%%/*}"     
			else
				service="console"  
				profile="$e"
			fi
			assume --console "$profile" --service $service
		done
	
}

awsinit() {
	while read profile;
		do
			assume "$profile" --export
		done <<< $(aws configure list-profiles)
}