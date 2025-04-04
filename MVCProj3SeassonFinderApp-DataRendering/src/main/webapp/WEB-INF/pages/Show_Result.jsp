<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Season Explorer | ${resultMsg}</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;600;700&family=Prata&display=swap');
        
        :root {
            --spring: #A8E6CF;
            --summer: #FFCC5C;
            --autumn: #FF9A5A;
            --winter: #A8C6DF;
            --default: #4FACFE;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Montserrat', sans-serif;
        }
        
        body {
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #f8f9fa;
            background-image: url('data:image/svg+xml;utf8,<svg width="100" height="100" viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg" opacity="0.03"><path d="M20,20 L80,20 L80,80 L20,80 Z" fill="none" stroke="black" stroke-width="2"/></svg>');
            overflow: hidden;
        }
        
        /* Dynamic season theming */
        <%
        String season = (String) request.getAttribute("resultMsg");
        String seasonClass = "default";
        String seasonEmoji = "🌎";
        String seasonQuote = "Nature does not hurry, yet everything is accomplished.";
        String seasonAuthor = "Lao Tzu";
        
        if (season != null) {
            if (season.toLowerCase().contains("spring")) {
                seasonClass = "spring";
                seasonEmoji = "🌸";
                seasonQuote = "Spring is nature's way of saying, 'Let's party!'";
                seasonAuthor = "Robin Williams";
            } else if (season.toLowerCase().contains("summer")) {
                seasonClass = "summer";
                seasonEmoji = "☀️";
                seasonQuote = "Golden sunshine, endless memories";
                seasonAuthor = "Anis Shaikh";
            } else if (season.toLowerCase().contains("autumn") || season.toLowerCase().contains("fall")) {
                seasonClass = "autumn";
                seasonEmoji = "🍂";
                seasonQuote = "Autumn is a second spring when every leaf is a flower.";
                seasonAuthor = "Albert Camus";
            } else if (season.toLowerCase().contains("winter")) {
                seasonClass = "winter";
                seasonEmoji = "❄️";
                seasonQuote = "Winter is not a season, it's a celebration.";
                seasonAuthor = "Anamika Mishra";
            }
        }
        %>
        
        .season-<%= seasonClass %> {
            --primary-color: var(--<%= seasonClass %>);
        }
        
        .container {
            width: 90%;
            max-width: 800px;
            background: white;
            border-radius: 20px;
            box-shadow: 0 15px 50px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            position: relative;
            animation: fadeInUp 0.8s cubic-bezier(0.22, 1, 0.36, 1);
            transform-style: preserve-3d;
            transition: transform 0.5s ease;
        }
        
        .container:hover {
            transform: translateY(-5px) rotateX(1deg) rotateY(1deg);
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.15);
        }
        
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        .season-header {
            background: linear-gradient(135deg, var(--primary-color), #ffffff);
            padding: 3rem 2rem;
            text-align: center;
            position: relative;
            overflow: hidden;
        }
        
        .season-header::before {
            content: "";
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(255,255,255,0.2) 0%, rgba(255,255,255,0) 70%);
            transform: rotate(30deg);
        }
        
        h1 {
            font-family: 'Prata', serif;
            font-size: 3rem;
            color: #2c3e50;
            margin-bottom: 1rem;
            position: relative;
            display: inline-block;
        }
        
        h1::after {
            content: "";
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 4px;
            background: var(--primary-color);
            border-radius: 2px;
        }
        
        .season-display {
            font-size: 6rem;
            margin: 1.5rem 0;
            animation: bounce 2s infinite;
        }
        
        @keyframes bounce {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-20px); }
        }
        
        .season-content {
            padding: 2.5rem;
            position: relative;
        }
        
        .season-info {
            display: flex;
            justify-content: space-between;
            margin-bottom: 2rem;
        }
        
        .season-card {
            background: white;
            border-radius: 12px;
            padding: 1.5rem;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            flex: 1;
            margin: 0 10px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border-top: 3px solid var(--primary-color);
        }
        
        .season-card:first-child {
            margin-left: 0;
        }
        
        .season-card:last-child {
            margin-right: 0;
        }
        
        .season-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        }
        
        .season-card h3 {
            color: var(--primary-color);
            margin-bottom: 0.5rem;
            font-size: 1.1rem;
            text-transform: uppercase;
            letter-spacing: 1px;
        }
        
        .season-card p {
            color: #7f8c8d;
            font-size: 0.9rem;
        }
        
        .season-quote {
            font-style: italic;
            color: #555;
            text-align: center;
            margin: 2rem 0;
            padding: 1.5rem;
            border-left: 3px solid var(--primary-color);
            background: rgba(255, 255, 255, 0.7);
            position: relative;
        }
        
        .season-quote::before, .season-quote::after {
            content: '"';
            font-size: 3rem;
            color: var(--primary-color);
            opacity: 0.2;
            position: absolute;
        }
        
        .season-quote::before {
            top: 0;
            left: 10px;
        }
        
        .season-quote::after {
            bottom: -20px;
            right: 10px;
        }
        
        .quote-author {
            display: block;
            text-align: right;
            font-weight: 600;
            color: var(--primary-color);
            margin-top: 0.5rem;
        }
        
        .action-buttons {
            display: flex;
            justify-content: center;
            margin-top: 2rem;
        }
        
        .btn {
            padding: 0.8rem 2rem;
            border-radius: 50px;
            font-weight: 600;
            text-decoration: none;
            transition: all 0.3s ease;
            margin: 0 10px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }
        
        .btn-primary {
            background: var(--primary-color);
            color: white;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }
        
        .btn-primary:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
        }
        
        .btn-outline {
            border: 2px solid var(--primary-color);
            color: var(--primary-color);
            background: transparent;
        }
        
        .btn-outline:hover {
            background: var(--primary-color);
            color: white;
        }
        
        .season-particles {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            z-index: -1;
        }
        
        .particle {
            position: absolute;
            background-color: var(--primary-color);
            border-radius: 50%;
            opacity: 0.6;
            animation: float linear infinite;
        }
        
        @keyframes float {
            0% {
                transform: translateY(0) rotate(0deg);
            }
            100% {
                transform: translateY(-100vh) rotate(360deg);
            }
        }
        
        /* Responsive adjustments */
        @media (max-width: 768px) {
            .season-info {
                flex-direction: column;
            }
            
            .season-card {
                margin: 10px 0;
            }
            
            h1 {
                font-size: 2.2rem;
            }
            
            .season-display {
                font-size: 4rem;
            }
        }
    </style>
</head>
<body class="season-<%= seasonClass %>">
    <div class="season-particles" id="particles"></div>
    
    <div class="container">
        <div class="season-header">
            <h1>Season Explorer</h1>
            <div class="season-display"><%= seasonEmoji %></div>
            <h2>${resultMsg}</h2>
        </div>
        
        <div class="season-content">
            <div class="season-info">
                <div class="season-card">
                    <h3>Characteristics</h3>
                    <p id="seasonCharacteristics">Loading seasonal traits...</p>
                </div>
                <div class="season-card">
                    <h3>Activities</h3>
                    <p id="seasonActivities">Discover popular activities...</p>
                </div>
                <div class="season-card">
                    <h3>Duration</h3>
                    <p id="seasonDuration">Seasonal timeline...</p>
                </div>
            </div>
            
            <div class="season-quote">
                <%= seasonQuote %>
                <span class="quote-author">— <%= seasonAuthor %></span>
            </div>
            
            <div class="action-buttons">
                <a href="./" class="btn btn-primary">Back Home</a>
               
            </div>
        </div>
    </div>

    <script>
        // Dynamic season content
        const season = "${resultMsg}".toLowerCase();
        const characteristicsEl = document.getElementById('seasonCharacteristics');
        const activitiesEl = document.getElementById('seasonActivities');
        const durationEl = document.getElementById('seasonDuration');
        
        // Set dynamic content based on season
        if (season.includes("spring")) {
            characteristicsEl.textContent = "Renewal, growth, blooming flowers, mild temperatures";
            activitiesEl.textContent = "Gardening, hiking, spring cleaning, outdoor festivals";
            durationEl.textContent = "March 20 - June 20 (Northern Hemisphere)";
        } else if (season.includes("summer")) {
            characteristicsEl.textContent = "Warm weather, long days, vacations, abundance";
            activitiesEl.textContent = "Beach trips, barbecues, swimming, camping";
            durationEl.textContent = "June 21 - September 22 (Northern Hemisphere)";
        } else if (season.includes("autumn") || season.includes("fall")) {
            characteristicsEl.textContent = "Cooling temperatures, falling leaves, harvest time";
            activitiesEl.textContent = "Apple picking, leaf viewing, Thanksgiving, baking";
            durationEl.textContent = "September 23 - December 21 (Northern Hemisphere)";
        } else if (season.includes("winter")) {
            characteristicsEl.textContent = "Cold weather, snow, holidays, introspection";
            activitiesEl.textContent = "Skiing, ice skating, holiday celebrations, cozy nights";
            durationEl.textContent = "December 22 - March 19 (Northern Hemisphere)";
        } else {
            characteristicsEl.textContent = "Each season brings unique beauty and opportunities";
            activitiesEl.textContent = "Explore nature's changing patterns throughout the year";
            durationEl.textContent = "Varies by hemisphere and location";
        }
        
        // Create floating particles
        const particlesContainer = document.getElementById('particles');
        const particleCount = season.includes("winter") ? 50 : 30; // More particles for winter
        
        for (let i = 0; i < particleCount; i++) {
            const particle = document.createElement('div');
            particle.classList.add('particle');
            
            // Size varies by season
            let size;
            if (season.includes("winter")) {
                size = Math.random() * 8 + 2; // Larger for snowflakes
            } else if (season.includes("spring")) {
                size = Math.random() * 6 + 2; // Medium for petals
            } else {
                size = Math.random() * 4 + 1; // Smaller for other seasons
            }
            
            particle.style.width = `${size}px`;
            particle.style.height = `${size}px`;
            particle.style.left = `${Math.random() * 100}%`;
            particle.style.top = `${Math.random() * 100 + 100}%`;
            
            // Different shapes for winter
            if (season.includes("winter")) {
                particle.style.borderRadius = '0';
                particle.style.transform = `rotate(${Math.random() * 360}deg)`;
                particle.style.opacity = '0.8';
            }
            
            particle.style.animationDuration = `${Math.random() * 20 + 10}s`;
            particle.style.animationDelay = `${Math.random() * 5}s`;
            
            particlesContainer.appendChild(particle);
        }
        
        // Add subtle parallax effect
        document.addEventListener('mousemove', (e) => {
            const x = e.clientX / window.innerWidth;
            const y = e.clientY / window.innerHeight;
            document.querySelector('.container').style.transform = `
                rotateX(${(y - 0.5) * 2}deg) 
                rotateY(${(x - 0.5) * 2}deg)
            `;
        });
    </script>
</body>
</html>