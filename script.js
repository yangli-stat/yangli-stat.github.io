// Dark mode toggle
const toggle = document.getElementById('theme-toggle');

if (localStorage.theme === 'dark') {
  document.body.classList.add('dark');
  toggle.textContent = '☀️';
}

toggle.onclick = () => {
  document.body.classList.toggle('dark');
  const dark = document.body.classList.contains('dark');
  localStorage.theme = dark ? 'dark' : 'light';
  toggle.textContent = dark ? '☀️' : '🌙';
};

// Scroll reveal
const reveals = document.querySelectorAll('.reveal');
const observer = new IntersectionObserver(entries => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      entry.target.classList.add('visible');
    }
  });
});

reveals.forEach(r => observer.observe(r));
