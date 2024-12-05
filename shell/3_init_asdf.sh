# Add plugins
asdf plugin add python
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin-add terraform https://github.com/asdf-community/asdf-hashicorp.git
asdf plugin add terraform-docs https://github.com/looztra/asdf-terraform-docs
asdf plugin add pdm
asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git

# Install latest
asdf install python latest
asdf install nodejs latest
asdf install terraform latest
asdf install terraform-docs latest
asdf install pdm latest
asdf install ruby latest

# Set globals
asdf global python latest
asdf global nodejs latest
asdf global terraform latest
asdf global terraform-docs latest
asdf global pdm latest
asdf global ruby latest