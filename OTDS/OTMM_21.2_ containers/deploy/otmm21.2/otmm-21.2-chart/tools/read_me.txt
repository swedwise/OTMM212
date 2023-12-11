1.  vault_encrypt_decrypt_tool.sh:
        The vault encrytion decryption tools requires system environment variable "JAVA_HOME" to be set.
		the command takes file path of the sec.cfg file.
		if the custom encryption key key.txt exists along with the sec.cfg, the tool will encrypt/decrypt with custom encryption key, 
		if there is no custom encryption key along with the sec.cfg, the tool will encrypt/decrypt with default key
        Sample command:
        If the sec.cfg is located at the default location, example command:
            ./vault_encrypt_decrypt_tool.sh ../helm_charts/otmm-services/conf/vault





            Swedwise DB - damadmin/(0?s8Tm\$,(b<|i
             sa/Janu@1982

 gcloud container clusters get-credentials cluster-1 --zone=us-central1

helm install dam-controller  nginx-stable/nginx-ingress --set rbac.create=true
helm repo add nfs-subdir-external-provisioner https://kubernetes-sigs.github.io/nfs-subdir-external-provisioner/
helm install nfs-subdir-external-provisioner nfs-subdir-external-provisioner/nfs-subdir-external-provisioner --set nfs.server=10.191.255.114 --set nfs.path=/otmm
optional check not sure
helm install nfs-subdir-external-provisioner nfs-subdir-external-provisioner/nfs-subdir-external-provisioner --set nfs.server=10.191.255.114 --set nfs.path=/otmm --set nfs.resources.requests.memory=2Gi --set nfs.resources.requests.cpu=2


helm install otds-deployment otds -f resource-small.yaml -f properties.yaml

helm install otmm-deployment otmm-21.2-chart -f otmm-static.yaml -f resource-small.yaml

helm upgrade  otmm-deployment otmm-21.2-chart -n <name-of-the-namespace


follow db script instruction in CE doc and otmm helm chart script folder to gen table

PS C:\otmm212fromot\here\opentext-mediamanagement-21.2-containers.tar\opentext-mediamanagement-21.2-containers\scripts\db_utilities\sqlserver> .\replace_tokens.sh database.sql


port opening db

gcloud compute firewall-rules create sql-server-1433 \
    --description "Allow SQL Server access from all sources on port 1433." \
    --allow tcp:1433 --network default

kubectl scale statefulsets otmm --replicas=1




stop and start cluster
gcloud container node-pools list --cluster=cluster-1
stop
gcloud container clusters resize cluster-1 --node-pool default-pool --num-nodes 0
start
gcloud container clusters resize cluster-1 --node-pool default-pool --num-nodes 3