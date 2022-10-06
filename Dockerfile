FROM jupyter/minimal-notebook:notebook-6.4.12
# Inspect the Dockerfile at:
# https://github.com/jupyter/docker-stacks/tree/HEAD/minimal-notebook/Dockerfile

# install additional packages
USER root
RUN sudo apt update && apt -y install pkg-config libcairo2-dev gcc libgirepository1.0-dev git
RUN pip3 install --no-cache-dir pkgconfig black cairocffi epc graphviz importmagic matplotlib numpy pandas PyGObject pyparsing python-crfsuite python-mnist pystan scikit-learn scikit-optimize scipy sortedcontainers tabulate torch nbgitpuller
RUN pip3 install --no-cache-dir torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cpu
RUN pip install ipympl
RUN pip install nodejs
RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager
RUN jupyter labextension install jupyter-matplotlib

EXPOSE 8888
