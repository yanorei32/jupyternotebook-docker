# !IMPORTANT! This project has moved to here!
* https://github.com/yanorei32/uthree-ml-image/
* https://github.com/yr32infra/uthree-ml-deploy/

# jupyternotebook docker

jupyternotebook environment for machine learning with GPU/SIMD.

## pre-installed packages

* cupy
* jupyter
* matplotlib
* mlxtend
* numpy
* pandas
* pillow-simd
* scikit-learn
* sentencepiece
* torch

## how to

```bash
# clone this repository
git clone https://github.com/yanorei32/jupyternotebook-docker --depth=1
cd jupyternotebook-docker

# cloudflared credential
cloudflared --login
cp ~/.cloudflared/cert.pem .

# set cloudflared's domain
echo DOMAIN_NAME: jupyter.example.com > .env

# basic authorization
htpasswd -bc .htpasswd user password

# build a python environment image
docker compose build

# run
docker compose up -d
```

