# Starts Python virtual environments
VIRTUAL_ENV_FOLDER=$HOME/Configurations/environments
start () {
	if [[ $# == 0 ]]; then
		echo "Specify env folder"
	else
		FOUND_ENV=$(find $VIRTUAL_ENV_FOLDER -maxdepth 1 -type d -name $1)

		if [[ $FOUND_ENV == "" ]]; then 
			if [[ $# < 2 ]]; then 
				echo "Python version?"
				return 
			fi
			FOUND_ENV=$VIRTUAL_ENV_FOLDER/$1
			virtualenv --python=$2 $FOUND_ENV
		fi 
		source "${FOUND_ENV}/bin/activate"	
	fi
}