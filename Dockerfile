FROM ctava/tfcgo:latest

MAINTAINER Chris Tava <chris1tava@gmail.com>

#Begin: install tfcgo
RUN go get github.com/pkg/errors
RUN go get github.com/ctava/tfcgo
#End: install tfcgo

#Begin: install delve
RUN go get github.com/derekparker/delve/cmd/dlv
#End: install delve

RUN apt-get update && apt-get install -y --no-install-recommends \
        vim

WORKDIR "/go/src/github.com/ctava/tfcgo/examples"

#Begin: add capsnet
RUN pip --no-cache-dir install \
   tqdm

ADD dist_version .
ADD capsLayer.py .
ADD capsNet.py .
ADD config.py .
ADD download_data.py .
ADD main.py .
ADD utils.py .
#End: add capsnet


