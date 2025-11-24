# Backend Development Guide for Medilinko

## Overview
This document provides a comprehensive guide for developing the backend for Medilinko healthcare app.

## Technology Stack Recommendations

### Option 1: Node.js + Express + MongoDB (Recommended for Quick Start)

**Pros:**
- Fast development
- JavaScript full-stack
- Flexible schema with MongoDB
- Large community support

**Tech Stack:**
- Node.js + Express.js
- MongoDB + Mongoose
- JWT for authentication
- Multer for file uploads
- Socket.io for real-time features

### Option 2: Python + Django + PostgreSQL

**Pros:**
- Robust and secure
- Excellent for healthcare apps
- PostgreSQL reliability
- Django ORM

**Tech Stack:**
- Python 3.10+
- Django + Django REST Framework
- PostgreSQL
- JWT authentication
- Celery for background tasks

### Option 3: Spring Boot + MySQL (Enterprise Level)

**Pros:**
- Enterprise-grade
- Type-safe
- Excellent for large scale
- Strong security features

**Tech Stack:**
- Java 17+ / Kotlin
- Spring Boot + Spring Security
- MySQL / PostgreSQL
- JWT authentication
- Spring Data JPA

## Recommended: Node.js + Express Backend Structure

```
backend/
├── src/
│   ├── config/
│   │   ├── database.js          # Database configuration
│   │   ├── environment.js       # Environment variables
│   │   └── jwt.js               # JWT configuration
│   ├── models/
│   │   ├── User.js              # User model
│   │   ├── Doctor.js            # Doctor model
│   │   ├── Patient.js           # Patient model
│   │   ├── Pharmacist.js        # Pharmacist model
│   │   ├── Appointment.js       # Appointment model
│   │   ├── Prescription.js      # Prescription model
│   │   ├── Medicine.js          # Medicine model
│   │   └── MedicineBatch.js     # Medicine batch model
│   ├── controllers/
│   │   ├── authController.js    # Authentication logic
│   │   ├── doctorController.js  # Doctor operations
│   │   ├── patientController.js # Patient operations
│   │   ├── pharmacistController.js
│   │   ├── appointmentController.js
│   │   ├── prescriptionController.js
│   │   └── medicineController.js
│   ├── routes/
│   │   ├── auth.js              # Auth routes
│   │   ├── doctors.js           # Doctor routes
│   │   ├── patients.js          # Patient routes
│   │   ├── pharmacists.js       # Pharmacist routes
│   │   ├── appointments.js      # Appointment routes
│   │   ├── prescriptions.js     # Prescription routes
│   │   └── medicines.js         # Medicine routes
│   ├── middleware/
│   │   ├── auth.js              # JWT verification
│   │   ├── roleCheck.js         # Role-based access
│   │   ├── errorHandler.js      # Error handling
│   │   └── upload.js            # File upload handling
│   ├── utils/
│   │   ├── validation.js        # Input validation
│   │   ├── sendEmail.js         # Email utility
│   │   └── helpers.js           # Helper functions
│   └── app.js                   # Express app setup
├── uploads/                     # Uploaded files
│   ├── prescriptions/
│   └── profiles/
├── .env                         # Environment variables
├── .env.example                 # Example env file
├── package.json
└── server.js                    # Entry point
```

## Database Schema (MongoDB)

### Users Collection
```javascript
{
  _id: ObjectId,
  email: String (unique, required),
  password: String (hashed, required),
  name: String (required),
  phone: String (required),
  role: String (enum: ['doctor', 'pharmacist', 'patient']),
  profileImage: String (URL),
  isVerified: Boolean,
  isActive: Boolean,
  createdAt: Date,
  updatedAt: Date
}
```

### Doctors Collection
```javascript
{
  _id: ObjectId,
  userId: ObjectId (ref: 'User'),
  specialty: String (required),
  qualification: String (required),
  experienceYears: Number,
  clinicName: String (required),
  clinicAddress: String (required),
  location: {
    type: {type: String, default: 'Point'},
    coordinates: [Number] // [longitude, latitude]
  },
  workingHours: {
    start: String,
    end: String
  },
  consultationFee: Number,
  rating: Number (default: 0),
  totalRatings: Number (default: 0),
  bio: String,
  availability: [String], // Days available
  createdAt: Date,
  updatedAt: Date
}
// Create geospatial index for location
```

### Patients Collection
```javascript
{
  _id: ObjectId,
  userId: ObjectId (ref: 'User'),
  dateOfBirth: Date (required),
  gender: String (enum: ['male', 'female', 'other']),
  bloodGroup: String,
  height: Number, // in cm
  weight: Number, // in kg
  address: String,
  allergies: [String],
  chronicDiseases: [String],
  emergencyContact: {
    name: String,
    phone: String,
    relation: String
  },
  createdAt: Date,
  updatedAt: Date
}
```

### Appointments Collection
```javascript
{
  _id: ObjectId,
  patientId: ObjectId (ref: 'Patient'),
  doctorId: ObjectId (ref: 'Doctor'),
  appointmentDate: Date (required),
  timeSlot: String (required),
  status: String (enum: ['pending', 'confirmed', 'completed', 'cancelled']),
  symptoms: String,
  diagnosis: String,
  notes: String,
  createdAt: Date,
  updatedAt: Date
}
// Create indexes on doctorId, patientId, appointmentDate
```

### Prescriptions Collection
```javascript
{
  _id: ObjectId,
  patientId: ObjectId (ref: 'Patient'),
  doctorId: ObjectId (ref: 'Doctor'),
  appointmentId: ObjectId (ref: 'Appointment'),
  prescriptionDate: Date (required),
  diagnosis: String (required),
  medicines: [{
    medicineName: String,
    dosage: String,
    frequency: String,
    durationDays: Number,
    instructions: String
  }],
  additionalNotes: String,
  prescriptionImage: String (URL),
  createdAt: Date,
  updatedAt: Date
}
```

### Medicines Collection
```javascript
{
  _id: ObjectId,
  name: String (required),
  genericName: String,
  category: String (required),
  manufacturer: String,
  description: String,
  price: Number (required),
  requiresPrescription: Boolean,
  createdAt: Date,
  updatedAt: Date
}
```

### MedicineBatches Collection
```javascript
{
  _id: ObjectId,
  medicineId: ObjectId (ref: 'Medicine'),
  pharmacistId: ObjectId (ref: 'User'),
  batchNumber: String (unique, required),
  quantity: Number (required),
  remainingQuantity: Number (required),
  manufacturingDate: Date (required),
  expiryDate: Date (required),
  purchasePrice: Number,
  sellingPrice: Number,
  createdAt: Date,
  updatedAt: Date
}
// Create index on expiryDate for alerts
```

## API Endpoints

### Authentication Endpoints

```
POST   /api/auth/register
Body: { email, password, name, phone, role }
Response: { user, token }

POST   /api/auth/login
Body: { email, password, role }
Response: { user, token }

POST   /api/auth/logout
Headers: { Authorization: Bearer <token> }
Response: { message }

GET    /api/auth/me
Headers: { Authorization: Bearer <token> }
Response: { user }

POST   /api/auth/forgot-password
Body: { email }
Response: { message }

POST   /api/auth/reset-password
Body: { token, newPassword }
Response: { message }
```

### Doctor Endpoints

```
GET    /api/doctors
Query: ?specialty=&location=&page=&limit=
Response: { doctors[], pagination }

GET    /api/doctors/:id
Response: { doctor }

PUT    /api/doctors/:id
Headers: { Authorization: Bearer <token> }
Body: { doctor details }
Response: { doctor }

GET    /api/doctors/:id/appointments
Headers: { Authorization: Bearer <token> }
Query: ?date=&status=
Response: { appointments[] }

GET    /api/doctors/:id/patients
Headers: { Authorization: Bearer <token> }
Response: { patients[] }

POST   /api/doctors/:id/prescriptions
Headers: { Authorization: Bearer <token> }
Body: { prescription details }
Response: { prescription }
```

### Patient Endpoints

```
GET    /api/patients/:id
Headers: { Authorization: Bearer <token> }
Response: { patient }

PUT    /api/patients/:id
Headers: { Authorization: Bearer <token> }
Body: { patient details }
Response: { patient }

GET    /api/patients/:id/appointments
Headers: { Authorization: Bearer <token> }
Query: ?status=&upcoming=true
Response: { appointments[] }

POST   /api/patients/:id/appointments
Headers: { Authorization: Bearer <token> }
Body: { doctorId, date, timeSlot, symptoms }
Response: { appointment }

GET    /api/patients/:id/prescriptions
Headers: { Authorization: Bearer <token> }
Response: { prescriptions[] }
```

### Appointment Endpoints

```
GET    /api/appointments/:id
Headers: { Authorization: Bearer <token> }
Response: { appointment }

PUT    /api/appointments/:id
Headers: { Authorization: Bearer <token> }
Body: { status, notes }
Response: { appointment }

DELETE /api/appointments/:id
Headers: { Authorization: Bearer <token> }
Response: { message }

GET    /api/appointments/available-slots
Query: ?doctorId=&date=
Response: { availableSlots[] }
```

### Prescription Endpoints

```
GET    /api/prescriptions/:id
Headers: { Authorization: Bearer <token> }
Response: { prescription }

POST   /api/prescriptions
Headers: { Authorization: Bearer <token> }
Body: { prescription details }
Response: { prescription }

POST   /api/prescriptions/upload-image
Headers: { Authorization: Bearer <token> }
Body: FormData with image file
Response: { imageUrl }
```

### Medicine Endpoints (Pharmacist)

```
GET    /api/medicines
Query: ?search=&category=&page=&limit=
Response: { medicines[], pagination }

POST   /api/medicines
Headers: { Authorization: Bearer <token> }
Body: { medicine details }
Response: { medicine }

GET    /api/medicines/:id
Response: { medicine }

PUT    /api/medicines/:id
Headers: { Authorization: Bearer <token> }
Body: { medicine details }
Response: { medicine }

GET    /api/medicine-batches
Headers: { Authorization: Bearer <token> }
Query: ?pharmacistId=&medicineId=
Response: { batches[] }

POST   /api/medicine-batches
Headers: { Authorization: Bearer <token> }
Body: { batch details }
Response: { batch }

PUT    /api/medicine-batches/:id
Headers: { Authorization: Bearer <token> }
Body: { remainingQuantity }
Response: { batch }

GET    /api/medicine-batches/expiring
Headers: { Authorization: Bearer <token> }
Query: ?days=30
Response: { expiringBatches[] }

GET    /api/medicine-batches/expired
Headers: { Authorization: Bearer <token> }
Response: { expiredBatches[] }
```

## Security Implementation

### 1. Password Hashing
```javascript
const bcrypt = require('bcryptjs');

// Hash password before saving
const salt = await bcrypt.genSalt(10);
user.password = await bcrypt.hash(password, salt);

// Compare password
const isMatch = await bcrypt.compare(password, user.password);
```

### 2. JWT Authentication
```javascript
const jwt = require('jsonwebtoken');

// Generate token
const token = jwt.sign(
  { userId: user._id, role: user.role },
  process.env.JWT_SECRET,
  { expiresIn: '7d' }
);

// Verify token middleware
const auth = (req, res, next) => {
  const token = req.header('Authorization')?.replace('Bearer ', '');
  if (!token) return res.status(401).json({ error: 'No token provided' });
  
  try {
    const decoded = jwt.verify(token, process.env.JWT_SECRET);
    req.user = decoded;
    next();
  } catch (error) {
    res.status(401).json({ error: 'Invalid token' });
  }
};
```

### 3. Role-Based Access Control
```javascript
const checkRole = (roles) => {
  return (req, res, next) => {
    if (!roles.includes(req.user.role)) {
      return res.status(403).json({ error: 'Access denied' });
    }
    next();
  };
};

// Usage
router.post('/appointments', auth, checkRole(['patient']), createAppointment);
```

### 4. Input Validation
```javascript
const { body, validationResult } = require('express-validator');

const validateRegister = [
  body('email').isEmail().normalizeEmail(),
  body('password').isLength({ min: 6 }),
  body('name').trim().isLength({ min: 2 }),
  body('phone').matches(/^[0-9]{10}$/),
  body('role').isIn(['doctor', 'pharmacist', 'patient'])
];
```

## Environment Variables (.env)

```env
# Server
NODE_ENV=development
PORT=5000

# Database
MONGODB_URI=mongodb://localhost:27017/medilinko

# JWT
JWT_SECRET=your_super_secret_jwt_key_here
JWT_EXPIRE=7d

# File Upload
MAX_FILE_SIZE=5242880  # 5MB
UPLOAD_PATH=./uploads

# Email (Optional)
SMTP_HOST=smtp.gmail.com
SMTP_PORT=587
SMTP_USER=your_email@gmail.com
SMTP_PASS=your_app_password

# Google Maps (Optional)
GOOGLE_MAPS_API_KEY=your_google_maps_key

# Frontend URL (for CORS)
CLIENT_URL=http://localhost:3000
```

## Quick Start Backend Setup

### 1. Initialize Project
```bash
mkdir medilinko-backend
cd medilinko-backend
npm init -y
```

### 2. Install Dependencies
```bash
npm install express mongoose bcryptjs jsonwebtoken cors dotenv
npm install express-validator multer
npm install --save-dev nodemon
```

### 3. Create Basic Server (server.js)
```javascript
const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');
require('dotenv').config();

const app = express();

// Middleware
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Database connection
mongoose.connect(process.env.MONGODB_URI, {
  useNewUrlParser: true,
  useUnifiedTopology: true
})
.then(() => console.log('MongoDB connected'))
.catch(err => console.error('MongoDB connection error:', err));

// Routes
app.use('/api/auth', require('./src/routes/auth'));
app.use('/api/doctors', require('./src/routes/doctors'));
app.use('/api/patients', require('./src/routes/patients'));
app.use('/api/appointments', require('./src/routes/appointments'));
app.use('/api/prescriptions', require('./src/routes/prescriptions'));
app.use('/api/medicines', require('./src/routes/medicines'));

// Error handling
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).json({ error: 'Something went wrong!' });
});

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
```

### 4. Update package.json scripts
```json
"scripts": {
  "start": "node server.js",
  "dev": "nodemon server.js"
}
```

### 5. Run Development Server
```bash
npm run dev
```

## Testing APIs

Use tools like:
- **Postman**: https://www.postman.com/
- **Insomnia**: https://insomnia.rest/
- **Thunder Client** (VS Code extension)

## Deployment Options

1. **Heroku** (Easy for beginners)
2. **DigitalOcean** (VPS)
3. **AWS EC2** (Scalable)
4. **Railway** (Modern, easy)
5. **Render** (Free tier available)

## Additional Features to Implement

1. **Email Notifications**: Appointment confirmations, reminders
2. **SMS Notifications**: Using Twilio
3. **Push Notifications**: Using Firebase Cloud Messaging
4. **File Storage**: AWS S3 or Cloudinary for images
5. **Caching**: Redis for performance
6. **Rate Limiting**: Prevent API abuse
7. **Logging**: Winston or Morgan
8. **Real-time Chat**: Socket.io
9. **Payment Integration**: Stripe or Razorpay

## Performance Optimization

1. **Database Indexing**
```javascript
// Create indexes for frequently queried fields
doctorSchema.index({ specialty: 1, 'location': '2dsphere' });
appointmentSchema.index({ doctorId: 1, appointmentDate: 1 });
```

2. **Pagination**
```javascript
const page = parseInt(req.query.page) || 1;
const limit = parseInt(req.query.limit) || 20;
const skip = (page - 1) * limit;

const doctors = await Doctor.find()
  .skip(skip)
  .limit(limit);
```

3. **Caching with Redis**
```javascript
const redis = require('redis');
const client = redis.createClient();

// Cache frequently accessed data
const cachedData = await client.get('doctors:list');
if (cachedData) {
  return JSON.parse(cachedData);
}
```

## Monitoring and Logging

```javascript
const winston = require('winston');

const logger = winston.createLogger({
  level: 'info',
  format: winston.format.json(),
  transports: [
    new winston.transports.File({ filename: 'error.log', level: 'error' }),
    new winston.transports.File({ filename: 'combined.log' })
  ]
});
```

## Next Steps

1. Set up the backend server
2. Create database models
3. Implement authentication
4. Build API endpoints
5. Test with Postman
6. Connect Flutter app to backend
7. Deploy to production

---

**Good luck with your backend development!** 🚀
