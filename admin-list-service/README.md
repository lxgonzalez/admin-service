# 🛠️ **List Admin Service**

The **List Admin Service** is a microservice developed using Ruby, Sinatra, ActiveRecord, and MySQL. Its primary functionality is to allow the listing of all admins from the database via an HTTP GET request.

---

## 🐳 **Deployment Docker Image**

Visit the repository on Docker Hub [here](https://hub.docker.com/r/lxgonzalez/list-admin-service) 🐳

1. **Check if port 1031 is free**.
2. **Run the following command in your terminal**, replace the environment variables with your actual MySQL credentials:

   ```bash
   > docker pull lxgonzalez/admin-list-service
   > docker pull lxgonzalez/admin-list-service:latest

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
List All Admins
- URL: /admin
- Method: GET
- Description: Retrieves a list of all admins from the database.

Request Example:

To list all admins, send the following request:
```bash
curl --location --request GET 'http://localhost:1031/admin'
```
Response:
Success (200):
```json
[
  {
    "id": 1,
    "email": "admin1@gmail.com"
  },
  {
    "id": 2,
    "email": "admin2@gmail.com"
  }
]
```

---
## 📽️ Evidence
