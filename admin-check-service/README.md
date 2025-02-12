# 🛠️ Check Admin Service

The **Check Admin Service** is a microservice developed using Ruby, Sinatra, ActiveRecord, and MySQL. Its primary functionality is to check whether a given email belongs to an existing admin in the system.

---

## 🐳 **Deployment Docker Image**

Visit the repository on Docker Hub [here](https://hub.docker.com/r/lxgonzalez/admin-check-service)

1. **Check if port 1031 is free.**
2. **Run the following command in your terminal**, replacing the environment variables with your actual MySQL credentials:

```bash
  > docker pull lxgonzalez/admin-check-service
  > docker pull lxgonzalez/admin-check-service:latest
```

## 🚀**Deployment Locally**
Follow these steps to run the API on your local machine:
1. **Clone the Repository**  

Clone this repository to your local machine:
```bash
git clone https://github.com/lxgonzalez/admin-check-service
```
2. **Install Dependencies**
   
```bash
bundle install
```
3. Run the Application
```bash
ruby app.rb
```
4. **Connecting to the Service**
   
Once the application is running, you can access the service by opening your browser and navigating to: http://localhost:1029

## 🛠️**Endpoints**
- Check if an Admin Exists
Endpoint: /checkAdmin/:email
  - Method: GET
  - Description: This endpoint checks if the provided email belongs to an admin user.
  - Parameters:
    - email (required): The email to check for admin status.
   
Example Request:
```bash
GET http://localhost:1029/checkAdmin/john.doe@example.com
```

Example Response:
```json
{
  "status": "OK",
  "message": "Admin exists"
}
```
---

## 📽️ **Evidence**
![image](https://github.com/user-attachments/assets/5cab9bb0-31ee-4b07-b751-ca20c9977458)



