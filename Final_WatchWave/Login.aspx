<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="user_re_lo.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login - Timeless Watches</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        /* Modern Design System */
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
            --light: #f8fafc;
            --dark: #0f172a;
            --text: #1e293b;
            --text-light: #64748b;
            --glass: rgba(255, 255, 255, 0.1);
            --shadow-sm: 0 2px 8px rgba(0,0,0,0.04);
            --shadow-md: 0 8px 30px rgba(0,0,0,0.08);
            --shadow-lg: 0 20px 60px rgba(0,0,0,0.12);
            --shadow-glow: 0 0 40px rgba(99, 102, 241, 0.3);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #0f172a 0%, #1e293b 50%, #334155 100%);
            background-attachment: fixed;
            color: var(--text);
            line-height: 1.7;
            overflow-x: hidden;
            position: relative;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        /* Animated Background Elements */
        body::before {
            content: '';
            position: fixed;
            top: -50%;
            right: -50%;
            width: 100%;
            height: 100%;
            background: radial-gradient(circle, rgba(99, 102, 241, 0.1) 0%, transparent 70%);
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
            background: radial-gradient(circle, rgba(245, 158, 11, 0.08) 0%, transparent 70%);
            animation: float 25s ease-in-out infinite reverse;
            pointer-events: none;
        }

        @keyframes float {
            0%, 100% { transform: translate(0, 0) rotate(0deg); }
            33% { transform: translate(30px, -30px) rotate(120deg); }
            66% { transform: translate(-20px, 20px) rotate(240deg); }
        }

        .split-container {
            display: flex;
            width: 90%;
            max-width: 1200px;
            min-height: 80vh;
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            border-radius: 30px;
            overflow: hidden;
            box-shadow: var(--shadow-lg);
            position: relative;
            border: 1px solid rgba(255, 255, 255, 0.2);
            animation: fadeInUp 1s ease-out;
        }

        .split-container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 6px;
            background: var(--gradient-1);
            box-shadow: 0 0 20px rgba(99, 102, 241, 0.5);
        }

        .welcome-panel {
            flex: 1;
            background: var(--gradient-1);
            color: #ffffff;
            padding: 60px 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            position: relative;
            font-size: 1.3rem;
            font-weight: 600;
            line-height: 1.5;
            overflow: hidden;
        }

        .welcome-panel::before {
            content: '';
            position: absolute;
            width: 400px;
            height: 400px;
            background: radial-gradient(circle, rgba(255,255,255,0.1) 0%, transparent 70%);
            border-radius: 50%;
            top: -200px;
            right: -200px;
            pointer-events: none;
            animation: pulse 8s ease-in-out infinite;
        }

        .welcome-content {
            position: relative;
            z-index: 1;
            animation: fadeInLeft 1s ease-out;
        }

        .welcome-content h1 {
            font-size: 3rem;
            margin-bottom: 20px;
            font-weight: 800;
            text-shadow: 0 2px 10px rgba(0,0,0,0.2);
        }

        .welcome-content p {
            font-size: 1.2rem;
            font-weight: 400;
            opacity: 0.9;
        }

        .login-panel {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #f8fafc;
            padding: 40px;
            font-size: 1.1rem;
            color: #333;
            position: relative;
            overflow: hidden;
        }

        .login-panel::before {
            content: '';
            position: absolute;
            bottom: -100px;
            left: -100px;
            width: 300px;
            height: 300px;
            background: radial-gradient(circle, rgba(99, 102, 241, 0.05) 0%, transparent 70%);
            border-radius: 50%;
            pointer-events: none;
        }

        .login-panel table {
            max-width: 420px;
            width: 100%;
            animation: fadeInRight 1s ease-out;
        }

        .login-panel table td {
            padding: 15px 10px;
            vertical-align: middle;
        }

        .login-panel input[type="text"],
        .login-panel input[type="password"],
        .login-panel input[type="submit"],
        .login-panel asp\:TextBox {
            width: 100%;
            padding: 15px 20px;
            font-size: 1.1rem;
            box-sizing: border-box;
            border: 1px solid rgba(99, 102, 241, 0.2);
            border-radius: 12px;
            font-family: 'Poppins', sans-serif;
            transition: all 0.3s ease;
            background: rgba(255, 255, 255, 0.8);
            box-shadow: var(--shadow-sm);
        }

        .login-panel input[type="text"]:focus,
        .login-panel input[type="password"]:focus,
        .login-panel asp\:TextBox:focus {
            outline: none;
            border-color: var(--secondary);
            box-shadow: 0 0 0 3px rgba(99, 102, 241, 0.2), var(--shadow-sm);
            transform: translateY(-2px);
        }

        .login-panel input[type="submit"] {
            background: var(--gradient-1);
            color: white;
            border: none;
            cursor: pointer;
            font-weight: 600;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(99, 102, 241, 0.4);
            position: relative;
            overflow: hidden;
        }

        .login-panel input[type="submit"]:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(99, 102, 241, 0.5);
        }

        .login-panel input[type="submit"]:active {
            transform: translateY(0);
        }

        .login-panel input[type="submit"]::after {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.3), transparent);
            transition: left 0.5s;
        }

        .login-panel input[type="submit"]:hover::after {
            left: 100%;
        }

        .login-panel p {
            text-align: center;
            margin-top: 20px;
            font-size: 1rem;
            color: var(--text-light);
        }

        .login-panel a {
            color: var(--secondary);
            text-decoration: none;
            font-weight: 600;
            font-size: 1rem;
            position: relative;
            transition: all 0.3s ease;
        }

        .login-panel a::after {
            content: '';
            position: absolute;
            bottom: -2px;
            left: 0;
            width: 0;
            height: 2px;
            background: var(--gradient-1);
            transition: width 0.3s ease;
        }

        .login-panel a:hover {
            color: var(--secondary-light);
        }

        .login-panel a:hover::after {
            width: 100%;
        }

        /* Enhanced Animations */
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(50px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes fadeInLeft {
            from {
                opacity: 0;
                transform: translateX(-50px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        @keyframes fadeInRight {
            from {
                opacity: 0;
                transform: translateX(50px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        @keyframes pulse {
            0%, 100% { transform: scale(1); opacity: 0.5; }
            50% { transform: scale(1.1); opacity: 0.8; }
        }

        /* Responsive Design */
        @media (max-width: 992px) {
            .split-container {
                flex-direction: column;
                width: 95%;
            }
            
            .welcome-panel {
                padding: 40px 30px;
            }
            
            .welcome-content h1 {
                font-size: 2.5rem;
            }
            
            .login-panel {
                padding: 30px;
            }
        }

        @media (max-width: 576px) {
            .split-container {
                width: 98%;
                min-height: auto;
            }
            
            .welcome-panel {
                padding: 30px 20px;
            }
            
            .welcome-content h1 {
                font-size: 2rem;
            }
            
            .login-panel {
                padding: 20px;
            }
            
            .login-panel table {
                max-width: 100%;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="split-container">
            <div class="welcome-panel">
                <div class="welcome-content">
                    <h1>Welcome Back!</h1>
                    <p>Log in to access your dashboard and continue your journey with us.</p>
                </div>
            </div>
            <div class="login-panel">
                <center>
                    <table>
                        <tr>
                            <td>Username:
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Password:
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <asp:Button ID="Button1" runat="server" Text="Login" OnClick="Button1_Click1" />
                            </td>
                        </tr>

                        <tr>
                            <td colspan="2">
                                <p>Not A Member?<a href="Register.aspx"> Register Now</a></p>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="Button2" runat="server" Text="Register Crystal Report" OnClick="Button2_Click1" />
                            </td>
                        </tr>
                    </table>
                </center>
            </div>
        </div>
    </form>
    
    <script>
        // Add interactive animations
        document.addEventListener('DOMContentLoaded', function () {
            // Add floating animation to login panel
            const loginPanel = document.querySelector('.login-panel');
            if (loginPanel) {
                loginPanel.addEventListener('mousemove', (e) => {
                    const rect = loginPanel.getBoundingClientRect();
                    const x = e.clientX - rect.left;
                    const y = e.clientY - rect.top;
                    
                    const centerX = rect.width / 2;
                    const centerY = rect.height / 2;
                    
                    const moveX = (x - centerX) / 25;
                    const moveY = (y - centerY) / 25;
                    
                    loginPanel.style.transform = `translate(${moveX}px, ${moveY}px)`;
                });
                
                loginPanel.addEventListener('mouseleave', () => {
                    loginPanel.style.transform = '';
                });
            }
            
            // Add input focus animations
            const inputs = document.querySelectorAll('input[type="text"], input[type="password"]');
            inputs.forEach(input => {
                input.addEventListener('focus', function() {
                    this.parentElement.style.transform = 'translateY(-5px)';
                });
                
                input.addEventListener('blur', function() {
                    this.parentElement.style.transform = '';
                });
            });
            
            // Add button ripple effect
            const button = document.querySelector('input[type="submit"]');
            if (button) {
                button.addEventListener('click', function(e) {
                    const ripple = document.createElement('span');
                    const rect = this.getBoundingClientRect();
                    const size = Math.max(rect.width, rect.height);
                    const x = e.clientX - rect.left - size / 2;
                    const y = e.clientY - rect.top - size / 2;
                    
                    ripple.style.width = ripple.style.height = size + 'px';
                    ripple.style.left = x + 'px';
                    ripple.style.top = y + 'px';
                    ripple.classList.add('ripple');
                    
                    this.appendChild(ripple);
                    
                    setTimeout(() => {
                        ripple.remove();
                    }, 600);
                });
            }
        });
    </script>
</body>
</html>