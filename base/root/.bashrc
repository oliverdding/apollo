export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CACHE_HOME=$HOME/.cache
export XDG_STATE_HOME=$HOME/.local/state

export PATH=$HOME/.local/bin:$PATH

export EDITOR=nvim
export VISUAL=nvim
export PAGER=less
export DIFFPROG=delta
export GOPROXY=https://goproxy.io,direct

export SDKMAN_DIR=$XDG_DATA_HOME/sdkman
export RUSTUP_HOME=$XDG_DATA_HOME/rustup
export CARGO_HOME=$XDG_DATA_HOME/cargo
export GOPATH=$XDG_DATA_HOME/go
export GRADLE_USER_HOME=$XDG_DATA_HOME/gradle

[[ -s "$XDG_DATA_HOME/sdkman/bin/sdkman-init.sh" ]] && source "$XDG_DATA_HOME/sdkman/bin/sdkman-init.sh"
eval "$(starship init bash)"
