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
## _Install .deb package_

sudo dpkg -i <package_name>.deb

----

## _Maven_

```
wget https://mirrors.estointernet.in/apache/maven/maven-3/3.9.9/binaries/apache-maven-3.9.9-bin.tar.gz
```
```
tar -xvf apache-maven-3.9.9-bin.tar.gz
```
```
mv apache-maven-3.9.9 /opt/
```
```
vim ~/.bashrc
```
```
M2_HOME='/opt/apache-maven-3.9.9'
PATH="$M2_HOME/bin:$PATH"
```
```
source ~/.bashrc
```
----

## _Alien RPM_

```
sudo apt install alien
```

```
sudo alien -i tabby-1.0.207-linux-x64.rpm
```

----

## _Git_

```
sudo apt install git-all
```

```
git --version
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

## _Kubectl_

```
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
```

validation script

```
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
```

```
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
```

```
kubectl version --client
```

```
kubectl cluster-info
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

## _Kubectl Config_

```
kubectl config view
```

```
sudo cp /root/.kube/config $HOME/.kube/config
```

## _K8s Dashboard_

```
helm repo add kubernetes-dashboard https://kubernetes.github.io/dashboard/
```

```
helm upgrade --install kubernetes-dashboard kubernetes-dashboard/kubernetes-dashboard --create-namespace --namespace kubernetes-dashboard
```

```
kubectl -n kubernetes-dashboard get svc
```

```
kubectl -n kubernetes-dashboard port-forward svc/kubernetes-dashboard-kong-proxy 8443:443
```

```
kubectl -n kubernetes-dashboard create token kubernetes-dashboard-kong
```
---- 

## _Redis Installation_

```
curl -fsSL https://packages.redis.io/gpg | sudo gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg
```
```
sudo chmod 644 /usr/share/keyrings/redis-archive-keyring.gpg
```
```
echo "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/redis.list
```
```
sudo apt-get update
```
```
sudo apt-get install redis-stack-server
```
