# 🛠️ **Delete Admin Service**

The **Delete Admin Service** is a microservice developed using Ruby, Sinatra, ActiveRecord, and MySQL. Its primary functionality is to allow the deletion of an admin by their ID via an HTTP DELETE request.

---

## 🐳 **Deployment Docker Image**

Visit the repository on Docker Hub [here](https://hub.docker.com/r/lxgonzalez/admin-delete-service) 🐳

1. **Check if port 1031 is free**.
2. **Run the following command in your terminal**, replace the environment variables with your actual MySQL credentials:

```bash
   > docker pull lxgonzalez/admin-delete-service
   > docker pull lxgonzalez/admin-delete-service:latest
```

## 🚀**Deployment Locally**
Follow these steps to run the API on your local machine:

1. **Clone the Repository**
Clone this repository to your local machine:
```bash
git clone: https://github.com/lxgonzalez/admin-service
```
2. **Install Dependencies**
   
```bash
bundle install
```
3. **Run the Application**
```bash
bundle exec rake db:migrate
```
4. **Connecting to the Service**
Once the application is running, you can access the service by opening your browser and navigating to: http://localhost:1031

## 📡**API Endpoints**
Delete Admin
- URL: /admin/:admin_id
- Method: DELETE
- Description: Deletes an admin by their unique admin_id

Request Example:
To delete an admin with admin_id of 1234, send the following request:
```bash
curl --location --request DELETE 'http://localhost:1031/admin/1234'
```
Response: 
Success (200):
```json
{
  "message": "Admin with adminId 1234 deleted successfully."
}
```

---
## 📽️ Evidence
