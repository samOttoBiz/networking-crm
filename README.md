# Networking CRM  

A lightweight networking CRM built with **Lovable** (frontend), **Supabase** (database), and **n8n** (automation).  
This project was designed to practice integrating multiple free-tier developer tools into a working stack that supports CRUD operations, automation, and version control.  

---

## 📌 Project Overview  
This CRM helps track professional and academic networking contacts:  
- Add new contacts with name, email, company, notes, and next follow-up date.  
- View and edit existing contacts through a clean Lovable-generated UI.  
- Store all data securely in Supabase.  
- Receive a **daily email summary** (via n8n) listing all follow-ups due in the next 7 days.  

---

## 🛠️ Tech Stack  
- **Lovable** → No-code frontend connected to Supabase.  
- **Supabase** → PostgreSQL database + REST API (source of truth).  
- **n8n** → Automation platform for scheduling and sending follow-up reminder emails.  
- **GitHub** → Source control and documentation.  

---

## ⚙️ How It Works  
1. **Frontend**:  
   - Add/edit contacts through Lovable.  
   - Data writes directly to Supabase.  

2. **Database**:  
   - Supabase stores contacts with fields:  
     - `id`  
     - `name`  
     - `email`  
     - `company_name`  
     - `notes`  
     - `next_follow_up_date`  
     - `timestamp`  
     - `last_connected`  
     - `created_at`  
     - `updated_at`  

3. **Automation**:  
   - n8n runs a **daily Cron job**.  
   - Queries Supabase for all contacts with a follow-up date within the next 7 days.  
   - Formats results into a clean email and sends them automatically.  

---

## 🚀 Setup Instructions  

### 1. Supabase  
- Create a new project in Supabase.  
- Run the schema file:  
  ```sql
  CREATE TABLE contacts (
    id uuid primary key default gen_random_uuid(),
    name text not null,
    email text,
    company_name text,
    notes text,
    next_follow_up_date date,
    timestamp timestamptz default now(),
    last_connected timestamptz default now(),
    created_at timestamptz default now(),
    updated_at timestamptz default now()
  );
