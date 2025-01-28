document.addEventListener("DOMContentLoaded", (event) => {
  const cookies = document.cookie.split(";");
  cookies.forEach((cookie) => {
    console.log(cookie.trim());
  });
});
