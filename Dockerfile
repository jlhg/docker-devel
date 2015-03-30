FROM fedora:21
MAINTAINER Jian-Long Huang <jlhgln@gmail.com>
ENV HOME /root
RUN yum -y update && \
    yum -y reinstall glibc-common && \
    yum -y install tmux git htop emacs make ack tar \
                   zlib-devel bzip2 bzip2-devel readline-devel sqlite sqlite-devel openssl-devel \
                   gcc openssl-devel libyaml-devel libffi-devel readline-devel zlib-devel gdbm-devel ncurses-devel && \
    yum -y clean all
RUN git clone --recursive https://github.com/jlhg/emacs.d.git ${HOME}/.emacs.d && \
    ln -s ${HOME}/.emacs.d/init.el ${HOME}/.emacs && \
    cd ${HOME}/.emacs.d && make && \
    ln -s ${HOME}/.emacs.d/requirements/flake8-checker.sh /usr/bin
RUN git clone https://github.com/tmux-plugins/tpm ${HOME}/.tmux/plugins/tpm
COPY tmux.conf ${HOME}/.tmux.conf
COPY install_tmux_plugins.sh /tmp/install_tmux_plugins.sh
RUN /tmp/install_tmux_plugins.sh && rm /tmp/install_tmux_plugins.sh
RUN git clone https://github.com/yyuu/pyenv.git ${HOME}/.pyenv
RUN git clone https://github.com/yyuu/pyenv-virtualenv.git ${HOME}/.pyenv/plugins/pyenv-virtualenv
RUN git clone https://github.com/sstephenson/rbenv.git ${HOME}/.rbenv
COPY bashrc ${HOME}/.bashrc
