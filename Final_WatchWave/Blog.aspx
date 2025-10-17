<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Blog.aspx.cs" Inherits="Final_WatchWave.Blog" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Blog - Timeless Watches</title>
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
            0%, 100% {
                transform: translate(0, 0) rotate(0deg);
            }

            33% {
                transform: translate(30px, -30px) rotate(120deg);
            }

            66% {
                transform: translate(-20px, 20px) rotate(240deg);
            }
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
        .blog-container {
            max-width: 1000px;
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

            .blog-container::before {
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
            .blog-container::after {
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
            0%, 100% {
                transform: scale(1);
                opacity: 0.5;
            }

            50% {
                transform: scale(1.1);
                opacity: 0.8;
            }
        }

        /* Modern Typography */
        h1 {
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

            h1::after {
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

        h2 {
            font-size: 2rem;
            font-weight: 700;
            color: var(--dark);
            margin: 50px 0 25px;
            padding-left: 25px;
            border-left: 5px solid transparent;
            border-image: var(--gradient-1);
            border-image-slice: 1;
            position: relative;
            transition: all 0.4s ease;
        }

            h2:hover {
                transform: translateX(10px);
                color: var(--primary);
            }

            h2::before {
                content: '';
                position: absolute;
                left: 0;
                top: 50%;
                transform: translateY(-50%);
                width: 5px;
                height: 100%;
                background: var(--gradient-1);
                box-shadow: 0 0 15px rgba(99, 102, 241, 0.4);
            }

        p {
            font-size: 1.1rem;
            line-height: 1.8;
            margin-bottom: 25px;
            color: var(--text-light);
            transition: all 0.3s ease;
        }

            p:hover {
                color: var(--text);
                transform: translateX(5px);
            }

        /* Modern List Styling */
        ul {
            color: var(--text-light);
            margin-left: 20px;
            margin-bottom: 25px;
        }

            ul li {
                margin-bottom: 12px;
                font-size: 1.05rem;
                line-height: 1.6;
                position: relative;
                padding-left: 10px;
                transition: all 0.3s ease;
            }

                ul li:hover {
                    transform: translateX(10px);
                    color: var(--text);
                }

                ul li::before {
                    content: '';
                    position: absolute;
                    left: -15px;
                    top: 12px;
                    width: 6px;
                    height: 6px;
                    background: var(--gradient-1);
                    border-radius: 50%;
                    transition: all 0.3s ease;
                }

                ul li:hover::before {
                    transform: scale(1.5);
                    box-shadow: 0 0 10px rgba(99, 102, 241, 0.5);
                }

                ul li strong {
                    color: var(--primary);
                    font-weight: 700;
                }

        /* Footer Styling */
        .footer {
            margin-top: 50px;
            font-size: 1rem;
            color: var(--text-light);
            text-align: center;
            padding-top: 25px;
            border-top: 1px solid rgba(99, 102, 241, 0.2);
            position: relative;
        }

            .footer::before {
                content: '';
                position: absolute;
                top: -1px;
                left: 50%;
                transform: translateX(-50%);
                width: 100px;
                height: 2px;
                background: var(--gradient-1);
                border-radius: 2px;
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

        .delay-1 {
            animation-delay: 0.15s;
        }

        .delay-2 {
            animation-delay: 0.3s;
        }

        .delay-3 {
            animation-delay: 0.45s;
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

            .blog-container {
                padding: 40px 30px;
                margin: 40px 20px;
            }

            h1 {
                font-size: 2.5rem;
            }

            h2 {
                font-size: 1.8rem;
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

            .blog-container {
                padding: 30px 20px;
            }

            h1 {
                font-size: 2.2rem;
            }

            h2 {
                font-size: 1.6rem;
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

            .blog-container {
                padding: 25px 15px;
            }

            h1 {
                font-size: 2rem;
            }

            h2 {
                font-size: 1.4rem;
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
        /* Remove any unwanted dots or pseudo-elements in menu */
        ul.menu-list > li::before,
        ul.menu-list > li::after,
        ul.menu-list > li > a::after {
            content: none !important;
        }
    </style>
</head>
<body>
    <header>
        <div class="header-container">
            <a href="Main.aspx" class="logo-link">
                <asp:Image ID="imgLogo" runat="server" ImageUrl="~/images/Main_logo1.png"
                    AlternateText="Timeless Watches Logo" CssClass="logo-img" />
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
                <li><a href="ContactUs.aspx">Contact Us</a></li>
                <li class="active"><a href="Blog.aspx">Blog</a></li>
                <li><a href="Privous_review.aspx">Previous Review</a></li>
                <li><a href="OrdersAll.aspx">Order</a></li>
            </ul>
        </div>
    </header>


    <form id="form1" runat="server">
        <div class="blog-container animate-on-scroll fade-in-up">
            <h1 class="animate-on-scroll fade-in-up">Everything You Need to Know About Watches</h1>

            <p class="animate-on-scroll fade-in-up delay-1">
                Watches have been a timeless accessory for centuries. From simple timekeepers to sophisticated smartwatches, they serve both functional and stylistic purposes.
            </p>

            <h2 class="animate-on-scroll fade-in-left">History of Watches</h2>
            <p class="animate-on-scroll fade-in-right">
                The concept of measuring time began with sundials and water clocks. Mechanical watches appeared in the 16th century and have evolved significantly since then.
            </p>

            <h2 class="animate-on-scroll fade-in-left">Types of Watches</h2>
            <ul class="animate-on-scroll fade-in-right">
                <li><strong>Analog Watches:</strong> Traditional watches with hour, minute, and sometimes second hands.</li>
                <li><strong>Digital Watches:</strong> Use a digital display to show time.</li>
                <li><strong>Smartwatches:</strong> Advanced watches that connect to your smartphone for notifications, health tracking, and apps.</li>
                <li><strong>Diving Watches:</strong> Specially designed to resist water pressure and are used for underwater activities.</li>
                <li><strong>Luxury Watches:</strong> High-end watches crafted with premium materials and intricate mechanics.</li>
            </ul>

            <h2 class="animate-on-scroll fade-in-left">How to Choose the Right Watch</h2>
            <p class="animate-on-scroll fade-in-right">
                When selecting a watch, consider:
            </p>
            <ul class="animate-on-scroll fade-in-right delay-1">
                <li>Your lifestyle and daily activities</li>
                <li>The watch's features and functions</li>
                <li>Your personal style and preferences</li>
                <li>Budget and brand reputation</li>
            </ul>

            <h2 class="animate-on-scroll fade-in-left">Maintaining Your Watch</h2>
            <p class="animate-on-scroll fade-in-right">
                To keep your watch in good condition:
            </p>
            <ul class="animate-on-scroll fade-in-right delay-1">
                <li>Regularly clean it with a soft cloth</li>
                <li>Service mechanical watches every 3-5 years</li>
                <li>Keep water-resistant watches away from extreme temperatures</li>
                <li>Store your watch properly when not in use</li>
            </ul>

            <h2 class="animate-on-scroll fade-in-left">Conclusion</h2>
            <p class="animate-on-scroll fade-in-right">
                Watches are more than just timekeepers — they are a reflection of personal style and technological innovation. Whether you prefer classic or modern designs, there's a watch out there for everyone.
            </p>

            <div class="footer animate-on-scroll fade-in-up delay-2">
                Posted by Watch Enthusiast | September 20, 2025
            </div>
        </div>
    </form>

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
            .blog-container h2 {
                transition: all 0.4s ease;
            }
            
            .blog-container p {
                transition: all 0.3s ease;
            }
            
            .blog-container ul li {
                transition: all 0.3s ease;
            }
        `;
        document.head.appendChild(style);
    </script>
</body>
</html>
