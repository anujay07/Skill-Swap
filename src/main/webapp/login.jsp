<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Login - SkillSwap</title>
  <link rel="stylesheet" href="assets/login.css">
  <script>
  window.addEventListener("DOMContentLoaded", () => {
    const popup = document.getElementById("popup");
    if (popup && popup.classList.contains("show")) {
      setTimeout(() => {
        popup.classList.remove("show");
      }, 3000); // hide after 3 sec
    }
  });
</script>
  
</head>
<body>
  <header class="navbar">
    <div class="logo">
      <img src="assets/image/logo.jpeg" alt="Logo">
      <span>SkillSwap</span>
    </div>
    <nav>
      <a href="./about.html">About</a>
      <a href="./contact.html">Contact</a>
    </nav>
  </header>

  <section class="auth-container">
    <div class="auth-card">
      <h2>Login</h2>
      <form action="${pageContext.request.contextPath}/login" method="post">
  <div class="form-group">
    <label>Email</label>
    <input type="email" name="email" placeholder="example@mail.com" required>
  </div>
  <div class="form-group">
    <label>Password</label>
    <input type="password" name="password" placeholder="Enter Password" required>
  </div>
  <button type="submit" class="btn">Login</button>
</form>

      <p class="link">Don’t have an account? <a href="register.jsp">Register</a></p>
    </div>
  </section>
  <%
    String error = request.getParameter("error");
    String success = request.getParameter("success");
%>

<div id="popup" class="popup <%= (error != null || success != null) ? "show" : "" %>">
    <p>
        <%= (error != null) ? "❌ Invalid email or password!" : "" %>
        <%= (success != null) ? "✅ Registration successful!" : "" %>
    </p>
</div> 
</body>
</html>
