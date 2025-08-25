# QR Ordering App (MVP)

Scan a table QR → browse menu → place order → kitchen sees live tickets → update status (Pending → Cooking → Ready → Served).

> Solo-dev, Agile-lite, monorepo (API + Web). Built for fast demo + portfolio.

---

## 🚀 Features (MVP)
- Guest diner flow (no login): scan QR → menu → cart → submit order
- Kitchen ticket screen with real-time updates
- Owner/admin login (basic) for menu management (CRUD)
- Status timeline visible to diner

**Out of scope (v1):** payments, multi-stall, inventory, printers

---

## 🧱 Architecture
- **Frontend**: React + Vite + TypeScript (mobile-first)
- **Backend**: Spring Boot (Java 17), REST, Actuator
- **DB**: MySQL (planned); running **without DB** in Sprint 0
- **Realtime**: (planned) Supabase Realtime or Firebase
- **Repo layout**
qr-ordering-app/
api/ # Spring Boot
web/ # React + Vite
docs/ # SRS, diagrams, ADRs
ops/ # compose, CI scripts (later)

---

## ✅ Getting Started (Dev)

### Requirements
- Java 17 (Temurin), Node.js 20, Git
- (Optional) Docker Desktop for DB later

1) Backend (API)

cd api
# run (Sprint 0: no DB)
./mvnw spring-boot:run
# healthcheck
# -> http://localhost:8080/actuator/health  ==> {"status":"UP"}

Temporary config to run WITHOUT a DB (already set):

# src/main/resources/application.properties
spring.autoconfigure.exclude=\
org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration,\
org.springframework.boot.autoconfigure.orm.jpa.HibernateJpaAutoConfiguration,\
org.springframework.boot.autoconfigure.data.jpa.JpaRepositoriesAutoConfiguration
management.endpoints.web.exposure.include=health,info

Test endpoint:
curl http://localhost:8080/api/hello
# Hello from QR Ordering API 👋

2) Frontend (Web)
cd web
npm i
npm run dev
# -> http://localhost:5173

🧪 Scripts
API: ./mvnw test, ./mvnw spring-boot:run
Web: npm run dev, npm run build, npm run preview

🗺️ Roadmap

Sprint 0: repo, hello flow, CI, SRS
Sprint 1: FR-1~FR-3 (scan QR → order → kitchen sees)
Sprint 2: FR-4~FR-6 (status updates + admin menu)
Sprint 3: Tables + QR + basic report
Polish: tests, seed data, demo video

🧩 Backlog (FR IDs)

FR-1 Scan QR → view menu (Must)
FR-2 Add to cart → submit order (Must)
FR-3 Kitchen sees new orders instantly (Must)
FR-4 Kitchen updates status (Must)
FR-5 Diner sees live status (Must)
FR-6 Owner manages menu (Must)
FR-7 Tables & QR (Should)
FR-8 Daily report CSV (Should)
FR-9 Admin auth (Must)
FR-10 Audit logs (Could)

Contributing / Workflow (solo agile)

Issues = user stories (with AC)
Branch → PR → CI green → merge
Update /docs if behavior changes

