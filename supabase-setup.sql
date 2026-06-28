-- ============================================================
-- OGOLOMA LIBRARY — SUPABASE DATABASE SETUP
-- Run this entire file in: Supabase Dashboard → SQL Editor
-- ============================================================

-- 1. Members profile table
--    (Supabase already stores email/password in auth.users)
--    This table stores the extra library-specific info.

CREATE TABLE IF NOT EXISTS public.members (
  id          UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  full_name   TEXT NOT NULL,
  reg_number  TEXT UNIQUE NOT NULL,
  department  TEXT,
  email       TEXT NOT NULL,
  phone       TEXT,
  role        TEXT NOT NULL DEFAULT 'member',  -- 'member' or 'admin'
  joined_at   TIMESTAMPTZ DEFAULT NOW()
);

-- 2. Enable Row Level Security (users can only see their own row)
ALTER TABLE public.members ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Members can view own profile"
  ON public.members FOR SELECT
  USING (auth.uid() = id);

CREATE POLICY "Members can update own profile"
  ON public.members FOR UPDATE
  USING (auth.uid() = id);

CREATE POLICY "Anyone can insert during registration"
  ON public.members FOR INSERT
  WITH CHECK (auth.uid() = id);

-- 3. Books table
CREATE TABLE IF NOT EXISTS public.books (
  id            UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  title         TEXT NOT NULL,
  author        TEXT NOT NULL,
  isbn          TEXT UNIQUE,
  category      TEXT,
  copies_total  INT NOT NULL DEFAULT 1,
  copies_avail  INT NOT NULL DEFAULT 1,
  added_at      TIMESTAMPTZ DEFAULT NOW()
);

ALTER TABLE public.books ENABLE ROW LEVEL SECURITY;

-- All logged-in users can view books
CREATE POLICY "Authenticated users can view books"
  ON public.books FOR SELECT
  TO authenticated
  USING (true);

-- 4. Borrowing / circulation table
CREATE TABLE IF NOT EXISTS public.borrowings (
  id            UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  member_id     UUID REFERENCES public.members(id),
  book_id       UUID REFERENCES public.books(id),
  borrowed_at   TIMESTAMPTZ DEFAULT NOW(),
  due_at        TIMESTAMPTZ,
  returned_at   TIMESTAMPTZ,
  status        TEXT DEFAULT 'active'  -- 'active', 'returned', 'overdue'
);

ALTER TABLE public.borrowings ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Members can view own borrowings"
  ON public.borrowings FOR SELECT
  USING (auth.uid() = member_id);

-- ============================================================
-- TO MAKE AN ADMIN:
-- After a user registers, run this in the SQL editor:
-- UPDATE public.members SET role = 'admin' WHERE email = 'your@email.com';
-- ============================================================
