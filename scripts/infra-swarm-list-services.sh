
# *********************************************************************************
# Description: provision a new docker host machine in AWS to be used for the wordpress blog
# Author:      Joe Rice
# Created:     10/14/2016
#
# Notes:
#    Script assumes that the following environment variables are set
#       export AWS_ACCESS_KEY=<Secret>
#       export AWS_SECRET_KEY=<Super_Top_Secret>
# *********************************************************************************

SWARM_MANAGER_NODE="$(infra-swarm-list-manager-ips.sh single)"

GREP_STRING=""
GREP_STRING_DISPLAY=""

if ! [ -z "$1" ]
then
	GREP_STRING=" | grep \"$1\""
	GREP_STRING_DISPLAY="grep $1";
else
	GREP_STRING=''
	GREP_STRING_DISPLAY="<no grep string>";
fi

printf '%b\n' ""
ssh-aws.sh $SWARM_MANAGER_NODE "docker service ls $GREP_STRING"
printf '%b\n' ""
