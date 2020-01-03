# tuqiu

Scripts to get a snapshot of your browser history. tuqiu is the pronunciation of a Chinese word 菟(tú)裘(qíu) which refers to seclusion.

## Getting started
Dependency: Docker 2.0.0.3+
```
docker pull jupyter/base-notebook:python-3.7.3
git clone https://github.com/vjyq/tuqiu.git
cd tuqiu
docker run -p 8888:8888 -v $PWD:/home/jovyan/workspace jupyter/base-notebook:python-3.7.3
```

## Author
yuqing.ji@outlook.com
