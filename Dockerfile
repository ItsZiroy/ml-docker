FROM jupyter/minimal-notebook:notebook-6.4.12
# Inspect the Dockerfile at:
# https://github.com/jupyter/docker-stacks/tree/HEAD/minimal-notebook/Dockerfile

# install additional packages
USER root
RUN sudo apt update && apt -y install pkg-config libcairo2-dev gcc libgirepository1.0-dev build-essential curl

RUN pip3 install --no-cache-dir pkgconfig black cairocffi graphviz importmagic matplotlib numpy pandas PyGObject pyparsing python-crfsuite python-mnist scikit-learn scikit-optimize scipy sortedcontainers tabulate torch nbgitpuller
RUN pip3 install --no-cache-dir torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cpu
RUN pip install ipympl
RUN pip install nodejs
RUN pip install torchtext lightning tensorboard
RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager
RUN jupyter labextension install jupyter-matplotlib

# Pass the host OS as a build argument, with "unknown" as the default
ARG OS_NAME=unknown

# Step 1: Clone httpstan and build it, but only if the host is macOS
WORKDIR /build

# Only run the following steps if the OS is macOS
RUN if [ "$OS_NAME" = "macOS" ]; then \
    echo "Running on macOS - downloading and installing httpstan from source"; \
    wget https://github.com/stan-dev/httpstan/archive/refs/tags/4.13.0.tar.gz -O httpstan.tar.gz; \
    tar -xzf httpstan.tar.gz; \
    cd httpstan-4.13.0; \
    python3 -m pip install poetry; \
    make; \
    python3 -m poetry build; \
    python3 -m pip install dist/*.whl; \
    pip3 install --no-cache-dir pystan nest-asyncio --no-binary pystan; \
    else \
    pip3 install --no-cahce pystan nest-asyncio; \
    echo "Not running on macOS - skipping httpstan build"; \
    fi

WORKDIR "${HOME}"

EXPOSE 8888
