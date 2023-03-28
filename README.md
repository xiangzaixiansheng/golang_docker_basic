# golang_docker_basic
Golang basic dockerFile



编译命令

```
docker build --build-arg GO_VERSION=<version> -t go-basic .
```

或者镜像里面修改环境变量

```
ENV GO_VERSION=1.18.9
```



#### golang 安装包下载地址

https://go.dev/dl/



#### 阿里云Go Module代理仓库服务

https://mirrors.aliyun.com/goproxy/



export GOPROXY=https://mirrors.aliyun.com/goproxy/



#### source-list加速配置



https://developer.aliyun.com/mirror/ubuntu?spm=a2c6h.13651102.0.0.3e221b11VgT6LD



#### 修改时区

```
# 在安装tzdata之前最好先update和upgrade，以防apt-get获取不到tzdata
RUN apt-get update -y && apt-get upgrade -y
# 安装，中国用户填写[Asia/Shanghai] ，表示亚洲/上海 ，东八区
RUN apt-get install -y tzdata && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
```

