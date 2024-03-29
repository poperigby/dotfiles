# Set aliases if programs are present
if type -q eza
    alias ls "eza"
    alias tree "eza -T"
end

if type -q bat
    alias cat "bat"
end

if type -q rg
    alias grep "rg"
end

if type -q dust
    alias du "dust"
end

if type -q python
    alias py "python"
end

if type -q lazygit
    alias lg "lazygit"
end

if type -q distrobox
    alias db "distrobox"
end

if type -q borgmatic
    alias borgmatic "sudo borgmatic"
end

# Only alias if systemctl can successfully run
if /usr/bin/systemctl &> /dev/null
    alias sys "sudo systemctl"
    alias syu "systemctl --user"
end

if type -q journalctl
    alias jrn "sudo journalctl"
end

if type -q rpm-ostree
    alias ros "rpm-ostree"
end

# Miscellaneous aliases
alias haddock "ssh cassidy@192.168.1.184"
