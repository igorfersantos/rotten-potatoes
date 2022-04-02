k3d cluster create meucluster --agents 1 --servers 1 -p "8080:30000@loadbalancer"

if [ $? -eq 0 ]
then
    echo "\nCluster criado com sucesso!\n"
    echo "Realizando o deploy da aplicação conversa-temperatura...\n"
else
    echo Falha ao criar o cluster!
    exit 1
fi

kubectl apply -f k8s/deployment.yaml

if [ $? -eq 0 ]
then
    echo "\nDeploy da aplicacao conversao-temperatura realizado com sucesso!\n"
else
    echo Falha ao criar o cluster!
    exit 1
fi

