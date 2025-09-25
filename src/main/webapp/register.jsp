<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Register - SkillSwap</title>
  <link rel="stylesheet" href="assets/register.css">
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
    <div class="logo"><span>SkillSwap</span></div>
    <nav>
      <a href="landing.html">Home</a>
      <a href="about.html">About</a>
      <a href="contact.html">Contact</a>
    </nav>
  </header>

  <section class="auth-container">
    <div class="auth-card">
      <h2>Create Account</h2>
<form action="${pageContext.request.contextPath}/register" method="post">
        <div class="form-group">
          <label>Full Name</label>
          <input type="text" placeholder="Enter your full name" name="full_name" required>
        </div>
        <div class="form-group">
          <label>Email</label>
          <input type="email" placeholder="Enter your email" name="email" required>
        </div>
        <div class="form-group">
          <label>Phone</label>
          <input type="tel" placeholder="Enter phone number"  name="phone" maxlength="10" required>
        </div>
        <div class="form-group">
          <label>Password</label>
          <input type="password" placeholder="Enter Your password" name="password" required>
        </div>
        <button type="submit" class="btn">Register</button>
      </form>
      <p class="link">Already have an account? <a href="login.jsp">Login</a></p>
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
