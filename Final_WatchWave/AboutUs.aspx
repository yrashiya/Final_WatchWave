<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="Final_WatchWave.AboutUs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>About Us - Timeless Watches</title>
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
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #0f172a 0%, #1e293b 50%, #334155 100%);
            background-attachment: fixed;
            color: var(--text);
            line-height: 1.7;
            overflow-x: hidden;
            position: relative;
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

        /* Modern Header with Glassmorphism - FIXED SINGLE ROW */
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
            /* Remove flex-direction: column to keep single row */
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
            flex-wrap: nowrap; /* Prevent wrapping to new lines */
            margin: 0;
            padding: 0;
            align-items: center;
        }

        ul.menu-list > li > a {
            color: #e2e8f0;
            text-decoration: none;
            font-weight: 500;
            font-size: 0.85rem; /* Slightly smaller font */
            padding: 8px 12px; /* Reduced padding */
            border-radius: 8px;
            display: inline-block;
            transition: all 0.3s ease;
            position: relative;
            backdrop-filter: blur(10px);
            border: 1px solid transparent;
            white-space: nowrap; /* Prevent text wrapping */
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
        .container {
            max-width: 1200px;
            margin: 60px auto;
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            padding: 80px 60px;
            border-radius: 30px;
            box-shadow: var(--shadow-lg);
            position: relative;
            overflow: hidden;
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        .container::before {
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
        .container::after {
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
        h1 {
            font-size: 3.5rem;
            font-weight: 800;
            background: var(--gradient-1);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            text-align: center;
            margin-bottom: 20px;
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
            font-size: 2.2rem;
            font-weight: 700;
            color: var(--dark);
            margin: 60px 0 30px;
            padding-left: 25px;
            border-left: 5px solid transparent;
            border-image: var(--gradient-1);
            border-image-slice: 1;
            position: relative;
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

        h3 {
            font-size: 1.6rem;
            font-weight: 600;
            background: var(--gradient-1);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        p {
            font-size: 1.1rem;
            line-height: 1.9;
            margin-bottom: 25px;
            color: var(--text-light);
        }

        /* Modern Value Cards */
        .values-list {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 25px;
            margin: 40px 0;
        }

        .value-item {
            background: linear-gradient(135deg, #ffffff 0%, #f8fafc 100%);
            padding: 35px 25px;
            border-radius: 20px;
            text-align: center;
            box-shadow: var(--shadow-sm);
            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            position: relative;
            overflow: hidden;
            border: 1px solid rgba(99, 102, 241, 0.1);
        }

        .value-item::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 4px;
            background: var(--gradient-1);
            transform: scaleX(0);
            transition: transform 0.4s ease;
        }

        .value-item::after {
            content: '';
            position: absolute;
            inset: 0;
            background: var(--gradient-1);
            opacity: 0;
            transition: opacity 0.4s ease;
            border-radius: 20px;
        }

        .value-item:hover {
            transform: translateY(-15px) scale(1.02);
            box-shadow: var(--shadow-lg), var(--shadow-glow);
        }

        .value-item:hover::before {
            transform: scaleX(1);
        }

        .value-item:hover::after {
            opacity: 0.05;
        }

        .value-item h4 {
            color: var(--dark);
            margin-bottom: 15px;
            font-size: 1.4rem;
            font-weight: 700;
            position: relative;
            z-index: 1;
        }

        .value-item p {
            position: relative;
            z-index: 1;
            font-size: 1rem;
        }

        /* Modern Team Cards */
        .team-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
            gap: 35px;
            margin: 50px 0;
        }

        .team-member {
            background: #fff;
            border-radius: 25px;
            overflow: hidden;
            box-shadow: var(--shadow-md);
            transition: all 0.5s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            position: relative;
            border: 1px solid rgba(99, 102, 241, 0.1);
        }

        .team-member::before {
            content: '';
            position: absolute;
            inset: 0;
            background: var(--gradient-1);
            opacity: 0;
            transition: opacity 0.5s ease;
            z-index: 0;
        }

        .team-member:hover {
            transform: translateY(-20px) rotateY(5deg);
            box-shadow: var(--shadow-lg), 0 0 60px rgba(99, 102, 241, 0.3);
        }

        .team-member:hover::before {
            opacity: 0.08;
        }

        .team-member img {
            width: 100%;
            height: 300px;
            object-fit: cover;
            transition: all 0.5s ease;
            position: relative;
            z-index: 1;
        }

        .team-member:hover img {
            transform: scale(1.1);
            filter: brightness(1.1);
        }

        .team-member .details {
            padding: 30px;
            position: relative;
            z-index: 1;
            background: linear-gradient(180deg, rgba(255,255,255,0) 0%, rgba(255,255,255,1) 20%);
        }

        .team-member h3 {
            margin: 0 0 8px;
            font-size: 1.5rem;
        }

        .team-member .role {
            display: inline-block;
            background: var(--gradient-1);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            font-weight: 600;
            font-size: 1.05rem;
            margin-bottom: 15px;
        }

        /* Modern Testimonials */
        .testimonials-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(350px, 1fr));
            gap: 30px;
            margin: 50px 0;
        }

        .testimonial {
            background: linear-gradient(135deg, rgba(255,255,255,0.9) 0%, rgba(248,250,252,0.9) 100%);
            backdrop-filter: blur(10px);
            border-radius: 25px;
            padding: 35px;
            box-shadow: var(--shadow-sm);
            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            position: relative;
            border: 1px solid rgba(99, 102, 241, 0.15);
            overflow: hidden;
        }

        .testimonial::before {
            content: """;
            position: absolute;
            top: 15px;
            left: 20px;
            font-size: 6rem;
            font-weight: 700;
            background: var(--gradient-1);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            opacity: 0.15;
            font-family: Georgia, serif;
            line-height: 1;
            pointer-events: none;
        }

        .testimonial::after {
            content: '';
            position: absolute;
            bottom: -50px;
            right: -50px;
            width: 150px;
            height: 150px;
            background: radial-gradient(circle, rgba(99, 102, 241, 0.1) 0%, transparent 70%);
            border-radius: 50%;
            transition: all 0.4s ease;
        }

        .testimonial:hover {
            transform: translateY(-10px);
            box-shadow: var(--shadow-lg), 0 0 40px rgba(99, 102, 241, 0.2);
            border-color: rgba(99, 102, 241, 0.3);
        }

        .testimonial:hover::after {
            bottom: -30px;
            right: -30px;
        }

        .testimonial p {
            font-style: italic;
            position: relative;
            z-index: 1;
            font-size: 1.05rem;
            color: var(--text);
        }

        .testimonial .author {
            margin-top: 20px;
            font-weight: 700;
            background: var(--gradient-1);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            text-align: right;
            font-style: normal;
            font-size: 1.1rem;
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

        .delay-1 { animation-delay: 0.15s; }
        .delay-2 { animation-delay: 0.3s; }
        .delay-3 { animation-delay: 0.45s; }

        /* Smooth Scroll */
        html {
            scroll-behavior: smooth;
        }

        /* Responsive Design - Updated for single row header */
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

            .container {
                padding: 60px 40px;
                margin: 40px 20px;
            }

            h1 {
                font-size: 2.8rem;
            }

            h2 {
                font-size: 2rem;
            }
        }

        @media (max-width: 768px) {
            .team-grid,
            .testimonials-container {
                grid-template-columns: 1fr;
            }

            .values-list {
                grid-template-columns: 1fr;
            }

            h1 {
                font-size: 2.2rem;
            }

            h2 {
                font-size: 1.8rem;
            }

            .container {
                padding: 40px 25px;
            }

            /* Keep header single row even on mobile */
            .header-container {
                flex-direction: row; /* Ensure single row */
                gap: 10px;
            }

            ul.menu-list {
                overflow-x: auto; /* Horizontal scroll if needed */
                padding-bottom: 5px;
            }

            ul.menu-list > li > a {
                font-size: 0.7rem;
                padding: 4px 6px;
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
            <li class="active"><a href="AboutUs.aspx">About Us</a></li>
            <li><a href="Map.aspx">Location</a></li>
            <li><a href="ContactUs.aspx">Contact Us</a></li>
            <li><a href="Blog.aspx">Blog</a></li>
            <li><a href="Privous_review.aspx">Privous Review</a></li>
            <li><a href="OrdersAll.aspx">Order</a></li>
        </ul>
    </div>
</header>

    <form id="form1" runat="server">
        <div class="container">
            <h1 class="animate-on-scroll fade-in-up">About Timeless Watches</h1>

            <div class="animate-on-scroll fade-in-up delay-1">
                <p>
                    Founded in 1995, Timeless Watches has become a symbol of excellence and craftsmanship in the watchmaking industry. Our passion for creating sophisticated timepieces has fueled decades of innovation and dedication.
                </p>
            </div>

            <h2 class="animate-on-scroll fade-in-left">Our History</h2>
            <div class="animate-on-scroll fade-in-right">
                <p>
                    Our journey started with a small workshop where master craftsmen hand-assembled every watch with the utmost care and precision. Over the years, we've blended traditional techniques with modern technology to create watches that embody both heritage and innovation.
                </p>
            </div>

            <h2 class="animate-on-scroll fade-in-left">Our Mission</h2>
            <div class="animate-on-scroll fade-in-right">
                <p>
                    To design and deliver premium quality watches that combine style, durability, and cutting-edge technology — providing our customers with timeless elegance on their wrists.
                </p>
            </div>

            <h2 class="animate-on-scroll fade-in-left">Our Vision</h2>
            <div class="animate-on-scroll fade-in-right">
                <p>
                    To be recognized worldwide as the leader in luxury and precision watches, inspiring generations with our commitment to excellence.
                </p>
            </div>

            <h2 class="animate-on-scroll fade-in-left">Core Values</h2>
            <div class="values-list">
                <div class="value-item animate-on-scroll fade-in-up">
                    <h4>Exceptional Craftsmanship</h4>
                    <p>Every watch is meticulously crafted with precision and attention to detail.</p>
                </div>
                <div class="value-item animate-on-scroll fade-in-up delay-1">
                    <h4>Customer Satisfaction</h4>
                    <p>Our customers' happiness is our top priority in everything we do.</p>
                </div>
                <div class="value-item animate-on-scroll fade-in-up delay-2">
                    <h4>Innovation and Technology</h4>
                    <p>We continuously push boundaries with cutting-edge watchmaking technology.</p>
                </div>
                <div class="value-item animate-on-scroll fade-in-up delay-1">
                    <h4>Integrity and Transparency</h4>
                    <p>We maintain honesty and openness in all our business practices.</p>
                </div>
                <div class="value-item animate-on-scroll fade-in-up delay-2">
                    <h4>Environmental Responsibility</h4>
                    <p>We're committed to sustainable practices and reducing our environmental impact.</p>
                </div>
            </div>

            <h2 class="animate-on-scroll fade-in-left">Meet Our Team</h2>
            <div class="team-grid">
                <div class="team-member animate-on-scroll fade-in-up">
                    <asp:Image ID="imgFounder" runat="server" ImageUrl="~/images/John-Mitchell-1024x1024.png" AlternateText="Founder" />
                    <div class="details">
                        <h3>John Mitchell</h3>
                        <span class="role">Founder & CEO</span>
                        <p>John's vision and leadership have been the cornerstone of our success, guiding Timeless Watches to new heights.</p>
                    </div>
                </div>

                <div class="team-member animate-on-scroll fade-in-up delay-1">
                    <asp:Image ID="imgDesigner" runat="server" ImageUrl="~/images/download (1).jpg" AlternateText="Lead Designer" />
                    <div class="details">
                        <h3>Emily Clarke</h3>
                        <span class="role">Lead Designer</span>
                        <p>Emily combines creativity with precision to bring the art of watchmaking to life in every design.</p>
                    </div>
                </div>

                <div class="team-member animate-on-scroll fade-in-up delay-2">
                    <asp:Image ID="imgEngineer" runat="server" ImageUrl="~/images/download.jpg" AlternateText="Head Engineer" />
                    <div class="details">
                        <h3>Michael Brown</h3>
                        <span class="role">Head Engineer</span>
                        <p>Michael oversees all technical innovations, ensuring our watches maintain flawless performance.</p>
                    </div>
                </div>
            </div>

            <h2 class="animate-on-scroll fade-in-left">What Our Customers Say</h2>
            <div class="testimonials-container">
                <div class="testimonial animate-on-scroll fade-in-up">
                    <p>"Timeless Watches combines elegance and functionality like no other brand. Their attention to detail is truly unmatched!"</p>
                    <div class="author">– Sarah K.</div>
                </div>

                <div class="testimonial animate-on-scroll fade-in-up delay-1">
                    <p>"From design to delivery, every step was exceptional. I highly recommend their watches to anyone seeking quality and style."</p>
                    <div class="author">– David R.</div>
                </div>

                <div class="testimonial animate-on-scroll fade-in-up delay-2">
                    <p>"Owning a Timeless watch is owning a piece of art. The craftsmanship is second to none."</p>
                    <div class="author">– Lisa M.</div>
                </div>
            </div>
        </div>
    </form>

     <script>
         // Enhanced Intersection Observer with multiple animation types
         document.addEventListener('DOMContentLoaded', function () {
             const animatedElements = document.querySelectorAll('.animate-on-scroll');

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

             animatedElements.forEach(element => {
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

             // Add interactive cursor effect for team members and testimonials
             const interactiveCards = document.querySelectorAll('.team-member, .testimonial, .value-item');

             interactiveCards.forEach(card => {
                 card.addEventListener('mousemove', (e) => {
                     const rect = card.getBoundingClientRect();
                     const x = e.clientX - rect.left;
                     const y = e.clientY - rect.top;

                     const centerX = rect.width / 2;
                     const centerY = rect.height / 2;

                     const rotateX = (y - centerY) / 20;
                     const rotateY = (centerX - x) / 20;

                     card.style.transform = `perspective(1000px) rotateX(${rotateX}deg) rotateY(${rotateY}deg) translateY(-10px)`;
                 });

                 card.addEventListener('mouseleave', () => {
                     card.style.transform = '';
                 });
             });

             // Add smooth reveal for value items with stagger
             const valueItems = document.querySelectorAll('.value-item');
             valueItems.forEach((item, index) => {
                 item.style.animationDelay = `${index * 0.1}s`;
             });
         });

         // Add dynamic gradient movement
         function animateGradient() {
             const container = document.querySelector('.container');
             if (container) {
                 let hue = 0;
                 setInterval(() => {
                     hue = (hue + 1) % 360;
                     document.documentElement.style.setProperty('--dynamic-hue', hue);
                 }, 50);
             }
         }

         animateGradient();
     </script>
</body>
</html>