// ============================================================
// OGOLOMA LIBRARY — SUPABASE CONFIG
// Replace the two values below with your own from Supabase
// Dashboard → Settings → API
// ============================================================

const SUPABASE_URL = 'https://lowyuuuexkqmctzwxyik.supabase.co';         // e.g. https://xyzcompany.supabase.co
const SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imxvd3l1dXVleGtxbWN0end4eWlrIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODI2NTI1NTUsImV4cCI6MjA5ODIyODU1NX0.E0APjfeWJH1QEU2K9biiPwc5UX0xN7lZBmo9P7_2dFY'; // starts with eyJ...

// Create the Supabase client (loaded via CDN in each HTML page)
const { createClient } = supabase;
const _supabase = createClient(SUPABASE_URL, SUPABASE_ANON_KEY);
