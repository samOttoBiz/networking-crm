-- Networking CRM Contacts Table

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

-- Enable Row Level Security (RLS)
ALTER TABLE contacts ENABLE ROW LEVEL SECURITY;
