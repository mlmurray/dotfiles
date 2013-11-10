

export FITOOPDIR="~/Documents/Tools/fitoop"
alias runtest="cd ${FITOOPDIR} && bundle install && rake db:migrate && rake db:test:clone && rake"
alias local="runtest && foreman start"
alias git-commit-current="git add . && git commit && git push"

alias newrelicdeploy="curl -H \"x-api-key:c0163479b34e539cc87a2b505e683399e2a2b56cc404633\" -d \"deployment[application_id]=2291233\" -d \"deployment[description]=Deployment from `hostname` \" -d \"deployment[revision]=`git log -n 1 | grep commit | cut -f2 -d' '`\" -d \"deployment[changelog]=`git log -n 1 | tail +5`\" -d \"deployment[user]=mlmurray\"  https://rpm.newrelic.com/deployments.xml"

alias deploy="runtest && git-commit-current; git push heroku master && rake figaro:heroku && heroku run rake db:migrate && newrelicdeploy"
alias dbreset="rake db:pgbackup db:reset db:pgrestore db:migrate && runtest"
alias dbhardreset="rake db:pgbackup db:drop db:create db:pgrestore db:migrate && runtest"

alias s3mad='s3cmd -c ~/.s3cfg-mad'


### Traditional stuff
PORT=3000
PATH=/Applications/Postgres.app/Contents/MacOS/bin:${PATH}:/opt/local/bin
QUEUE='*'

##
# Your previous /Users/mmurray/.bash_profile file was backed up as /Users/mmurray/.bash_profile.macports-saved_2013-11-01_at_12:26:27
##

# MacPorts Installer addition on 2013-11-01_at_12:26:27: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.


[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
