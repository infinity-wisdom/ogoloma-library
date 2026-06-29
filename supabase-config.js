// ============================================================
// OGOLOMA LIBRARY — SUPABASE CONFIG
// Replace the two values below with your own from Supabase
// Dashboard → Settings → API
// ============================================================

const SUPABASE_URL = 'https://lowyuuuexkqmctzwxyik.supabase.co';         // e.g. https://xyzcompany.supabase.co
const SUPABASE_ANON_KEY = 'sb_publishable_N25vmBnSQwJzmOBfBAXCPw_rDvPzxoz'; // starts with eyJ...

// Create the Supabase client (loaded via CDN in each HTML page)
const { createClient } = supabase;
const _supabase = createClient(SUPABASE_URL, SUPABASE_ANON_KEY);
