// ============================================================
// OGOLOMA LIBRARY — SUPABASE CONFIG
// Replace the two values below with your own from Supabase
// Dashboard → Settings → API
// ============================================================

const SUPABASE_URL = 'YOUR_SUPABASE_URL';         // e.g. https://xyzcompany.supabase.co
const SUPABASE_ANON_KEY = 'YOUR_SUPABASE_ANON_KEY'; // starts with eyJ...

// Create the Supabase client (loaded via CDN in each HTML page)
const { createClient } = supabase;
const _supabase = createClient(SUPABASE_URL, SUPABASE_ANON_KEY);
