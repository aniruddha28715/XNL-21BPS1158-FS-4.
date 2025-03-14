## **🚀 XNL Freelance Marketplace - Full Stack Project**
### **By Aniruddha Kulkarni**
---

### **📌 Project Overview**
This project is a **Freelance Marketplace Web Application** built using:
- **Backend:** FastAPI with PostgreSQL & WebSockets
- **Frontend:** Next.js (React) with TailwindCSS
- **Database:** PostgreSQL + SQLAlchemy
- **Authentication:** JWT-based Authentication (Incomplete)
- **Real-time Features:** WebSockets for live job updates
- **Testing & CI/CD:** Jest (Frontend) & Pytest (Backend) - CI/CD (Not Fully Implemented)

---

## **🛠 Features Implemented**
### **✅ Backend (FastAPI)**
- REST API with **CRUD operations** for Jobs, Users, and Bids
- **PostgreSQL** database integration with SQLAlchemy ORM
- **WebSockets** for **real-time job posting updates**
- **Redis Caching** (Partially implemented, not fully tested)
- **JWT Authentication** (Token-based authentication for login)
- Basic **Unit Tests** using Pytest

### **✅ Frontend (Next.js)**
- **Job Posting System** with **Forms & Animations** (GSAP)
- **Live Job Updates** using **WebSockets**
- **API Integration** using **Axios**
- **Dark Mode Support** (Basic)
- **Responsive UI** using **TailwindCSS**
- **Frontend Testing with Jest & React Testing Library** (Not fully implemented)

### **✅ WebSockets (Real-Time Updates)**
- Successfully built **WebSocket-based real-time updates** for new job postings.
- When a job is posted, it **instantly appears on the frontend**.
- **WebSocket Errors:** Sometimes WebSocket would **disconnect randomly** (needs better error handling).

---

## **🚧 What I Could Not Fully Implement**
### ❌ **CI/CD Pipeline**
- Started working with **GitHub Actions** but couldn't complete it.
- Faced issues with **Dockerizing the application** for deployment.

### ❌ **Full Authentication System**
- JWT authentication **partially works**, but **password hashing & user sessions** are not fully implemented.
- **Login system works** but doesn’t store session properly.

### ❌ **Frontend Testing**
- Jest was configured, but encountered errors with **ECMAScript modules & Babel presets**.
- **Cypress testing** for end-to-end (E2E) tests was **not completed**.

### ❌ **Deployment**
- Backend **was not deployed** on AWS/GCP due to time constraints.
- **Dockerfile & Kubernetes configs are incomplete**.

### ❌ **Smart Contract Integration**
- Started exploring **Ethereum Smart Contracts** for payments.
- Tried using **Hardhat**, but **couldn’t fully integrate** it with the app.

---

## **🔥 Challenges Faced**
### **Backend Issues**
- Faced multiple issues with **SQLAlchemy & Alembic migrations**.
- Encountered **circular import errors** between models and main FastAPI app.
- **WebSockets worked**, but **sometimes failed to reconnect**.

### **Frontend Issues**
- **CORS errors** while trying to connect FastAPI to Next.js frontend.
- Axios **"Network Error"** due to incorrect **API_URL environment variable**.
- **Jest testing issues** due to **missing Babel configurations**.

### **GitHub Push Issues**
- GitHub **blocked my push** because it detected **a secret/API key**.
- Had to **rewrite Git history** to remove sensitive info.

---

## **📸 Output Screenshots**
I **highly recommend checking the screenshots** of my progress, as I put in a lot of effort but couldn’t fully complete some parts. **Please review the screenshots before judging the project!** 📷

---

## **🔮 Future Improvements**
1. **Fix CI/CD Pipeline** to deploy automatically.
2. **Complete authentication system** with hashed passwords & OAuth support.
3. **Deploy Backend & Frontend** using Docker + Kubernetes.
4. **Fix Jest issues** and write full test cases.
5. **Complete Ethereum Smart Contract Integration**.

---

## **📢 Final Words**
I have put in **a lot of effort** into this project and tried to **implement everything I could**. Despite the challenges, **the core functionalities are working**, especially the **real-time WebSockets for job posting**.  

I **couldn't complete** everything due to time constraints, but I learned **a lot** about **FastAPI, WebSockets, PostgreSQL, and CI/CD**.  

If you’re reviewing this project, **please look at the screenshots for a better understanding of my work.** 🛠  

---
🚀 **Thank you for reviewing my project!** 🙌
