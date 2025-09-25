<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.skillswap.model.User" %>
<%
    User user = (User) session.getAttribute("user");
    String fullName = (user != null) ? user.getFullName() : "Guest";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Welcome! Let's Get You Started</title>
    <link href="assets/login.css" rel="stylesheet"> <style>
        .onboarding-container { max-width: 600px; margin: 50px auto; padding: 30px; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.1); text-align: center; background-color: #fff; }
        textarea { width: 100%; min-height: 80px; margin-top: 10px; padding: 10px; border-radius: 4px; border: 1px solid #ccc; }
        label { margin-top: 20px; display: block; font-weight: bold; color: #333; }
        button { margin-top: 25px; width: 100%; padding: 12px; background-color: #007bff; color: white; border: none; cursor: pointer; border-radius: 4px; font-size: 16px; }
    </style>
</head>
<body>
    <div class="onboarding-container">
        <h2>Welcome, <%= fullName %>!</h2>
        <p>Let's set up your profile to find the best skill matches for you.</p>

        <form method="POST" action="<%= request.getContextPath() %>/onboarding">
            
            <label for="skillsToOffer">What skills can you offer?</label>
            <textarea id="skillsToOffer" name="skillsToOffer" placeholder="Enter skills separated by commas (e.g., Java, Guitar, Public Speaking)"></textarea>

            <label for="skillsToSeek">What skills do you want to learn?</label>
            <textarea id="skillsToSeek" name="skillsToSeek" placeholder="Enter skills separated by commas (e.g., Photoshop, Baking, Spanish)"></textarea>

            <button type="submit">Complete Profile & Get Started</button>
        </form>
    </div>
</body>
</html>