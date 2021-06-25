# Install Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k

# Link dotfiles
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.p10k.zsh ~/.p10k.zsh

# Run for Spin workspaces
if [ $SPIN ]; then
  # Run for shopify/shopify workspaces
  if [ $SPIN_REPO_SOURCE_PATH = "/src/github.com/shopify/shopify" ]; then
    cartridge insert kwreen/post-fulfillment-bootstrap
    cartridge insert kwreen/channel-source-indicator
    . /cartridges/post-fulfillment-bootstrap/setup.sh
  fi
fi
