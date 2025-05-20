# Add plugins
asdf plugin add python
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin add terraform https://github.com/asdf-community/asdf-hashicorp.git
asdf plugin add terraform-docs https://github.com/looztra/asdf-terraform-docs
asdf plugin add pdm
#asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf plugin add lsd https://github.com/ossareh/asdf-lsd.git

# Install latest
asdf install python latest
asdf install nodejs latest
asdf install terraform latest
asdf install terraform-docs latest
asdf install pdm latest
# asdf install ruby latest
asdf install lsd latest

# Set globals
asdf set -u python latest
asdf set -u nodejs latest
asdf set -u terraform latest
asdf set -u terraform-docs latest
asdf set -u pdm latest
#asdf set -u ruby latest