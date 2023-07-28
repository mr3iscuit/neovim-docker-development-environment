# Use Ubuntu as the base image
FROM archlinux:latest

# Set the working directory
WORKDIR /app

# Update package databases and install Neovim, Git, and other dependencies without any prompts
RUN pacman -Syu --noconfirm
RUN pacman -S git neovim base-devel cargo gopls --noconfirm

# Clone the config directory
RUN mkdir -p ~/.config
COPY nvim /app/nvim
RUN mv /app/nvim ~/.config/nvim

# Set up shared folder for Windows and Ubuntu Neovim
VOLUME ["/shared"]

# Set the entrypoint to Neovim
ENTRYPOINT ["nvim"]
