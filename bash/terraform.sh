#wget -O packer.zip https://releases.hashicorp.com/packer/1.4.5/packer_1.4.5_linux_amd64.zip
#unzip packer.zip

export TF_VAR_image_id=$(curl -X GET -H "Content-Type: application/json" -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" "https://api.digitalocean.com/v2/images?private=true" | jq ."images[] | select(.name == \"tec-app--$ARTIFACT_ID\") | .id")
echo $TF_VAR_image_id
echo $ARTIFACT_ID
echo $DIGITALOCEAN_TOKEN
cd terraform
terraform init
terraform apply -input=false -auto-approve