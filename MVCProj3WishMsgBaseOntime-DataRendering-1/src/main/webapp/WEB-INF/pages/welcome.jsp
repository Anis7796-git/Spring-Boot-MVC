<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>World Clock | Time Zone Explorer</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&family=Orbitron:wght@500&display=swap');
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }
        
        body {
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
            color: white;
            overflow: hidden;
        }
        
        .container {
            width: 90%;
            max-width: 800px;
            text-align: center;
            padding: 3rem 2rem;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
            border: 1px solid rgba(255, 255, 255, 0.1);
            position: relative;
            overflow: hidden;
            animation: fadeIn 1s ease-out;
            z-index: 1;
        }
        
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        .container::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(255,255,255,0.1) 0%, transparent 70%);
            transform: rotate(30deg);
            z-index: -1;
        }
        
        h1 {
            font-size: 2.5rem;
            margin-bottom: 1rem;
            font-weight: 700;
            background: linear-gradient(to right, #fff, #a8edea);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        
        p.subtitle {
            font-size: 1.1rem;
            margin-bottom: 2.5rem;
            opacity: 0.8;
            max-width: 600px;
            margin-left: auto;
            margin-right: auto;
        }
        
        .time-btn {
            display: inline-block;
            padding: 1rem 2.5rem;
            background: linear-gradient(45deg, #00c6ff, #0072ff);
            color: white;
            text-decoration: none;
            border-radius: 50px;
            font-weight: 600;
            font-size: 1.1rem;
            transition: all 0.3s ease;
            box-shadow: 0 10px 20px rgba(0, 114, 255, 0.3);
            position: relative;
            overflow: hidden;
            border: none;
            cursor: pointer;
            margin-top: 1rem;
        }
        
        .time-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 15px 30px rgba(0, 114, 255, 0.4);
        }
        
        .time-btn:active {
            transform: translateY(1px);
        }
        
        .time-btn::after {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(45deg, #0072ff, #00c6ff);
            opacity: 0;
            transition: opacity 0.3s ease;
            z-index: -1;
        }
        
        .time-btn:hover::after {
            opacity: 1;
        }
        
        .globe-icon {
            font-size: 4rem;
            margin-bottom: 1.5rem;
            display: inline-block;
            animation: float 3s ease-in-out infinite;
        }
        
        @keyframes float {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-15px); }
        }
        
        .world-map {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            opacity: 0.05;
            z-index: -1;
            object-fit: cover;
        }
        
        .floating-circles {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            overflow: hidden;
            z-index: -1;
        }
        
        .circle {
            position: absolute;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.05);
            animation: float-circle linear infinite;
        }
        
        @keyframes float-circle {
            0% { transform: translateY(0) rotate(0deg); }
            100% { transform: translateY(-100vh) rotate(360deg); }
        }
        
        @media (max-width: 768px) {
            h1 { font-size: 2rem; }
            .container { padding: 2rem 1.5rem; }
        }
    </style>
</head>
<body>
    <div class="floating-circles" id="circles"></div>
    <img src="https://upload.wikimedia.org/wikipedia/commons/8/80/World_map_-_low_resolution.svg" alt="World Map" class="world-map">
    
    <div class="container">
        <div class="globe-icon">🌐</div>
        <h1>World Time Zone Explorer</h1>
        <p class="subtitle">Discover current times across the globe and explore different time zones with our interactive world clock</p>
        <a href="wish" class="time-btn">See Current Time</a>
    </div>

    <script>
        // Create floating circles
        const circlesContainer = document.getElementById('circles');
        const colors = ['rgba(0, 198, 255, 0.1)', 'rgba(0, 114, 255, 0.1)', 'rgba(168, 237, 234, 0.1)'];
        
        for (let i = 0; i < 15; i++) {
            const circle = document.createElement('div');
            circle.classList.add('circle');
            
            const size = Math.random() * 200 + 50;
            circle.style.width = `${size}px`;
            circle.style.height = `${size}px`;
            circle.style.left = `${Math.random() * 100}%`;
            circle.style.top = `${Math.random() * 100 + 100}%`;
            circle.style.background = colors[Math.floor(Math.random() * colors.length)];
            circle.style.animationDuration = `${Math.random() * 30 + 20}s`;
            circle.style.animationDelay = `${Math.random() * 5}s`;
            
            circlesContainer.appendChild(circle);
        }
    </script>
</body>
</html>