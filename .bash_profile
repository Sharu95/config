alias ls='ls -GaFfl'
alias p=python3

# CURRENT_DIR_COLORED="\[\033\]\[[38;5;208m\]\W\[\033\]\[[0m\]"
LAMBDA="\[\033\]\[[38;5;208m\]λ\[\033\]\[[0m\]"
# export PS1="$TIME | $CURRENT_DIR_COLORED\$(git-radar --bash --fetch)\n$LAMBDA "
export PS1="$LAMBDA\$(git-radar --bash --fetch) "
# export PATH=/usr/local/bin:$PATH
# export PYTHONPATH=/usr/local/bin/python3:$PYTHONPATH



# PostgreSQL 10
export PATH=/usr/local/opt/postgresql@10/bin:$PATH
export PGDATA=$HOME/.psql_databases

# Compilers accessibility 
export LDFLAGS=-L/usr/local/opt/postgresql@10/lib
export CPPFLAGS=-I/usr/local/opt/postgresql@10/include