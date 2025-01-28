document.addEventListener("DOMContentLoaded", () => {
  const cookies = document.cookie.split(";");
  cookies.forEach((cookie) => {
    console.log(cookie.trim());
    document.cookie =
      cookie.trim() + "; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
  });
});
