# _Server Setup_

## _Java_

```
wget https://download.oracle.com/java/17/latest/jdk-17_linux-x64_bin.deb
```

```
sudo apt install ./jdk-17_linux-x64_bin.deb
```

```
java -version
```

----

## _Docker_

```
curl -fsSL https://get.docker.com -o get-docker.sh
```

```
sudo sh get-docker.sh
```

```
sudo docker ps
```

```
sudo usermod -aG docker $USER
```

```
sudo systemctl enable docker
```

```
sudo systemctl status docker
```

----

## _Kind Cluster_

```
# For AMD64 / x86_64
[ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.23.0/kind-linux-amd64
# For ARM64
[ $(uname -m) = aarch64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.23.0/kind-linux-arm64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind
```

create cluster

```
kind get clusters
```

```
kind create cluster --name k8
```

```
kubectl cluster-info --context kind-k8
```

----