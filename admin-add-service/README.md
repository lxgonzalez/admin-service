# 🛠️ Admin Add Service
The **Admin Add Service** is a microservice developed using **Sinatra**, **ActiveRecord**, and **MySQL**. Its primary functionality is to allow the addition of new administrators to the database via a REST API.

---

## 🐳 **Deployment with Docker**

The service is available on Docker Hub. You can pull the image using the following command:

```bash
> docker pull lxgonzalez/admin-add-service
> docker pull lxgonzalez/admin-add-service:latest
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
3. **Run database migrations**
```bash
bundle exec rake db:migrate
```

4. **Start the server**
```bash
ruby app.rb
```

5. **Connecting to the Service**
   
Once the application is running, you can access the service by opening your browser and navigating to: http://localhost:1028

## 📡**API Endpoints**
Method: GET /
Expected Response:
```json
"Add Admin Service is running ..."
```

## Add a new admin
Method: POST /admin
Request Body (JSON):
```json
{
  "email": "anahi@gmail.com"
}
```
Successful Response (201 Created):
```json
{
  "id": 1,
  "email": "admin@example.com"
}
```

**Example using curl**
```bash
curl --location --request POST 'http://localhost:1028/admin' \
--header 'Content-Type: application/json' \
--data-raw '{
  "email": "admin@example.com"
}'
```






