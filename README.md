# Software Engineering & Fullstack Workbook

## Projects

> built incorporating the core concepts of software engineering and fullstack development detailed in the workbook.

## Workbook

### **1. Foundations of Software Engineering**

- **Core Concepts**: Software Development Lifecycle, Agile, DevOps, CI/CD
- **Programming Paradigms**: Object-Oriented, Functional, Event-Driven
- **Design Principles**: SOLID, DRY, KISS, YAGNI
- **Software Design Patterns**: Creational, Structural, Behavioral
- **Algorithms & Data Structures**: Sorting, Trees, Graphs, Hashing

### **2. System Design & Architecture**

- **Monolith vs. Microservices**
- **Monorepo vs. Polyrepo**
- **Event-Driven Architecture**
- **Database Design & Scaling**
- **Caching Strategies & Performance Optimization**
- **Security Best Practices**

### **3. Web Development & APIs**

- **Frontend Engineering**: React, TypeScript, Preact, Storybook
- **Backend Engineering**: Node.js, Express.js, Nest.js
- **REST vs. GraphQL vs. gRPC**
- **API Design Principles & Pitfalls**
- **Authentication & Authorization**: JWT, OAuth, OpenID

### **4. Cloud & Infrastructure**

- **AWS Services**: Lambda, API Gateway, DynamoDB, S3, SQS
- **Infrastructure as Code**: Terraform, CloudFormation
- **Containerization**: Docker, Kubernetes
- **Serverless & Scaling Strategies**
- **Monitoring & Logging**: Prometheus, ELK Stack, CloudWatch

### **5. Software Testing & Automation**

- **Unit, Integration, and End-to-End Testing**
- **Contract Testing with Pact**
- **Test-Driven Development (TDD) & Behavior-Driven Development (BDD)**
- **Test Automation Frameworks**: Jest, Mocha, WebdriverIO, Cypress
- **CI/CD Pipelines & Deployment Strategies**

### **6. Machine Learning & AI in Software Engineering**

- **ML for Automation & Testing**
- **AWS SageMaker & Rekognition for Object Detection**
- **Data Engineering Principles**
- **Practical Applications in Software Development**

### **7. Cybersecurity**

- **Fundamentals of Cybersecurity**
- **Common Threats & Vulnerabilities**
- **Secure Coding Practices**
- **Network Security**
- **Incident Response & Management**

### **8. Project Management & Engineering Leadership**

- **Agile & Scrum Practices**
- **Software Development Metrics & KPIs**
- **Mentoring & Technical Leadership**
- **Scaling Teams & Engineering Culture**
- **Workshop & Hackathon Organization**

### **9. Personal Knowledge Management & Career Development**

- **Building a Knowledge Matrix**
- **Tracking Learning Goals with SMART Criteria**
- **Applying Bloom’s Taxonomy to Software Learning**
- **Gamifying Knowledge Growth**

## How to use
### Setup Jupiter Notebook for Local API Testing
- RUN: `python3 -m venv .venv` -  to create a python virtual environment (make sure .venv is in .gitignore)
- RUN: `source .venv/bin/activate` - to activate the virtual environment
- RUN: `pip install -r jupiter-notebook-requirements.txt` - to install the required packages
- RUN: `pip freeze > jupiter-notebook-requirements.lock.txt` - to save the installed packages
- RUN: `python -m ipykernel install --user --name=.venv --display-name "Python (.venv)"` - to add the virtual environment to jupiter notebook
- RUN: `jupyter notebook` - to start the jupiter notebook server
- OPEN: `http://localhost:8888/` - to access the jupiter notebook server
- SELECT: `Python (.venv)` - to create a new notebook using the virtual environment
