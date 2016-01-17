
# [[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

# Add GHC 7.10.1 to the PATH, via https://ghcformacosx.github.io/
export GHC_DOT_APP="/Applications/ghc-7.10.1.app"
if [ -d "$GHC_DOT_APP" ]; then
    export PATH="${HOME}/.cabal/bin:${GHC_DOT_APP}/Contents/bin:${PATH}"
fi

# Add GHC 7.10.1 to the PATH, via https://ghcformacosx.github.io/
export GHC_DOT_APP="/Applications/ghc-7.10.1.app"
if [ -d "$GHC_DOT_APP" ]; then
    export PATH="${HOME}/.cabal/bin:${GHC_DOT_APP}/Contents/bin:${PATH}"
fi

export GOPATH="/Users/nexus/go"
export GOBIN="/Users/nexus/go/bin"

export PATH="$PATH:$GOPATH/bin"

# The next line updates PATH for the Google Cloud SDK.
source '/Users/nexus/google-cloud-sdk/path.bash.inc'

# The next line enables shell command completion for gcloud.
source '/Users/nexus/google-cloud-sdk/completion.bash.inc'

# Torch
. /Users/nexus/torch/install/bin/torch-activate
