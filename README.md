# Docker Setup for the Courses "Machine Learning" and "Deep Learning"

This is a docker environment with a Jupyter notebook for the assignments of the 
courses "Machine Learning (ML)" and "Deep Learning (DL)".  This environment 
contains:
- jupyter
- numpy
- pandas
- graphviz 
- matplotlib
- python-crfsuite 
- python-mnist 
- scikit-learn 
- scikit-optimize 
- scipy 
- torch
- pystan 

## Table of contents

1. [Installing Docker](#1-install-docker)
2. [How to Setup](#2-how-to-setup)
3. [How to Use](#3-how-to-use)

## 1. Install Docker
Before starting the local development environment, you need to install Docker.

### Docker Installation - Windows
To use Docker on Windows install the Docker Desktop.
We encourage you to use the WSL2 (Windows Subsystem for Linux) as backend.
You can find the download link and corresponding installation instructions [here](https://docs.docker.com/desktop/install/windows-install/).

[https://docs.docker.com/desktop/install/windows-install/](https://docs.docker.com/desktop/install/windows-install/)

#### Troubleshooting WSL
Docker in the WSL can use up too many resources. We therefore limit the RAM 
usage with the following commands.

Create the file

```
C:\Users\<username>\.wslconfig
```

with the following content

```
[wsl2]
memory=3GB
```

You can adapt the memory usage to your system. 
Furthermore, you can limit the amount of processors used by `processors=1`.


#### Starting the Docker Engine
On Windows you always need to start Docker first manually.
Open Docker Desktop and click the little Docker icon in the bottom left corner 
to start the engine.

### Docker Installation - Mac

To use Docker on Mac install the Docker Desktop.
You can find the download link and corresponding installation instructions [here](https://docs.docker.com/desktop/install/mac-install/).

[https://docs.docker.com/desktop/install/mac-install/](https://docs.docker.com/desktop/install/mac-install/)


### Docker Installation - Linux
#### Installation using Snap
You can install docker using a single command on Ubuntu using Snap:

```
sudo snap install docker
```

#### Installation using apt-get
You can also install docker using apt-get. Please follow the official 
instuctions given [here](https://docs.docker.com/engine/install/ubuntu/).

[https://docs.docker.com/engine/install/ubuntu/](https://docs.docker.com/engine/install/ubuntu/)


## 2. How to Setup
### Clone this Repository
Clone this repository and go into the root directory of the repository by typing 
the following commands in a terminal:

```
git clone https://github.com/uma-pi1/ml-docker
cd ml-docker
```

Alternatively, you can click on the "Code" button on the top right of this page 
and click "Download ZIP". Then you need
to decompress the ZIP file into a new folder.

### Pull and Start the Docker Container
With an installed Docker environment and a started engine you can now run the 
Docker container by typing the following command in a terminal on the folder 
where you have this downloaded repository:

**Note: The first time you are running this command it will take some time depending on your notebook and internet connection.**
**It will only take that long the first time you run this command. All following start-ups should be quick.**

```
docker compose up
```

You will need to run this command in this folder everytime you want to start up 
the jupyter notebook for these courses. The data you created/modified in the
notebook the last time you used the notebook will be there the next time you
start it.

## 3. How to Use
Run the following command in the root folder of the repository to get the 
notebook started:

```
docker compose up
```

After this, the terminal will start a Jupyter server and provide a link to the
notebook. Click on that link and your browser will open and show the jupyter
notebook. After this, you can use the file manager to the left of the Jupyter
notebook to create folders, upload files and download files after you have 
worked on them. Use these operations to upload the assignment data and code, 
and then to download your work to hand it in.
