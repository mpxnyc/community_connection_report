/* ============================================================
   MPX NYC — Scroll Animation + Floating CTA Logic
   ============================================================ */

// 1️⃣ Fade-in animation for any element with class="reveal"
const observer = new IntersectionObserver((entries) => {
  entries.forEach((entry) => {
    if (entry.isIntersecting) {
      entry.target.classList.add('show');
    }
  });
}, { threshold: 0.12 });

// Observe all elements marked for reveal
document.querySelectorAll('.reveal').forEach((el) => observer.observe(el));


// 2️⃣ Floating “Join the Seminar” button logic
const floatBtn = document.getElementById('floatCta');
if (floatBtn) {
  window.addEventListener('scroll', () => {
    const scrollTrigger = 900; // px — adjust if needed
    if (window.scrollY > scrollTrigger) {
      floatBtn.classList.add('visible');
    } else {
      floatBtn.classList.remove('visible');
    }
  });
}


// 3️⃣ Optional: smooth scroll fallback for older browsers
document.querySelectorAll('a[href^="#"]').forEach((anchor) => {
  anchor.addEventListener('click', function (e) {
    const targetId = this.getAttribute('href');
    if (targetId.startsWith('#') && targetId.
