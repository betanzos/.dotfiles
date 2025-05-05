# Config SSH
## Start the auth agent
eval "$(ssh-agent -s)" >/dev/null 2>&1

## Add my keys to the auth agent
if [ -f ~/.ssh/github_default_rsa ]; then
    ssh-add ~/.ssh/github_default_rsa >/dev/null 2>&1
fi
