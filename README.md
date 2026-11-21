# MediSlot – Doctor Appointment Scheduling System

> *"Your Health, Your Time, Our Priority."*

A modern, full-stack healthcare appointment booking platform developed with **React.js** on the frontend, **Java 17 Spring Boot** on the backend, and **MySQL** as the primary relational database.

Designed specifically for **MCA / B.Tech / BCA academic project demonstrations, viva examinations, and portfolio presentations**, following clean layered enterprise architecture principles.

---

## 1. Technology Stack

| Layer | Technologies Used |
|---|---|
| **Frontend** | React.js 18, HTML5, CSS3, JavaScript (ES6+), React Router 6, Axios, Lucide Icons, QR Code Canvas, Vite |
| **Backend** | Java 17+, Spring Boot 3.2, Spring Web (REST APIs), Spring Data JPA, Hibernate ORM, Spring Validation, BCrypt Password Encoder |
| **Database** | MySQL 8.0+ |
| **Development Tools** | Eclipse IDE (for Spring Boot), VS Code (for React), MySQL Workbench, Postman |

> **Compliance Note:** No Node.js or Express.js backend is used. All backend business logic, validation, authentication, and database operations are executed strictly inside Java Spring Boot.

---

## 2. Core Features & Unique Innovations

### 1. Smart Specialty Finder
- Patients describe their health symptoms or general complaints in everyday language (e.g., *"severe knee pain and morning stiffness"* or *"chest palpitations"*).
- The system analyzes symptom keywords and recommends the appropriate clinical department (e.g., *Orthopedics* or *Cardiology*).
- **Academic Highlight:** Displays an explicit legal disclaimer that recommendations are navigation aids, not medical diagnoses.

### 2. Digital Appointment Pass with Verified QR Code
- Upon booking, MediSlot generates an official **Digital Health Entry Pass** with a unique tracking code (e.g., `MS-2026-8492`).
- Renders an interactive **QR Code** containing appointment metadata for express reception check-in.
- Includes a dedicated print CSS layout triggered via `window.print()` for physical or PDF passes.

### 3. Slot Collision Protection
- Real-time database locking prevents two patients from reserving the same doctor's slot simultaneously.
- Supported at both database level (MySQL unique constraints on `doctor_id + date + time + status_key`) and service level (`SlotCollisionException`).
- Slot automatically becomes re-available if an appointment is cancelled.

### 4. Patient Reviews & Dynamic Rating Recalculation
- Patients submit 1 to 5 star ratings and written reviews after completed consultations.
- Submissions dynamically recalculate the doctor's average rating in MySQL in real-time.

### 5. Appointment Reminders
- An in-app notification bell monitors upcoming bookings and provides contextual alerts.

### 6. Role-Based Portals (Patient & Doctor)
- **Patient Portal:** Search doctors, filter by specialty, book slots, view upcoming/completed/cancelled visits, reschedule, cancel, and download passes.
- **Doctor Portal:** View upcoming patient queue, review complaints/symptoms, confirm appointments, or mark visits as completed.

---

## 3. Demo Credentials for Viva / Evaluation

MediSlot provides one-click quick-fill buttons on the login screen for testing:

| Role | Email | Password | Preloaded Capabilities |
|---|---|---|---|
| **Patient Demo** | `patient@medislot.com` | `patient123` | Active appointment pass (`MS-2026-8492`), profile records, booking history |
| **Doctor Demo** | `doctor@medislot.com` | `doctor123` | Assigned to Dr. Sarah Jenkins (Cardiology), patient appointment management |

---

## 4. Project Directory Structure

```text
Appointment/
├── frontend/                     # React.js SPA (Vite)
│   ├── public/
│   ├── src/
│   │   ├── components/
│   │   │   ├── Navbar.jsx               # Navigation bar & reminder alerts
│   │   │   ├── Footer.jsx               # Healthcare footer with links & helpline
│   │   │   ├── DoctorCard.jsx           # Aesthetic doctor preview card
│   │   │   ├── DigitalPassModal.jsx     # Printable pass with QR code
│   │   │   ├── SmartSpecialtyModal.jsx  # Symptom-to-specialty guide
│   │   │   ├── RescheduleModal.jsx      # Slot reschedule dialog
│   │   │   └── ReviewModal.jsx          # 5-star rating & review submission
│   │   ├── pages/
│   │   │   ├── HomePage.jsx             # Hero, search, specialties, stats, CTA
│   │   │   ├── FindDoctorsPage.jsx      # Search, filter, and sorting
│   │   │   ├── DoctorProfilePage.jsx    # Doctor bio, slots, & patient reviews
│   │   │   ├── BookAppointmentPage.jsx  # Booking form with slot protection
│   │   │   ├── MyAppointmentsPage.jsx   # Upcoming, Completed, Cancelled tabs
│   │   │   ├── MyProfilePage.jsx        # Patient health info & records
│   │   │   ├── LoginPage.jsx            # Sign in with demo fast-fill
│   │   │   ├── RegisterPage.jsx         # Patient & Doctor registration
│   │   │   └── DoctorDashboardPage.jsx  # Doctor queue & status management
│   │   ├── services/
│   │   │   ├── api.js                   # Axios client (base URL http://localhost:8080/api)
│   │   │   ├── authService.js           # Auth operations & session management
│   │   │   ├── doctorService.js         # Doctor search, slots, & specialties
│   │   │   ├── appointmentService.js    # Booking, cancellation, & rescheduling
│   │   │   ├── reviewService.js         # Review submissions & fetching
│   │   │   └── mockFallbackData.js      # Resilient fallback dataset for presentation
│   │   ├── context/
│   │   │   └── AuthContext.jsx          # Global authentication state
│   │   ├── App.jsx                      # Application routes
│   │   ├── main.jsx                     # Entry point
│   │   └── index.css                    # Modern healthcare design system
│   ├── package.json
│   └── vite.config.js
│
├── backend/                      # Java 17 Spring Boot REST API
│   ├── src/main/java/com/medislot/
│   │   ├── config/
│   │   │   ├── CorsConfig.java          # Cross-Origin configuration
│   │   │   ├── SecurityConfig.java      # BCrypt password encoder
│   │   │   └── DataInitializer.java     # Auto-seeds MySQL on first boot
│   │   ├── controller/
│   │   │   ├── AuthController.java      # /api/auth/*
│   │   │   ├── DoctorController.java    # /api/doctors/*, /api/specialties
│   │   │   ├── AppointmentController.java # /api/appointments/*
│   │   │   ├── ReviewController.java    # /api/reviews/*
│   │   │   ├── UserController.java      # /api/users/*
│   │   │   ├── NotificationController.java # /api/notifications/*
│   │   │   └── SpecialtyController.java # /api/specialties/suggest
│   │   ├── dto/                         # Request & Response Data Transfer Objects
│   │   ├── entity/
│   │   │   ├── User.java                # Patient & Doctor credentials
│   │   │   ├── Doctor.java              # Medical profile & metrics
│   │   │   ├── Appointment.java         # Consultation records with slot lock
│   │   │   ├── AvailabilitySlot.java    # Doctor calendar slots
│   │   │   ├── Review.java              # Verified patient feedback
│   │   │   └── Notification.java        # Reminder alerts
│   │   ├── exception/
│   │   │   ├── GlobalExceptionHandler.java # Standardized JSON error response
│   │   │   ├── ResourceNotFoundException.java
│   │   │   ├── SlotCollisionException.java
│   │   │   └── BadRequestException.java
│   │   ├── repository/                  # Spring Data JPA Repositories
│   │   ├── service/                     # Layered Business Logic
│   │   └── MedislotApplication.java     # Spring Boot Main Entry
│   ├── src/main/resources/
│   │   └── application.properties       # MySQL connection & JPA configuration
│   ├── .project                         # Eclipse IDE project definition
│   ├── .classpath                       # Eclipse classpath definition
│   └── pom.xml                          # Maven build dependencies
│
├── database/
│   ├── schema.sql                       # Complete DDL with constraints & indexes
│   └── sample-data.sql                  # Seed data with 8 specialists across departments
│
├── postman/
│   └── medislot_collection.json         # Ready-to-import Postman API collection
├── run-frontend.bat                     # 1-Click Windows script to start React
└── run-backend.bat                      # 1-Click Windows script to start Spring Boot
```

---

## 5. Step-by-Step Setup Guide

### Step 1: Database Setup with MySQL Workbench

1. Launch **MySQL Workbench** and connect to your local MySQL instance (port `3306`).
2. Open `database/schema.sql`:
   - Click **File -> Open SQL Script...** and select `Appointment/database/schema.sql`.
   - Click the **Execute (Lightning)** icon to create `medislot_db` and all 6 tables.
3. Open and execute `database/sample-data.sql` to populate sample doctors, test accounts, and reviews.
4. *(Alternative)* Spring Boot will also automatically generate tables and seed sample data on first boot if you prefer!

### Step 2: Running Java Spring Boot Backend in Eclipse IDE

1. Open **Eclipse IDE for Enterprise Java and Web Developers**.
2. Go to **File -> Import... -> Maven -> Existing Maven Projects**.
3. Click **Browse...**, select the `backend` folder inside `Appointment`, and click **Finish**.
4. Check database credentials in `src/main/resources/application.properties`:
   ```properties
   spring.datasource.url=jdbc:mysql://localhost:3306/medislot_db?createDatabaseIfNotExist=true&useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC
   spring.datasource.username=root
   spring.datasource.password=root
   ```
   *(Change `password=root` to your MySQL root password if different).*
5. In the Project Explorer, expand `src/main/java/com/medislot`.
6. Right-click **`MedislotApplication.java` -> Run As -> Spring Boot App** (or **Java Application**).
7. The console will display:
   ```text
   =================================================================
    MediSlot - Doctor Appointment Scheduling System Backend is RUNNING!
    Base API URL: http://localhost:8080/api
   =================================================================
   ```

### Step 3: Running React Frontend in VS Code

1. Open **VS Code** and open the `frontend` folder.
2. In the VS Code terminal (`Ctrl + ~`), run:
   ```bash
   npm run dev
   ```
3. Open your browser and navigate to:
   ```
   http://localhost:5173
   ```
4. The frontend will communicate directly with Spring Boot REST APIs at `http://localhost:8080/api`.

---

## 6. REST API Endpoint Reference

| Method | Endpoint | Description |
|---|---|---|
| `POST` | `/api/auth/register` | Register new Patient or Doctor |
| `POST` | `/api/auth/login` | Authenticate user (BCrypt verification) |
| `GET` | `/api/doctors` | List doctors with optional `?search=` and `?specialization=` |
| `GET` | `/api/doctors/{id}` | Get complete profile of a specific doctor |
| `GET` | `/api/doctors/{id}/slots` | Get open/booked slots for a doctor on `?date=YYYY-MM-DD` |
| `GET` | `/api/specialties` | List all medical departments with doctor counts |
| `POST` | `/api/appointments` | Book appointment with transactional slot lock |
| `GET` | `/api/appointments/my` | Retrieve patient appointments with `?email=` |
| `GET` | `/api/appointments/doctor/{id}`| Retrieve incoming appointments for a doctor |
| `PUT` | `/api/appointments/{id}/cancel` | Cancel appointment and release the time slot |
| `PUT` | `/api/appointments/{id}/reschedule` | Reschedule appointment to a new date and time slot |
| `PUT` | `/api/appointments/{id}/status` | Update status (`CONFIRMED`, `COMPLETED`) |
| `GET` | `/api/reviews/doctor/{id}` | Fetch verified reviews and ratings for a doctor |
| `POST` | `/api/reviews` | Submit a patient review & update doctor's average rating |
| `POST` | `/api/specialties/suggest` | Smart Specialty Finder symptom analysis |

---

## 7. Testing with Postman

1. Open **Postman**.
2. Click **Import** in the top left corner.
3. Drag and drop `postman/medislot_collection.json`.
4. You will see organized folders:
   - **Authentication** (Login Patient, Login Doctor, Register)
   - **Doctors** (Doctor List, Search by Specialty, Slot Availability)
   - **Appointments** (Booking, My Appointments, Reschedule, Cancel)
   - **Reviews & Features** (Submit Review, Smart Specialty Finder)
5. Execute requests directly against `http://localhost:8080/api`.

---

## 8. Academic Evaluation Tips (Viva Q&A)

- **Q: Why Spring Boot over Node.js for Healthcare?**  
  *A: Spring Boot provides robust type safety, enterprise-grade transaction management (`@Transactional`), mature ORM (Hibernate) for complex relational schemas, and strong role-based access control.*

- **Q: How is slot collision prevented?**  
  *A: Collision protection operates on two levels: (1) A unique database constraint on `(doctor_id, appointment_date, appointment_time, status_key)`, and (2) Service-level pre-booking verification that throws a custom `SlotCollisionException` if another transaction reserved the slot.*

- **Q: How does the Digital QR Pass work?**  
  *A: The unique appointment number, patient name, doctor ID, date, and consultation type are encoded into a standard QR format on the client canvas, allowing clinic staff to verify patient identity instantly.*
