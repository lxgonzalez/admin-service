# 🛠️ **Admin Service Module**

This module provides comprehensive microservices for **admin management** including: **Add**, **List**, **Delete**, and **Check** Admin functionalities.

---

## 📚 **Technologies Used**

- **Ruby 3.2**: The runtime environment for all services.
- **Sinatra**: A lightweight web framework used to build the REST APIs.
- **Sinatra ActiveRecord**: ORM for database interaction.
- **MySQL**: Relational database for storing admin data.
- **Docker**: Containerization and deployment.
- **Puma**: Web server for running Sinatra applications.

---

## 🛠️ **Microservices Overview**

➕ **Add Admin**: A microservice for adding new admins to the system.  
📋 **List Admin**: A microservice for retrieving and listing all admins in the system.  
🗑️ **Delete Admin**: A microservice for deleting an admin from the system by their ID.  
✅ **Check Admin**: A microservice that checks if an admin exists in the system by their ID.

---

## 💻 **Service Endpoints**
- Add Admin:
  POST /admin - Adds a new admin. Requires an email.

- List Admins:
  GET /admin - Lists all admins in the system.

- Delete Admin:
  DELETE /admin/:admin_id - Deletes the admin with the specified ID.

- Check Admin:
  GET /admin/:admin_id - Checks if an admin exists by their ID.

