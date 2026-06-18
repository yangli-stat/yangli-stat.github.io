document.addEventListener("DOMContentLoaded", function () {
  const themeToggle = document.getElementById("theme-toggle");
  const savedTheme = localStorage.getItem("theme");

  if (savedTheme === "dark") {
    document.body.classList.add("dark");
    themeToggle.textContent = "☀";
  }

  themeToggle.addEventListener("click", function () {
    document.body.classList.toggle("dark");
    const isDark = document.body.classList.contains("dark");
    localStorage.setItem("theme", isDark ? "dark" : "light");
    themeToggle.textContent = isDark ? "☀" : "☾";
  });

  const publicationsToggle = document.getElementById("publications-toggle");
  const publicationList = document.getElementById("publication-list");

  if (publicationsToggle && publicationList) {
    publicationsToggle.addEventListener("click", function () {
      const isExpanded = publicationList.classList.toggle("expanded");
      publicationsToggle.setAttribute("aria-expanded", String(isExpanded));
      publicationsToggle.textContent = isExpanded
        ? "Show fewer publications"
        : "Show more publications";
    });
  }

  const teachingToggle = document.getElementById("teaching-toggle");
  const teachingList = document.getElementById("teaching-list");

  if (teachingToggle && teachingList) {
    teachingToggle.addEventListener("click", function () {
      const isExpanded = teachingList.classList.toggle("expanded");
      teachingToggle.setAttribute("aria-expanded", String(isExpanded));
      teachingToggle.textContent = isExpanded
        ? "Show fewer courses"
        : "Show more courses";
    });
  }
});