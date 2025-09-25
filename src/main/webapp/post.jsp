<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Create Post - SkillSwap</title>
  <link rel="stylesheet" href="assets/post.css">
</head>
<body>
  <header class="navbar">
    <div class="logo"><span>SkillSwap</span></div>
    <nav>
      <a href="dashboard.jsp">Dashboard</a>
      <a href="logout">Logout</a>
    </nav>
  </header>

  <main class="post-form">
    <h2>Create a New Post</h2>
    <form action="post" method="post">
      <div class="form-group">
        <label>Title</label>
        <input type="text" name="title" required>
      </div>
      <div class="form-group">
        <label>Content</label>
        <textarea name="content" rows="5" required></textarea>
      </div>
      <button type="submit" class="btn">Publish</button>
    </form>
  </main>
</body>
</html>
