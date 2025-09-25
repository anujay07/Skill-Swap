<%@ page import="java.sql.*, com.skillswap.util.DBConnection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String userEmail = (String) session.getAttribute("user");
    String fullName = "Guest";

    if (userEmail != null) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DBConnection.getConnection();
            ps = conn.prepareStatement("SELECT full_name FROM users WHERE email = ?");
            ps.setString(1, userEmail);
            rs = ps.executeQuery();

            if (rs.next()) {
                fullName = rs.getString("full_name");
            }
        } catch (Exception e) {
            out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
        } finally {
            if (rs != null) try { rs.close(); } catch (Exception e) {}
            if (ps != null) try { ps.close(); } catch (Exception e) {}
            if (conn != null) try { conn.close(); } catch (Exception e) {}
        }
    }
%>

<!DOCTYPE html>

<html lang="en">
<head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>Dashboard | Skill Sharing</title>
<link href="assets/dashboard.css" rel="stylesheet"/>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" rel="stylesheet"/>
</head>
<body>
<div class="dashboard-container">
<aside class="sidebar">
<div class="sidebar-header">
<div class="logo">
  <img src="./assets/image/logo.jpeg" alt="Logo">
</div>
</div>
<nav class="sidebar-nav">
<ul>
<li class="active"><a href="#"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
<li><a href="#"><i class="fas fa-envelope"></i> Messages</a></li>
<li><a href="#"><i class="fas fa-chalkboard-teacher"></i> Skill Rooms</a></li>
<li><a href="#"><i class="fas fa-cog"></i> Settings</a></li>
<li><a href="#"><i class="fas fa-user-plus"></i> Invite and Earn</a></li>

<li>
  <a href="<%= request.getContextPath() %>/logout" style="color: red;">
    Logout <i class="fa-solid fa-arrow-right-from-bracket"></i>
  </a>
</li>


</ul>
</nav>
<div class="sidebar-footer">
<ul>

<li><a href="#"><i class="fas fa-question-circle"></i> FAQ</a></li>
</ul>
</div>
</aside>
<main class="main-content">
<header class="main-header">
<div class="welcome-message">

<h2>Welcome back, <%= fullName %>!</h2>
<p>Continue your learning journey with peer-to-peer skill sharing.</p>
</div>
<div class="user-profile">
<i class="fas fa-user-circle"></i>
</div>
</header>
<section class="stats-cards">
<div class="card">
<div class="card-icon"><i class="fas fa-lightbulb"></i></div>
<h3>3</h3>
<p>Active Skills</p>
</div>
<div class="card">
<div class="card-icon"><i class="fas fa-users"></i></div>
<h3>1,245</h3>
<p>Total Referrals</p>
</div>
<div class="card">
<div class="card-icon"><i class="fas fa-briefcase"></i></div>
<h3>23</h3>
<p>Offered Skills</p>
</div>
</section>
<section class="main-area">
<div class="left-column">
<div class="content-block skills-table">
<h2>Skill</h2>
<table>
<thead>
<tr>
<th>Skill</th>
<th>Type</th>
<th>Status</th>
</tr>
</thead>
<tbody>
<tr>
<td>Web Development</td>
<td>Offer</td>
<td><span class="status active">Active</span></td>
</tr>
<tr>
<td>Cooking Class</td>
<td>Offer</td>
<td><span class="status active">Active</span></td>
</tr>
<tr>
<td>Web Development</td>
<td>Offer</td>
<td><span class="status active">Active</span></td>
</tr>
</tbody>
</table>
</div>
<div class="content-block matches-list">
<h2>Matches</h2>
<ul>
<li>
<div class="match-info">
<div class="avatar" style="background-color: #ffb3ba;">R</div>
<div>
<strong>Relentless</strong>
<p>Interested in: graphic design and writing</p>
</div>
</div>
<button class="view-btn">View</button>
</li>
<li>
<div class="match-info">
<div class="avatar" style="background-color: #bae1ff;">S</div>
<div>
<strong>Sage</strong>
<p>Interested in: graphic design and writing</p>
</div>
</div>
<button class="view-btn">View</button>
</li>
<li>
<div class="match-info">
<div class="avatar" style="background-color: #baffc9;">M</div>
<div>
<strong>Miriam Are</strong>
<p>Interested in: graphic design and writing</p>
</div>
</div>
<button class="view-btn">View</button>
</li>
</ul>
</div>
</div>
<div class="right-column">
<div class="content-block action-card">
<i class="fas fa-gift action-icon"></i>
<h3>Offer a Skill</h3>
<p>Got a skill you can trade with others</p>
<button class="action-btn">Offer a Skill</button>
</div>
<div class="content-block action-card">
<i class="fas fa-search action-icon"></i>
<h3>Find a Match</h3>
<p>Discover users to exchange skills with</p>
<button class="action-btn">Find a Match</button>
</div>
<div class="content-block calendar">
<div class="calendar-header">
<h3>July 2025</h3>
</div>
<div class="calendar-grid">
<span>S</span><span>M</span><span>T</span><span>W</span><span>T</span><span>F</span><span>S</span>
<span class="empty"></span><span class="empty"></span><span>1</span><span>2</span><span>3</span><span>4</span><span>5</span>
<span>6</span><span>7</span><span>8</span><span>9</span><span class="today">10</span><span>11</span><span>12</span>
<span>13</span><span>14</span><span>15</span><span>16</span><span>17</span><span>18</span><span>19</span>
<span>20</span><span>21</span><span>22</span><span>23</span><span>24</span><span>25</span><span>26</span>
<span>27</span><span>28</span><span>29</span><span>30</span><span>31</span><span class="empty"></span><span class="empty"></span>
</div>
</div>
</div>
</section>
</main>
</div>
<script src="script.js"></script>
</body>
</html>