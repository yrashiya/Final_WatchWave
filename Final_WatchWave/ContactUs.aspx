<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="Final_WatchWave.ContactUs" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Contact Us - Timeless Watches</title>
    <style>
        /* Modern Design System from About Us Page */
        :root {
            --primary: #0f172a;
            --primary-light: #1e293b;
            --secondary: #6366f1;
            --secondary-light: #818cf8;
            --accent: #f59e0b;
            --accent-light: #fbbf24;
            --gradient-1: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            --gradient-2: linear-gradient(135deg, #10b981 0%, #059669 100%);
            --gradient-3: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
            --gradient-red: linear-gradient(135deg, #ef4444 0%, #dc2626 100%);
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
            padding: 20px;
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
        .contact-container {
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
        }

        .contact-container::before {
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
        .contact-container::after {
            content: '';
            position: absolute;
            width: 400px;
            height: 400px;
            background: radial-gradient(circle, rgba(99, 102, 241, 0.08) 0%, transparent 70%);
            border-radius: 50%;
            top: -200px;
            right: -200px;
            pointer-events: none;
            animation: pulse 8s ease-in-out infinite;
        }

        @keyframes pulse {
            0%, 100% { transform: scale(1); opacity: 0.5; }
            50% { transform: scale(1.1); opacity: 0.8; }
        }

        /* Modern Typography */
        h2 {
            font-size: 3rem;
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

        h2::after {
            content: '';
            position: absolute;
            bottom: -15px;
            left: 50%;
            transform: translateX(-50%);
            width: 120px;
            height: 5px;
            background: var(--gradient-1);
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(99, 102, 241, 0.5);
        }

        /* Form Styling */
        label {
            display: block;
            margin-bottom: 8px;
            color: var(--dark);
            font-weight: 600;
            font-size: 1.1rem;
            transition: all 0.3s ease;
        }

        input[type="text"], input[type="email"], textarea {
            width: 100%;
            padding: 16px 20px;
            margin-bottom: 25px;
            border: 2px solid rgba(99, 102, 241, 0.1);
            border-radius: 12px;
            resize: vertical;
            font-size: 1rem;
            font-family: inherit;
            background: rgba(255, 255, 255, 0.9);
            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            box-shadow: var(--shadow-sm);
        }

        input[type="text"]:focus, input[type="email"]:focus, textarea:focus {
            outline: none;
            border-color: var(--secondary);
            background: #fff;
            transform: translateY(-2px);
            box-shadow: var(--shadow-glow);
        }

        input[type="text"]:hover, input[type="email"]:hover, textarea:hover {
            border-color: rgba(99, 102, 241, 0.3);
            transform: translateY(-1px);
        }

        textarea {
            height: 150px;
            min-height: 120px;
        }

        /* Modern Button */
        .btn-submit {
            background: var(--gradient-1);
            color: #fff;
            border: none;
            padding: 18px 40px;
            font-size: 1.1rem;
            font-weight: 600;
            border-radius: 15px;
            cursor: pointer;
            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            display: block;
            margin: 40px auto 0;
            position: relative;
            overflow: hidden;
            box-shadow: 0 6px 20px rgba(99, 102, 241, 0.3);
            min-width: 200px;
        }

        .btn-submit::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.3), transparent);
            transition: left 0.6s ease;
        }

        .btn-submit:hover::before {
            left: 100%;
        }

        .btn-submit:hover {
            transform: translateY(-5px) scale(1.05);
            box-shadow: 0 12px 30px rgba(99, 102, 241, 0.5);
        }

        /* Message Styling */
        .message {
            margin: 25px 0;
            text-align: center;
            font-weight: 600;
            font-size: 1.1rem;
            padding: 15px 20px;
            border-radius: 12px;
            background: var(--gradient-2);
            color: white;
            box-shadow: var(--shadow-md);
            animation: slideIn 0.5s ease-out;
        }

        .error {
            color: #ef4444;
            font-size: 0.9rem;
            margin-top: -20px;
            margin-bottom: 20px;
            font-weight: 500;
            padding: 8px 12px;
            background: rgba(239, 68, 68, 0.1);
            border-radius: 8px;
            border-left: 4px solid #ef4444;
            animation: shake 0.5s ease-in-out;
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

        @keyframes scaleIn {
            from {
                opacity: 0;
                transform: scale(0.8);
            }
            to {
                opacity: 1;
                transform: scale(1);
            }
        }

        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            25% { transform: translateX(-5px); }
            75% { transform: translateX(5px); }
        }

        .animate-on-scroll {
            opacity: 0;
        }

        .fade-in-up {
            animation: fadeInUp 1s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards;
        }

        .fade-in-left {
            animation: fadeInLeft 1s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards;
        }

        .fade-in-right {
            animation: fadeInRight 1s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards;
        }

        .scale-in {
            animation: scaleIn 0.8s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards;
        }

        .delay-1 { animation-delay: 0.15s; }
        .delay-2 { animation-delay: 0.3s; }
        .delay-3 { animation-delay: 0.45s; }

        /* Form Group Animations */
        .form-group {
            margin-bottom: 25px;
            animation: fadeInUp 0.8s ease-out both;
        }

        /* Contact Info Section */
        .contact-info {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 25px;
            margin-top: 40px;
            padding-top: 40px;
            border-top: 1px solid rgba(99, 102, 241, 0.2);
        }

        .contact-item {
            background: rgba(99, 102, 241, 0.05);
            padding: 25px;
            border-radius: 15px;
            text-align: center;
            transition: all 0.4s ease;
            border: 1px solid transparent;
        }

        .contact-item:hover {
            transform: translateY(-8px);
            background: rgba(99, 102, 241, 0.1);
            border-color: rgba(99, 102, 241, 0.3);
            box-shadow: var(--shadow-md);
        }

        .contact-item strong {
            display: block;
            margin-bottom: 10px;
            color: var(--primary);
            font-size: 1.1rem;
        }

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

            .contact-container {
                padding: 40px 30px;
                margin: 40px 20px;
            }

            h2 {
                font-size: 2.5rem;
            }
        }

        @media (max-width: 768px) {
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

            .contact-container {
                padding: 30px 20px;
            }

            h2 {
                font-size: 2.2rem;
            }

            .btn-submit {
                padding: 16px 30px;
                font-size: 1rem;
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

            .contact-container {
                padding: 25px 15px;
            }

            h2 {
                font-size: 2rem;
            }

            input[type="text"], input[type="email"], textarea {
                padding: 14px 16px;
            }

            .contact-info {
                grid-template-columns: 1fr;
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
                <li><a href="Review.aspx">Review</a></li>
                <li><a href="AboutUs.aspx">About Us</a></li>
                <li><a href="Map.aspx">Location</a></li>
                <li class="active"><a href="ContactUs.aspx">Contact Us</a></li>
                <li><a href="Blog.aspx">Blog</a></li>
                <li><a href="Privous_review.aspx">Previous Review</a></li>
                <li><a href="OrdersAll.aspx">Order</a></li>
            </ul>
        </div>
    </header>

    <form id="form1" runat="server">
        <div class="contact-container animate-on-scroll fade-in-up">
            <h2 class="animate-on-scroll fade-in-up">Contact Us</h2>

            <asp:Label ID="lblMessage" runat="server" CssClass="message" Visible="false"></asp:Label>

            <div class="form-group animate-on-scroll fade-in-left delay-1">
                <label for="txtName">Name:</label>
                <asp:TextBox ID="txtName" runat="server" MaxLength="100" placeholder="Enter your full name" />
                <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName"
                    ErrorMessage="Name is required." CssClass="error" Display="Dynamic" />
            </div>

            <div class="form-group animate-on-scroll fade-in-right delay-1">
                <label for="txtEmail">Email:</label>
                <asp:TextBox ID="txtEmail" runat="server" MaxLength="100" placeholder="Enter your email address" />
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail"
                    ErrorMessage="Email is required." CssClass="error" Display="Dynamic" />
                <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
                    ErrorMessage="Invalid email format." CssClass="error" Display="Dynamic"
                    ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$" />
            </div>

            <div class="form-group animate-on-scroll fade-in-left delay-2">
                <label for="txtSubject">Subject:</label>
                <asp:TextBox ID="txtSubject" runat="server" MaxLength="150" placeholder="Enter the subject of your message" />
                <asp:RequiredFieldValidator ID="rfvSubject" runat="server" ControlToValidate="txtSubject"
                    ErrorMessage="Subject is required." CssClass="error" Display="Dynamic" />
            </div>

            <div class="form-group animate-on-scroll fade-in-right delay-2">
                <label for="txtMessage">Message:</label>
                <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" MaxLength="1000" 
                    placeholder="Type your message here..." />
                <asp:RequiredFieldValidator ID="rfvMessage" runat="server" ControlToValidate="txtMessage"
                    ErrorMessage="Message is required." CssClass="error" Display="Dynamic" />
            </div>

            <asp:Button ID="btnSubmit" runat="server" Text="Send Message" CssClass="btn-submit animate-on-scroll scale-in delay-3" OnClick="btnSubmit_Click" />
               <%--<asp:Button ID="Button1" runat="server" Text="Contact Messages Crystal Report" OnClick="Button1_Click" />--%>

            <div class="contact-info">
                <div class="contact-item animate-on-scroll fade-in-left delay-1">
                    <strong>📍 Our Address</strong>
                    <p>123 Luxury Lane<br>Ahmedabad, Gujarat, India</p>
                </div>
                <div class="contact-item animate-on-scroll fade-in-up delay-2">
                    <strong>📞 Call Us</strong>
                    <p>+91 98765 43210<br>Mon-Sat: 10AM-7PM</p>
                </div>
                <div class="contact-item animate-on-scroll fade-in-right delay-3">
                    <strong>✉️ Email Us</strong>
                    <p>support@timelesswatches.com<br>24/7 Support</p>
                </div>
            </div>
        </div>
        <p>
       <%--<asp:Button ID="Button2" runat="server" Text="Contact Crystal Report" OnClick="Button2_Click" />--%>

    </p>
    <script>
        // Enhanced JavaScript for animations
        document.addEventListener('DOMContentLoaded', function () {
            // Scroll animation for elements
            const observerOptions = {
                threshold: 0.1,
                rootMargin: '0px 0px -50px 0px'
            };

            const observer = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        // Get all animation classes (fade-in-up, delay-1, etc.)
                        entry.target.classList.forEach(className => {
                            if (className.startsWith('fade-') || className.startsWith('scale-')) {
                                entry.target.style.animationPlayState = 'running';
                            }
                        });

                        // Unobserve after animation
                        setTimeout(() => {
                            observer.unobserve(entry.target);
                        }, 1000);
                    }
                });
            }, observerOptions);

            // Observe all animated elements
            document.querySelectorAll('.animate-on-scroll').forEach((element) => {
                element.style.opacity = '0';
                observer.observe(element);
            });

            // Add parallax effect to header on scroll
            let lastScroll = 0;
            const header = document.querySelector('header');

            window.addEventListener('scroll', () => {
                const currentScroll = window.pageYOffset;

                if (currentScroll > lastScroll && currentScroll > 100) {
                    header.style.transform = 'translateY(-100%)';
                } else {
                    header.style.transform = 'translateY(0)';
                }

                lastScroll = currentScroll;
            });

            // Add interactive effects for form elements
            const formInputs = document.querySelectorAll('input, textarea');
            
            formInputs.forEach(input => {
                input.addEventListener('focus', function() {
                    this.parentElement.style.transform = 'translateY(-5px)';
                });

                input.addEventListener('blur', function() {
                    this.parentElement.style.transform = 'translateY(0)';
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
        });

        // Add CSS for enhanced effects
        const style = document.createElement('style');
        style.textContent = `
            .form-group {
                transition: transform 0.3s ease;
            }
            
            .contact-item {
                transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            }
            
            input, textarea {
                transition: all 0.3s ease;
            }
        `;
        document.head.appendChild(style);
    </script>
        
    </form>

    </body>
</html>