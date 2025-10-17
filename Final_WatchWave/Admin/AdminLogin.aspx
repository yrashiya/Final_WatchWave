<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="Final_WatchWave.Admin.AdminLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Login - Timeless Watches</title>
    <!-- Bootstrap (optional) -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        :root {
            --primary: #0f172a;
            --primary-light: #1e293b;
            --secondary: #6366f1;
            --secondary-light: #818cf8;
            --accent: #f59e0b;
            --accent-light: #fbbf24;
            --gradient-1: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            --gradient-2: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            --gradient-3: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
            --glass: rgba(255, 255, 255, 0.1);
            --shadow-glow: 0 0 40px rgba(99, 102, 241, 0.3);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            margin: 0;
            padding: 0;
            min-height: 100vh;
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(135deg, #0f172a 0%, #1e293b 50%, #334155 100%);
            display: flex;
            justify-content: center;
            align-items: center;
            background-repeat: no-repeat;
            background-size: cover;
            position: relative;
            overflow: hidden;
        }

        /* Animated Background Elements */
        body::before {
            content: '';
            position: fixed;
            top: -50%;
            right: -50%;
            width: 100%;
            height: 100%;
            background: radial-gradient(circle, rgba(99, 102, 241, 0.15) 0%, transparent 70%);
            animation: float 20s ease-in-out infinite;
            pointer-events: none;
        }

        body::after {
            content: '';
            position: fixed;
            bottom: -50%;
            left: -50%;
            width: 100%;
            height: 100%;
            background: radial-gradient(circle, rgba(245, 158, 11, 0.1) 0%, transparent 70%);
            animation: float 25s ease-in-out infinite reverse;
            pointer-events: none;
        }

        @keyframes float {
            0%, 100% { transform: translate(0, 0) rotate(0deg); }
            33% { transform: translate(30px, -30px) rotate(120deg); }
            66% { transform: translate(-20px, 20px) rotate(240deg); }
        }

        /* Floating Particles */
        .particles {
            position: absolute;
            width: 100%;
            height: 100%;
            pointer-events: none;
        }

        .particle {
            position: absolute;
            background: rgba(255, 255, 255, 0.6);
            border-radius: 50%;
            animation: floatParticle 15s infinite linear;
        }

        @keyframes floatParticle {
            0% { transform: translateY(100vh) rotate(0deg); opacity: 0; }
            10% { opacity: 1; }
            90% { opacity: 1; }
            100% { transform: translateY(-100px) rotate(360deg); opacity: 0; }
        }

        .glass-card {
            background: rgba(255, 255, 255, 0.08);
            backdrop-filter: blur(20px);
            -webkit-backdrop-filter: blur(20px);
            border-radius: 20px;
            padding: 50px 40px;
            box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.3), var(--shadow-glow);
            max-width: 480px;
            width: 100%;
            color: white;
            border: 1px solid rgba(255, 255, 255, 0.1);
            position: relative;
            overflow: hidden;
            animation: slideInUp 0.8s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            transition: all 0.4s ease;
        }

        .glass-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 5px;
            background: var(--gradient-1);
            box-shadow: 0 0 20px rgba(99, 102, 241, 0.6);
        }

        .glass-card::after {
            content: '';
            position: absolute;
            width: 200px;
            height: 200px;
            background: radial-gradient(circle, rgba(99, 102, 241, 0.15) 0%, transparent 70%);
            border-radius: 50%;
            bottom: -100px;
            right: -100px;
            pointer-events: none;
            animation: pulse 8s ease-in-out infinite;
        }

        @keyframes pulse {
            0%, 100% { transform: scale(1); opacity: 0.5; }
            50% { transform: scale(1.1); opacity: 0.8; }
        }

        @keyframes slideInUp {
            from {
                opacity: 0;
                transform: translateY(50px) scale(0.95);
            }
            to {
                opacity: 1;
                transform: translateY(0) scale(1);
            }
        }

        .glass-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 40px rgba(31, 38, 135, 0.4), 0 0 60px rgba(99, 102, 241, 0.4);
        }

        .glass-card h2 {
            text-align: center;
            margin-bottom: 40px;
            font-weight: 700;
            color: #ffffff;
            font-size: 2.2rem;
            position: relative;
            background: linear-gradient(135deg, #fff 0%, #c7d2fe 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            animation: fadeInUp 0.8s ease-out 0.2s both;
        }

        .glass-card h2::after {
            content: '';
            position: absolute;
            bottom: -15px;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 4px;
            background: var(--gradient-1);
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(99, 102, 241, 0.5);
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

        .login-table {
            width: 100%;
            animation: fadeInUp 0.8s ease-out 0.4s both;
        }

        .login-table td {
            padding: 15px 10px;
            vertical-align: middle;
        }

        .login-table td:first-child {
            font-weight: 600;
            color: #e2e8f0;
            width: 30%;
            text-align: right;
            padding-right: 15px;
            font-size: 1.1rem;
        }

        .input-box {
            width: 100%;
            padding: 16px 20px;
            border: 2px solid rgba(255, 255, 255, 0.1);
            border-radius: 12px;
            background: rgba(255, 255, 255, 0.08);
            color: white;
            font-size: 16px;
            transition: all 0.3s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            position: relative;
            backdrop-filter: blur(10px);
        }

        .input-box::placeholder {
            color: #cbd5e1;
        }

        .input-box:focus {
            outline: none;
            border-color: rgba(99, 102, 241, 0.6);
            background: rgba(255, 255, 255, 0.12);
            box-shadow: 0 0 0 3px rgba(99, 102, 241, 0.2), 0 8px 25px rgba(0,0,0,0.1);
            transform: translateY(-2px);
        }

        .input-box:valid {
            border-color: rgba(34, 197, 94, 0.4);
        }

        .input-container {
            position: relative;
        }

        .input-icon {
            position: absolute;
            right: 20px;
            top: 50%;
            transform: translateY(-50%);
            color: #cbd5e1;
            transition: all 0.3s ease;
        }

        .input-box:focus + .input-icon {
            color: #818cf8;
            transform: translateY(-50%) scale(1.2);
        }

        .login-button {
            background: var(--gradient-1);
            border: none;
            color: #fff;
            padding: 18px 20px;
            width: 100%;
            border-radius: 12px;
            font-size: 18px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            margin-top: 20px;
            position: relative;
            overflow: hidden;
            letter-spacing: 0.5px;
            box-shadow: 0 8px 25px rgba(99, 102, 241, 0.4);
        }

        .login-button::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.3), transparent);
            transition: left 0.6s;
        }

        .login-button:hover {
            transform: translateY(-4px) scale(1.02);
            box-shadow: 0 12px 35px rgba(99, 102, 241, 0.6);
        }

        .login-button:hover::before {
            left: 100%;
        }

        .login-button:active {
            transform: translateY(-1px) scale(1);
        }

        .admin-badge {
            position: absolute;
            top: 20px;
            right: 20px;
            background: var(--gradient-2);
            padding: 8px 16px;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 600;
            color: white;
            box-shadow: 0 4px 15px rgba(245, 158, 11, 0.4);
            animation: pulseBadge 2s ease-in-out infinite;
        }

        @keyframes pulseBadge {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.05); }
        }

        .security-notice {
            text-align: center;
            margin-top: 25px;
            font-size: 0.9rem;
            color: #94a3b8;
            animation: fadeInUp 0.8s ease-out 0.6s both;
        }

        .security-notice i {
            color: #f59e0b;
            margin-right: 8px;
        }

        /* Responsive */
        @media (max-width: 500px) {
            .glass-card {
                padding: 35px 25px;
                margin: 20px;
            }

            .glass-card h2 {
                font-size: 1.8rem;
            }

            .login-table td:first-child {
                text-align: left;
                padding-bottom: 8px;
                width: 100%;
                display: block;
            }

            .login-table td {
                display: block;
                width: 100%;
                padding: 8px 0;
            }

            .admin-badge {
                position: relative;
                top: 0;
                right: 0;
                display: inline-block;
                margin-bottom: 20px;
            }
        }

        /* Loading animation */
        .loading-dots {
            display: inline-block;
            position: relative;
            width: 80px;
            height: 80px;
            display: none;
        }

        .loading-dots div {
            position: absolute;
            top: 33px;
            width: 13px;
            height: 13px;
            border-radius: 50%;
            background: #fff;
            animation-timing-function: cubic-bezier(0, 1, 1, 0);
        }

        .loading-dots div:nth-child(1) {
            left: 8px;
            animation: loading-dots1 0.6s infinite;
        }

        .loading-dots div:nth-child(2) {
            left: 8px;
            animation: loading-dots2 0.6s infinite;
        }

        .loading-dots div:nth-child(3) {
            left: 32px;
            animation: loading-dots2 0.6s infinite;
        }

        .loading-dots div:nth-child(4) {
            left: 56px;
            animation: loading-dots3 0.6s infinite;
        }

        @keyframes loading-dots1 {
            0% { transform: scale(0); }
            100% { transform: scale(1); }
        }

        @keyframes loading-dots3 {
            0% { transform: scale(1); }
            100% { transform: scale(0); }
        }

        @keyframes loading-dots2 {
            0% { transform: translate(0, 0); }
            100% { transform: translate(24px, 0); }
        }
    </style>

</head>
<body>
    <!-- Floating Particles -->
    <div class="particles" id="particles"></div>

    <form id="form1" runat="server">
        <div class="glass-card">
            <div class="admin-badge">
                <i class="fas fa-shield-alt"></i> SECURE ACCESS
            </div>
            
            <h2>Admin Portal</h2>
            
            <table class="login-table">
                <tr>
                    <td>Username:</td>
                    <td>
                        <div class="input-container">
                            <asp:TextBox ID="txtunm" runat="server" CssClass="input-box" placeholder="Enter admin username"></asp:TextBox>
                            <i class="fas fa-user input-icon"></i>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td>
                        <div class="input-container">
                            <asp:TextBox ID="txtpass" runat="server" TextMode="Password" CssClass="input-box" placeholder="Enter admin password"></asp:TextBox>
                            <i class="fas fa-lock input-icon"></i>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="Button2" runat="server" Text="Access Dashboard" CssClass="login-button" OnClick="Button2_Click1"/>
                    </td>
                </tr>
            </table>

            <div class="security-notice">
                <i class="fas fa-exclamation-triangle"></i>
                Restricted Access - Authorized Personnel Only
            </div>
        </div>
    </form>

    <script>
        // Create floating particles
        function createParticles() {
            const particlesContainer = document.getElementById('particles');
            const particleCount = 15;
            
            for (let i = 0; i < particleCount; i++) {
                const particle = document.createElement('div');
                particle.className = 'particle';
                
                // Random properties
                const size = Math.random() * 6 + 2;
                const left = Math.random() * 100;
                const animationDuration = Math.random() * 20 + 10;
                const animationDelay = Math.random() * 5;
                
                particle.style.width = `${size}px`;
                particle.style.height = `${size}px`;
                particle.style.left = `${left}vw`;
                particle.style.animationDuration = `${animationDuration}s`;
                particle.style.animationDelay = `${animationDelay}s`;
                particle.style.opacity = Math.random() * 0.6 + 0.2;
                
                particlesContainer.appendChild(particle);
            }
        }

        // Add input focus effects
        document.addEventListener('DOMContentLoaded', function() {
            createParticles();
            
            const inputs = document.querySelectorAll('.input-box');
            inputs.forEach(input => {
                input.addEventListener('focus', function() {
                    this.parentElement.style.transform = 'translateY(-5px)';
                });
                
                input.addEventListener('blur', function() {
                    this.parentElement.style.transform = '';
                });
            });

            // Add button loading state
            const loginButton = document.querySelector('.login-button');
            if (loginButton) {
                loginButton.addEventListener('click', function() {
                    this.style.transform = 'scale(0.98)';
                    setTimeout(() => {
                        this.style.transform = '';
                    }, 200);
                });
            }

            // Add floating animation to glass card
            const glassCard = document.querySelector('.glass-card');
            if (glassCard) {
                glassCard.addEventListener('mousemove', (e) => {
                    const rect = glassCard.getBoundingClientRect();
                    const x = e.clientX - rect.left;
                    const y = e.clientY - rect.top;
                    
                    const centerX = rect.width / 2;
                    const centerY = rect.height / 2;
                    
                    const moveX = (x - centerX) / 25;
                    const moveY = (y - centerY) / 25;
                    
                    glassCard.style.transform = `translateY(-10px) translate(${moveX}px, ${moveY}px)`;
                });
                
                glassCard.addEventListener('mouseleave', () => {
                    glassCard.style.transform = 'translateY(-10px)';
                });
            }
        });
    </script>
</body>
</html>