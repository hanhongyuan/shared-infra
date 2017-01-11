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

DIR="$(cd "$(dirname "$0")" && pwd)"

source $DIR/setenv.sh

cd $INFRA_ENVIRONMENTS_HOME_DIR/ansible

ansible-playbook -i ./ec2-inventory/ec2.py -v -u ubuntu -e env=latest --private-key $JRA_BUILD_PRIVATE_KEY_FILE swarm-reinstallp-docker.yml