# Terraform for Docker

```sh
docker build -t terraform .

docker run -itd -v $(pwd)/terraform:/root/code --rm --name terraform terraform

docker exec -it terraform bash
```

example

```sh
tfenv install 1.2.6
tfenv use 1.2.6

terraform init
terraform plan
terraform apply -auto-approve

terraform destroy -auto-approve
```
