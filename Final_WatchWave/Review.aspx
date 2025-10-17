<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Review.aspx.cs" Inherits="Final_WatchWave.Review" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Review - WatchWave</title>
    <style>
        /* Modern Design System - Matching About Us Page */
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
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #0f172a 0%, #1e293b 50%, #334155 100%);
            background-attachment: fixed;
            color: var(--text);
            line-height: 1.7;
            overflow-x: hidden;
            position: relative;
            min-height: 100vh;
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

        /* Modern Header with Glassmorphism */
        header {
            width: 100%;
            background: rgba(15, 23, 42, 0.7);
            backdrop-filter: blur(20px) saturate(180%);
            box-shadow: 0 8px 32px rgba(0,0,0,0.2);
            padding: 15px 0;
            position: sticky;
            top: 0;
            z-index: 1000;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }

        .header-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            max-width: 1400px;
            margin: 0 auto;
            padding: 0 40px;
        }

        .logo-img {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            object-fit: cover;
            border: 3px solid var(--secondary);
            box-shadow: 0 0 30px rgba(99, 102, 241, 0.5);
            transition: all 0.5s cubic-bezier(0.68, -0.55, 0.265, 1.55);
            filter: brightness(1.1);
        }

        .logo-img:hover {
            transform: scale(1.15) rotate(360deg);
            box-shadow: 0 0 50px rgba(99, 102, 241, 0.8);
        }

        ul.menu-list {
            list-style: none;
            display: flex;
            gap: 4px;
            flex-wrap: nowrap;
            margin: 0;
            padding: 0;
            align-items: center;
        }

        ul.menu-list > li > a {
            color: #e2e8f0;
            text-decoration: none;
            font-weight: 500;
            font-size: 0.85rem;
            padding: 8px 12px;
            border-radius: 8px;
            display: inline-block;
            transition: all 0.3s ease;
            position: relative;
            backdrop-filter: blur(10px);
            border: 1px solid transparent;
            white-space: nowrap;
        }

        ul.menu-list > li > a::before {
            content: '';
            position: absolute;
            inset: 0;
            border-radius: 8px;
            padding: 1px;
            background: linear-gradient(135deg, transparent, rgba(99, 102, 241, 0.3), transparent);
            -webkit-mask: linear-gradient(#fff 0 0) content-box, linear-gradient(#fff 0 0);
            -webkit-mask-composite: xor;
            mask-composite: exclude;
            opacity: 0;
            transition: opacity 0.3s ease;
        }

        ul.menu-list > li > a:hover {
            background: rgba(99, 102, 241, 0.15);
            color: #fff;
            transform: translateY(-2px);
            border-color: rgba(99, 102, 241, 0.3);
        }

        ul.menu-list > li > a:hover::before {
            opacity: 1;
        }

        ul.menu-list > li.active > a {
            background: var(--gradient-1);
            color: white;
            box-shadow: 0 4px 20px rgba(99, 102, 241, 0.4);
            border-color: transparent;
        }

        /* Modern Container with Glass Effect */
        .review-container {
            max-width: 800px;
            margin: 60px auto;
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            padding: 60px 50px;
            border-radius: 30px;
            box-shadow: var(--shadow-lg);
            position: relative;
            overflow: hidden;
            border: 1px solid rgba(255, 255, 255, 0.2);
            animation: fadeInUp 1s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards;
        }

        .review-container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 6px;
            background: var(--gradient-1);
            box-shadow: 0 0 20px rgba(99, 102, 241, 0.5);
        }

        /* Floating Decorative Elements */
        .review-container::after {
            content: '';
            position: absolute;
            width: 300px;
            height: 300px;
            background: radial-gradient(circle, rgba(99, 102, 241, 0.08) 0%, transparent 70%);
            border-radius: 50%;
            top: -150px;
            right: -150px;
            pointer-events: none;
            animation: pulse 8s ease-in-out infinite;
        }

        @keyframes pulse {
            0%, 100% { transform: scale(1); opacity: 0.5; }
            50% { transform: scale(1.1); opacity: 0.8; }
        }

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

        /* Modern Typography */
        .review-container h2 {
            font-size: 2.5rem;
            font-weight: 800;
            background: var(--gradient-1);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            text-align: center;
            margin-bottom: 40px;
            letter-spacing: -1px;
            position: relative;
            line-height: 1.2;
        }

        .review-container h2::after {
            content: '';
            position: absolute;
            bottom: -15px;
            left: 50%;
            transform: translateX(-50%);
            width: 100px;
            height: 4px;
            background: var(--gradient-1);
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(99, 102, 241, 0.5);
        }

        /* Review Box Animation */
        .review-box {
            margin-bottom: 30px;
            animation: slideInRight 0.8s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards;
            animation-delay: calc(var(--review-index) * 0.15s);
            opacity: 0;
        }

        @keyframes slideInRight {
            from {
                opacity: 0;
                transform: translateX(50px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        /* Form Styles */
        label {
            font-weight: 600;
            color: var(--dark);
            margin-bottom: 12px;
            display: block;
            font-size: 1.1rem;
        }

        .textbox {
            width: 100%;
            padding: 18px 20px;
            margin-bottom: 25px;
            border: 2px solid rgba(99, 102, 241, 0.2);
            border-radius: 15px;
            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            font-size: 1rem;
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(10px);
            color: var(--text);
            position: relative;
            z-index: 1;
        }

        .textbox:focus {
            border-color: var(--secondary);
            box-shadow: 0 0 0 4px rgba(99, 102, 241, 0.1), 0 8px 30px rgba(99, 102, 241, 0.2);
            transform: translateY(-5px);
            outline: none;
            background: rgba(255, 255, 255, 1);
        }

        .textbox::placeholder {
            color: var(--text-light);
            opacity: 0.7;
        }

        .btn {
            padding: 16px 40px;
            background: var(--gradient-1);
            color: white;
            border: none;
            border-radius: 15px;
            cursor: pointer;
            font-weight: 600;
            font-size: 1.1rem;
            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            position: relative;
            overflow: hidden;
            box-shadow: 0 8px 30px rgba(99, 102, 241, 0.3);
            backdrop-filter: blur(10px);
        }

        .btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.3), transparent);
            transition: left 0.6s ease;
        }

        .btn:hover::before {
            left: 100%;
        }

        .btn:hover {
            transform: translateY(-5px) scale(1.05);
            box-shadow: 0 15px 40px rgba(99, 102, 241, 0.4), var(--shadow-glow);
        }

        /* Message Label */
        #lblMessage {
            display: block;
            text-align: center;
            font-weight: 600;
            padding: 15px;
            border-radius: 12px;
            margin-top: 20px;
            background: var(--gradient-1);
            color: white;
            box-shadow: 0 4px 20px rgba(99, 102, 241, 0.3);
            animation: fadeInMessage 0.6s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards;
            opacity: 0;
        }

        @keyframes fadeInMessage {
            from { 
                opacity: 0; 
                transform: translateY(-20px) scale(0.9); 
            }
            to { 
                opacity: 1; 
                transform: translateY(0) scale(1); 
            }
        }

        /* Floating Animation */
        @keyframes float {
            0%, 100% { transform: translateY(0px); }
            50% { transform: translateY(-15px); }
        }

        .floating {
            animation: float 4s ease-in-out infinite;
        }

        /* Enhanced Animations */
        .animate-on-scroll {
            opacity: 0;
        }

        .fade-in-up {
            animation: fadeInUp 1s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards;
        }

        .delay-1 { animation-delay: 0.15s; }
        .delay-2 { animation-delay: 0.3s; }

        /* Responsive Design */
        @media (max-width: 1200px) {
            .header-container {
                padding: 0 20px;
            }
            
            ul.menu-list > li > a {
                font-size: 0.8rem;
                padding: 6px 10px;
            }
        }

        @media (max-width: 992px) {
            .header-container {
                padding: 0 15px;
            }

            ul.menu-list {
                gap: 2px;
            }

            ul.menu-list > li > a {
                font-size: 0.75rem;
                padding: 5px 8px;
            }

            .logo-img {
                width: 50px;
                height: 50px;
            }

            .review-container {
                padding: 50px 40px;
                margin: 40px 20px;
            }

            .review-container h2 {
                font-size: 2.2rem;
            }
        }

        @media (max-width: 768px) {
            .review-container {
                padding: 40px 30px;
            }

            .review-container h2 {
                font-size: 2rem;
            }

            /* Keep header single row even on mobile */
            .header-container {
                flex-direction: row;
                gap: 10px;
            }

            ul.menu-list {
                overflow-x: auto;
                padding-bottom: 5px;
            }

            ul.menu-list > li > a {
                font-size: 0.7rem;
                padding: 4px 6px;
            }

            .textbox {
                padding: 16px;
            }

            .btn {
                padding: 14px 30px;
                width: 100%;
            }
        }

        @media (max-width: 576px) {
            .header-container {
                padding: 0 10px;
            }

            ul.menu-list > li > a {
                padding: 3px 5px;
                font-size: 0.65rem;
            }

            .logo-img {
                width: 45px;
                height: 45px;
            }

            .review-container {
                padding: 30px 20px;
            }

            .review-container h2 {
                font-size: 1.8rem;
            }
        }

        /* Scrollbar for horizontal menu on small screens */
        ul.menu-list::-webkit-scrollbar {
            height: 4px;
        }

        ul.menu-list::-webkit-scrollbar-track {
            background: rgba(255, 255, 255, 0.1);
            border-radius: 2px;
        }

        ul.menu-list::-webkit-scrollbar-thumb {
            background: var(--secondary);
            border-radius: 2px;
        }
    </style>
</head>
<body>
    <header>
        <div class="header-container">
            <a href="Main.aspx" class="logo-link">
                <asp:Image ID="imgLogo" runat="server" ImageUrl="~/images/Main_logo1.png" AlternateText="Timeless Watches Logo" CssClass="logo-img" />            
            </a>
            <ul class="menu-list">
                <li><a href="Main.aspx">Home</a></li>
                <li><a href="Shop.aspx">Shop</a></li>
                <li><a href="LuxuryWatch.aspx">Luxury Watch</a></li>
                <li><a href="ManWatch.aspx">Man Watch</a></li>
                <li><a href="WomanWatch.aspx">Woman Watch</a></li>
                <li><a href="ChildWatch.aspx">Child Watch</a></li>
                <li class="active"><a href="Review.aspx">Review</a></li>
                <li><a href="AboutUs.aspx">About Us</a></li>
                <li><a href="Map.aspx">Location</a></li>
                <li><a href="ContactUs.aspx">Contact Us</a></li>
                <li><a href="Blog.aspx">Blog</a></li>
                <li><a href="Privous_review.aspx">Privous Review</a></li>
                <li><a href="OrdersAll.aspx">Order</a></li>
            </ul>
        </div>
    </header>

    <form id="form1" runat="server">
        <div>
            <div class="review-container animate-on-scroll fade-in-up">
                <h2 class="floating">Share Your Experience</h2>
                <div class="review-box" style="--review-index: 0">
                    <asp:Label ID="lblName" runat="server" Text="Name:"></asp:Label>
                    <asp:TextBox ID="txtName" runat="server" CssClass="textbox" placeholder="Enter your name" />
                </div>

                <div class="review-box" style="--review-index: 1">
                    <asp:Label ID="lblReview" runat="server" Text="Your Review:"></asp:Label>
                    <asp:TextBox ID="txtReview" runat="server" TextMode="MultiLine" Rows="5" CssClass="textbox" placeholder="Share your thoughts about our watches..." />
                </div>

                <div class="review-box" style="--review-index: 2">
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit Review" CssClass="btn" OnClick="btnSubmit_Click" />
                    <asp:Label ID="lblMessage" runat="server" ForeColor="White" />
                <asp:Button ID="Button1" runat="server" Text="Review Crystal Report" OnClick="Button1_Click" />
                </div>
            </div>
            <p>
                &nbsp;</p>
        </div>
    </form>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            // Enhanced button hover effects
            const buttons = document.querySelectorAll('.btn');
            buttons.forEach(button => {
                button.addEventListener('mouseenter', function () {
                    this.style.transform = 'translateY(-5px) scale(1.05)';
                });
                button.addEventListener('mouseleave', function () {
                    this.style.transform = 'translateY(0) scale(1)';
                });
            });

            // Form input animations
            const textboxes = document.querySelectorAll('.textbox');
            textboxes.forEach(textbox => {
                textbox.addEventListener('focus', function () {
                    this.style.transform = 'translateY(-5px)';
                    this.style.boxShadow = '0 0 0 4px rgba(99, 102, 241, 0.1), 0 12px 40px rgba(99, 102, 241, 0.2)';
                });

                textbox.addEventListener('blur', function () {
                    this.style.transform = 'translateY(0)';
                    this.style.boxShadow = 'none';
                });
            });

            // Scroll animation for review container
            const observerOptions = {
                threshold: 0.1,
                rootMargin: '0px 0px -50px 0px'
            };

            const observer = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        entry.target.style.animationPlayState = 'running';

                        // Animate review boxes with stagger
                        const reviewBoxes = entry.target.querySelectorAll('.review-box');
                        reviewBoxes.forEach((box, index) => {
                            setTimeout(() => {
                                box.style.animationPlayState = 'running';
                            }, index * 200);
                        });
                    }
                });
            }, observerOptions);

            // Observe review container
            const reviewContainer = document.querySelector('.review-container');
            if (reviewContainer) {
                observer.observe(reviewContainer);
            }

            // Auto-hide success message after 5 seconds
            const messageLabel = document.getElementById('lblMessage');
            if (messageLabel && messageLabel.textContent.trim() !== '') {
                setTimeout(() => {
                    messageLabel.style.opacity = '0';
                    messageLabel.style.transition = 'opacity 0.5s ease';
                    setTimeout(() => {
                        messageLabel.textContent = '';
                        messageLabel.style.opacity = '1';
                    }, 500);
                }, 5000);
            }

            // Add interactive effects for form elements
            const formElements = document.querySelectorAll('.textbox, .btn');
            formElements.forEach(element => {
                element.addEventListener('mousemove', (e) => {
                    const rect = element.getBoundingClientRect();
                    const x = e.clientX - rect.left;
                    const y = e.clientY - rect.top;

                    element.style.setProperty('--mouse-x', `${x}px`);
                    element.style.setProperty('--mouse-y', `${y}px`);
                });
            });
        });

        // Add dynamic gradient movement
        function animateGradient() {
            let hue = 0;
            setInterval(() => {
                hue = (hue + 1) % 360;
                document.documentElement.style.setProperty('--dynamic-hue', hue);
            }, 50);
        }

        animateGradient();
    </script>
</body>
</html>