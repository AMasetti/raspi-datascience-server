FROM arm32v7/ubuntu:latest

RUN apt-get update && apt-get install -y python3 python3-pip scons

RUN apt-get install libffi-dev

RUN pip3 install jupyter

RUN pip3 install numpy

RUN pip3 install jupyter

RUN pip3 install pandas

RUN useradd -ms /bin/bash jupyter

USER jupyter

WORKDIR /home/jupyter

ENTRYPOINT ["jupyter", "notebook", "--ip=*"]