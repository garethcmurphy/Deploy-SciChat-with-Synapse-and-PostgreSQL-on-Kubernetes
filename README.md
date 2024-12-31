# Deploy SciChat with Synapse and PostgreSQL on Kubernetes 🚀  

A Helm-based repository to deploy SciChat, Synapse, and PostgreSQL on a Kubernetes cluster. This setup is designed for scalability, reliability, and easy management of chat applications with Kubernetes.

---

## Features ✨  

- Deploy **SciChat** for real-time communication.  
- Integrate **Synapse**, a Matrix homeserver, for backend functionality.  
- Use **PostgreSQL** for persistent data storage.  
- Fully managed through **Helm**, simplifying deployment and updates.  

---

## Prerequisites 🛠️  

- A Kubernetes cluster (e.g., Minikube, GKE, EKS).  
- Helm installed on your local system.  
- Access to a container registry (optional for custom images).  

---

## Installation  

1. Clone the repository:  
git clone https://github.com/your-username/scichat-helm-deployment.git  
cd scichat-helm-deployment  

2. Add the required Helm repositories:  
helm repo add bitnami https://charts.bitnami.com/bitnami  
helm repo update  

3. Deploy PostgreSQL:  
helm install postgres bitnami/postgresql --set auth.postgresPassword=yourpassword  

4. Deploy Synapse:  
helm install synapse ./charts/synapse --set postgres.password=yourpassword  

5. Deploy SciChat:  
helm install scichat ./charts/scichat  

---

## Configuration 🔧  

Modify values in the `values.yaml` file under the respective charts (`charts/synapse/` or `charts/scichat/`) to customize:  
- **Resource limits and replicas**  
- **Environment variables**  
- **PostgreSQL credentials**  

---

## Verifying the Deployment ✅  

1. Check the status of all Helm releases:  
helm list  

2. Verify Kubernetes pods are running:  
kubectl get pods  

3. Access SciChat through the external IP:  
kubectl get svc scichat  

---

## File Structure 📂  

- `charts/`: Contains Helm charts for Synapse, SciChat, and PostgreSQL.  
- `values.yaml`: Default configuration values for Helm charts.  
- `README.md`: Documentation for the repository.  

---

## Contributing 🤝  

1. Fork the repository.  
2. Create a new branch:  
git checkout -b feature/your-feature  

3. Commit your changes:  
git commit -m "Add your feature"  

4. Push the branch:  
git push origin feature/your-feature  

5. Open a pull request.  

---

## License 📝  

This project is licensed under the MIT License. See the LICENSE file for details.

---

**Deploy scalable and robust SciChat solutions with ease!** 🌐✨  
