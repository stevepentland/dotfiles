if status is-interactive
    set -x PATH $PATH $HOME/.local/bin
    set -x PATH $PATH $HOME/bin
    set -x PATH $PATH /usr/local/go/bin
    set -x PATH $PATH $HOME/.cargo/bin
    set -gx PATH $PATH $HOME/.krew/bin

    # GPG/SSH config
    # set -x SSH_AUTH_SOCK $(gpgconf --list-dirs agent-ssh-socket)

    # Conditional Loads

    # Enable copy/paste targets using xclip
    if type -q xclip
        alias copy="xclip -selection clipboard"
        alias paste="xclip -selection clipboard -o"
    end

    # Source fish script if present
    if test -f "$HOME/.asdf/asdf.fish"
        source "$HOME/.asdf/asdf.fish"
    end

    # Add yarn bin to path if installed
    if type -q yarn
        set -x PATH $PATH $(yarn global bin)
    end

    # gcloud
    if test -f "$HOME/bin/google-cloud-sdk/path.fish.inc"
        . "$HOME/bin/google-cloud-sdk/path.fish.inc"
    end

    # Extra items for work if they exist
    if test -f "$HOME/.work/env.extra.fish"
        . "$HOME/.work/env.extra.fish"
    end    

    # Ensure we have completions
    if type -q kubectl
        kubectl completion fish | source
    end
end
