<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Time Portal | ${msg}</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@300;400;600;700&family=Playfair+Display:wght@700&display=swap');
        
        :root {
            --morning: #FF9A8B;
            --afternoon: #FFAFBD;
            --evening: #A18CD1;
            --night: #6C63FF;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Space Grotesk', sans-serif;
        }
        
        body {
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            transition: background 1s ease;
            overflow: hidden;
        }
        
        /* Dynamic styling based on time */
        <%
        String greeting = (String) request.getAttribute("msg");
        String bgColor = "#1A1A2E";
        String primaryColor = "#6C63FF";
        String greetingImage = "night.svg";
        String greetingIcon = "🌃";
        
        if (greeting != null) {
            if (greeting.toLowerCase().contains("morning")) {
                bgColor = "#FFF5F5";
                primaryColor = "var(--morning)";
                greetingImage = "morning.svg";
                greetingIcon = "🌅";
            } else if (greeting.toLowerCase().contains("afternoon")) {
                bgColor = "#FFF9F2";
                primaryColor = "var(--afternoon)";
                greetingImage = "afternoon.svg";
                greetingIcon = "🏙️";
            } else if (greeting.toLowerCase().contains("evening")) {
                bgColor = "#1A1A2E";
                primaryColor = "var(--evening)";
                greetingImage = "evening.svg";
                greetingIcon = "🌇";
            } else if (greeting.toLowerCase().contains("night")) {
                bgColor = "#0A0A14";
                primaryColor = "var(--night)";
                greetingImage = "night.svg";
                greetingIcon = "🌃";
            }
        }
        %>
        
        body {
            background-color: <%= bgColor %>;
            background-image: url('data:image/svg+xml;utf8,<svg width="100" height="100" viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg" opacity="0.03"><circle cx="50" cy="50" r="40" fill="%236C63FF" /></svg>');
        }
        
        .greeting-card {
            width: 90%;
            max-width: 600px;
            padding: 3rem;
            text-align: center;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
            border: 1px solid rgba(255, 255, 255, 0.1);
            position: relative;
            overflow: hidden;
            z-index: 2;
            animation: cardEntrance 1s cubic-bezier(0.22, 1, 0.36, 1);
        }
        
        @keyframes cardEntrance {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        .greeting-icon {
            font-size: 5rem;
            margin-bottom: 1.5rem;
            animation: bounce 2s infinite;
        }
        
        @keyframes bounce {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-15px); }
        }
        
        h1 {
            font-family: 'Playfair Display', serif;
            font-size: 3rem;
            margin-bottom: 0.5rem;
            color: <%= primaryColor %>;
        }
        
        .time-greeting {
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 1.5rem;
            background: linear-gradient(90deg, <%= primaryColor %>, #A66CFF);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        
        .message {
            font-size: 1.1rem;
            margin-bottom: 2.5rem;
            opacity: 0.9;
            line-height: 1.6;
        }
        
        .current-time {
            font-family: 'Courier New', monospace;
            font-size: 1.8rem;
            margin-bottom: 2rem;
            color: <%= primaryColor %>;
            font-weight: 600;
        }
        
        .btn-group {
            display: flex;
            justify-content: center;
            gap: 1rem;
        }
        
        .btn {
            padding: 0.8rem 2rem;
            border-radius: 50px;
            font-weight: 600;
            text-decoration: none;
            transition: all 0.3s ease;
        }
        
        .btn-primary {
            background: linear-gradient(45deg, <%= primaryColor %>, #A66CFF);
            color: white;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        
        .btn-outline {
            border: 2px solid <%= primaryColor %>;
            color: <%= primaryColor %>;
            background: transparent;
        }
        
        .btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
        }
        
        .btn-outline:hover {
            background: <%= primaryColor %>;
            color: white;
        }
        
        .floating-elements {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            overflow: hidden;
            z-index: 1;
        }
        
        .floating-element {
            position: absolute;
            font-size: 1.5rem;
            animation: float linear infinite;
            opacity: 0.6;
        }
        
        @keyframes float {
            0% { transform: translateY(100vh) rotate(0deg); }
            100% { transform: translateY(-100px) rotate(360deg); }
        }
    </style>
</head>
<body>
    <div class="floating-elements" id="floatingElements"></div>
    
    <div class="greeting-card">
        <div class="greeting-icon"><%= greetingIcon %></div>
        <h1>Hello</h1>
        <div class="time-greeting">Good ${msg}</div>
        
        <p class="message">
            <% if (greeting != null) { 
                if (greeting.toLowerCase().contains("morning")) { %>
                    A fresh new day begins. Make the most of it!
                <% } else if (greeting.toLowerCase().contains("afternoon")) { %>
                    The day is in full swing. Keep up the momentum!
                <% } else if (greeting.toLowerCase().contains("evening")) { %>
                    As the sun sets, take time to reflect on your day.
                <% } else if (greeting.toLowerCase().contains("night")) { %>
                    The stars are out. Time to rest and recharge.
                <% } 
            } %>
        </p>
        
        <div class="current-time" id="liveClock"></div>
        
        <div class="btn-group">
            <a href="./" class="btn btn-primary">Back to Portal</a>
            <a href="greeting" class="btn btn-outline">Refresh Greeting</a>
        </div>
    </div>

    <script>
        // Create floating elements based on time of day
        const elementsContainer = document.getElementById('floatingElements');
        const greeting = "${msg}".toLowerCase();
        let floatingItems = [];
        
        if (greeting.includes("morning")) {
            floatingItems = ['🌅', '🌞', '🌻', '☕'];
        } else if (greeting.includes("afternoon")) {
            floatingItems = ['🏙️', '🕑', '📅', '💼'];
        } else if (greeting.includes("evening")) {
            floatingItems = ['🌇', '🌆', '🍷', '🌔'];
        } else if (greeting.includes("night")) {
            floatingItems = ['🌃', '🌙', '⭐', '🌠'];
        }
        
        for (let i = 0; i < 12; i++) {
            const element = document.createElement('div');
            element.className = 'floating-element';
            element.textContent = floatingItems[Math.floor(Math.random() * floatingItems.length)];
            element.style.left = `${Math.random() * 100}%`;
            element.style.top = `${Math.random() * 100 + 100}%`;
            element.style.fontSize = `${Math.random() * 2 + 1.5}rem`;
            element.style.animationDuration = `${Math.random() * 20 + 10}s`;
            element.style.animationDelay = `${Math.random() * 5}s`;
            elementsContainer.appendChild(element);
        }
        
        // Live clock functionality
        function updateClock() {
            const now = new Date();
            const timeString = now.toLocaleTimeString();
            document.getElementById('liveClock').textContent = timeString;
        }
        
        setInterval(updateClock, 1000);
        updateClock(); // Initial call
    </script>
</body>
</html>