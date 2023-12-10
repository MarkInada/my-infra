# ベースとなるイメージを指定
FROM ubuntu:latest

# パッケージの更新と必要なパッケージのインストール
RUN apt-get update \
    && apt-get install -y \
        vim \
        git \
        curl \
        unzip \
        bash \
        wget \
        software-properties-common \
        python3-pip

# AWS CLIをインストール
RUN pip3 install --upgrade pip \
    && pip3 install awscli

# tfenvをインストール
RUN git clone https://github.com/tfutils/tfenv.git ~/.tfenv \
    && echo 'export PATH="$HOME/.tfenv/bin:$PATH"' >> ~/.bashrc \
    && ln -s ~/.tfenv/bin/* /usr/local/bin
 
# Terraformを最新バージョンでインストール
RUN tfenv install latest

# デフォルトシェルをbashに設定
SHELL ["/bin/bash", "-c"]

# コンテナ起動時のデフォルトディレクトリを/rootに設定
WORKDIR /root

# コンテナ起動時のデフォルトコマンドをbashに設定
CMD ["bash"]
