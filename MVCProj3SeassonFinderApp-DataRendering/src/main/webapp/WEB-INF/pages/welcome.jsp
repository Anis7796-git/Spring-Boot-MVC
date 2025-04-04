<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Season Finder</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;600;700&display=swap');
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Montserrat', sans-serif;
        }
        
        body {
            background-color: #f8f9fa;
            color: #333;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" viewBox="0 0 100 100" opacity="0.05"><path d="M30,50 Q50,30 70,50 T90,50" fill="none" stroke="%23000" stroke-width="1"/></svg>');
            background-size: 200px;
        }
        
        .container {
            max-width: 600px;
            padding: 3rem 2rem;
            text-align: center;
            background: white;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
            position: relative;
            overflow: hidden;
            animation: fadeIn 0.8s ease-out;
        }
        
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        .container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 8px;
            background: linear-gradient(90deg, #4facfe 0%, #00f2fe 100%);
        }
        
        h1 {
            font-size: 2.5rem;
            margin-bottom: 1.5rem;
            color: #2c3e50;
            font-weight: 600;
            position: relative;
            display: inline-block;
        }
        
        h1::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 60px;
            height: 3px;
            background: linear-gradient(90deg, #4facfe 0%, #00f2fe 100%);
            border-radius: 3px;
        }
        
        .season-icon {
            width: 120px;
            height: 120px;
            margin: 0 auto 2rem;
            background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="%234facfe"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 3v1m0 16v1m9-9h-1M4 12H3m15.364 6.364l-.707-.707M6.343 6.343l-.707-.707m12.728 0l-.707.707M6.343 17.657l-.707.707M16 12a4 4 0 11-8 0 4 4 0 018 0z"></path></svg>');
            background-size: contain;
            background-repeat: no-repeat;
            background-position: center;
            transition: transform 0.5s ease;
        }
        
        .container:hover .season-icon {
            transform: rotate(15deg);
        }
        
        a {
            display: inline-block;
            margin-top: 2rem;
            padding: 0.8rem 2.5rem;
            background: linear-gradient(90deg, #4facfe 0%, #00f2fe 100%);
            color: white;
            text-decoration: none;
            border-radius: 30px;
            font-weight: 600;
            font-size: 1rem;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(79, 172, 254, 0.3);
            position: relative;
            overflow: hidden;
            border: none;
        }
        
        a:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 20px rgba(79, 172, 254, 0.4);
        }
        
        a:active {
            transform: translateY(1px);
        }
        
        a::after {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, #00f2fe 0%, #4facfe 100%);
            opacity: 0;
            transition: opacity 0.3s ease;
            z-index: -1;
        }
        
        a:hover::after {
            opacity: 1;
        }
        
        .subtitle {
            color: #7f8c8d;
            margin-bottom: 1.5rem;
            font-weight: 300;
            font-size: 1.1rem;
        }
        
        .season-dots {
            display: flex;
            justify-content: center;
            margin-top: 2rem;
            gap: 15px;
        }
        
        .dot {
            width: 10px;
            height: 10px;
            border-radius: 50%;
            background: #ecf0f1;
            transition: all 0.3s ease;
        }
        
        .dot:nth-child(1) { background: #4facfe; }
        .dot:nth-child(2) { background: #00f2fe; }
        .dot:nth-child(3) { background: #a18cd1; }
        .dot:nth-child(4) { background: #fbc2eb; }
        
        .container:hover .dot {
            transform: translateY(-5px);
        }
        
        .container:hover .dot:nth-child(1) { animation: bounce 0.6s ease 0.1s; }
        .container:hover .dot:nth-child(2) { animation: bounce 0.6s ease 0.2s; }
        .container:hover .dot:nth-child(3) { animation: bounce 0.6s ease 0.3s; }
        .container:hover .dot:nth-child(4) { animation: bounce 0.6s ease 0.4s; }
        
        @keyframes bounce {
            0%, 100% { transform: translateY(-5px); }
            50% { transform: translateY(5px); }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="season-icon"></div>
        <h1>Welcome to Season Finder</h1>
        <p class="subtitle">Discover the current season with a single click</p>
        <a href="season">Find Current Season</a>
        <div class="season-dots">
            <div class="dot"></div>
            <div class="dot"></div>
            <div class="dot"></div>
            <div class="dot"></div>
        </div>
    </div>
</body>
</html>