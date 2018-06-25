# Configure spaceship
export SPACESHIP_KUBECONTEXT_SHOW=false;
export SPACESHIP_RUBY_SHOW=false;
export SPACESHIP_CHAR_SYMBOL='$ ';
export SPACESHIP_PROMPT_PREFIXES_SHOW=false;
export SPACESHIP_PROMPT_DEFAULT_PREFIX=' ';

# Editor
export EDITOR=vim

# Golang's GOPATH & bin
export GOPATH="$HOME/dev/go"

export GO_BIN="$GOPATH/bin:/usr/local/go/bin"

# Caddy
export CADDY="$HOME/bin/caddy"

# ~/bin 
export MY_BIN="$HOME/bin"

# yarn
export YARN="$HOME/.yarn/bin"

# rust's cargo
export CARGO="$HOME/.cargo/bin"

# depot_tools
export DEPOT_TOOLS="$HOME/dev/depot_tools"

# add stuff to PATH
export PATH="$GO_BIN:$CADDY:$MY_BIN:$YARN:$CARGO:$DEPOT_TOOLS:$PATH"

export JAVA_HOME="/usr/lib/jvm/java-8-oracle"
