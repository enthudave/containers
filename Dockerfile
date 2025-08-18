FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    sudo \
    zsh \
    make \
    gcc \
    curl \
    git \
    wget \
    && apt-get clean \
    && useradd -m -s /bin/zsh -G sudo enthu \
    && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER enthu
WORKDIR /home/enthu
COPY --chown=enthu:enthu zshrc /home/enthu/.zshrc

RUN wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux-arm64.tar.gz \
    && tar xzvf nvim-linux-arm64.tar.gz \
    && sudo mv nvim-linux-arm64/bin/nvim /usr/local/bin/ \
    && sudo mv nvim-linux-arm64/lib/nvim /usr/local/lib/ \
    && sudo mv nvim-linux-arm64/share/nvim /usr/local/share/ \
    && rm -rf nvim-linux-arm64 nvim-linux-arm64.tar.gz

RUN git clone https://github.com/enthudave/nvim-config /home/enthu/.config/nvim

RUN sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

RUN nvim --headless +PlugInstall +qa

CMD ["/bin/sh"]
