<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WomanWatch.aspx.cs" Inherits="Final_WatchWave.WomanWatch" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
       :root {
            --primary: #0f172a;
            --primary-light: #1e293b;
            --secondary: #ec4899;
            --secondary-light: #f472b6;
            --accent: #d946ef;
            --accent-light: #e879f9;
            --gradient-1: linear-gradient(135deg, #ec4899 0%, #d946ef 100%);
            --gradient-2: linear-gradient(135deg, #f472b6 0%, #e879f9 100%);
            --gradient-3: linear-gradient(135deg, #f9a8d4 0%, #f0abfc 100%);
            --gradient-red: linear-gradient(135deg, #fb7185 0%, #f43f5e 100%);
            --gradient-gold: linear-gradient(135deg, #f59e0b 0%, #d97706 100%);
            --gradient-pink: linear-gradient(135deg, #ec4899 0%, #f472b6 50%, #d946ef 100%);
            --light: #f8fafc;
            --dark: #0f172a;
            --text: #1e293b;
            --text-light: #64748b;
            --glass: rgba(255, 255, 255, 0.1);
            --shadow-sm: 0 2px 8px rgba(0,0,0,0.04);
            --shadow-md: 0 8px 30px rgba(0,0,0,0.08);
            --shadow-lg: 0 20px 60px rgba(0,0,0,0.12);
            --shadow-glow: 0 0 40px rgba(236, 72, 153, 0.3);
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
            background: radial-gradient(circle, rgba(236, 72, 153, 0.1) 0%, transparent 70%);
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
            background: radial-gradient(circle, rgba(217, 70, 239, 0.08) 0%, transparent 70%);
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
            box-shadow: 0 0 30px rgba(236, 72, 153, 0.5);
            transition: all 0.5s cubic-bezier(0.68, -0.55, 0.265, 1.55);
            filter: brightness(1.1);
        }

        .logo-img:hover {
            transform: scale(1.15) rotate(360deg);
            box-shadow: 0 0 50px rgba(236, 72, 153, 0.8);
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
            background: linear-gradient(135deg, transparent, rgba(236, 72, 153, 0.3), transparent);
            -webkit-mask: linear-gradient(#fff 0 0) content-box, linear-gradient(#fff 0 0);
            -webkit-mask-composite: xor;
            mask-composite: exclude;
            opacity: 0;
            transition: opacity 0.3s ease;
        }

        ul.menu-list > li > a:hover {
            background: rgba(236, 72, 153, 0.15);
            color: #fff;
            transform: translateY(-2px);
            border-color: rgba(236, 72, 153, 0.3);
        }

        ul.menu-list > li > a:hover::before {
            opacity: 1;
        }

        ul.menu-list > li.active > a {
            background: var(--gradient-1);
            color: white;
            box-shadow: 0 4px 20px rgba(236, 72, 153, 0.4);
            border-color: transparent;
        }

        /* Hero Section */
        .hero-section {
            text-align: center;
            padding: 80px 20px 40px;
            position: relative;
            overflow: hidden;
        }

        .hero-bg {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: radial-gradient(circle at center, rgba(236, 72, 153, 0.1) 0%, transparent 70%);
            animation: pulse 4s ease-in-out infinite;
        }

        /* Modern Typography */
        .page-title {
            font-size: 4rem;
            font-weight: 800;
            background: linear-gradient(135deg, #ec4899 0%, #d946ef 50%, #f472b6 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            text-align: center;
            margin: 40px 0 60px;
            letter-spacing: -1px;
            position: relative;
            line-height: 1.2;
            text-shadow: 0 0 50px rgba(236, 72, 153, 0.3);
        }

        .page-title::after {
            content: '';
            position: absolute;
            bottom: -25px;
            left: 50%;
            transform: translateX(-50%);
            width: 200px;
            height: 6px;
            background: var(--gradient-1);
            border-radius: 10px;
            box-shadow: 0 0 30px rgba(236, 72, 153, 0.5);
        }

        .page-subtitle {
            font-size: 1.3rem;
            color: var(--text-light);
            text-align: center;
            margin-bottom: 60px;
            font-weight: 500;
            max-width: 600px;
            margin-left: auto;
            margin-right: auto;
        }

        /* Modern Watch Container */
        .watch-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(380px, 1fr));
            gap: 35px;
            padding: 40px;
            max-width: 1400px;
            margin: 0 auto;
        }

        /* Premium Watch Card */
        .watch-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            border-radius: 25px;
            box-shadow: var(--shadow-lg);
            text-align: center;
            padding: 35px 30px;
            transition: all 0.6s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            position: relative;
            overflow: hidden;
            border: 1px solid rgba(255, 255, 255, 0.2);
            cursor: pointer;
        }

        .watch-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 5px;
            background: var(--gradient-1);
            transform: scaleX(0);
            transition: transform 0.5s ease;
        }

        .watch-card::after {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(135deg, transparent, rgba(236, 72, 153, 0.05), transparent);
            opacity: 0;
            transition: opacity 0.5s ease;
        }

        .watch-card:hover::before {
            transform: scaleX(1);
        }

        .watch-card:hover::after {
            opacity: 1;
        }

        .watch-card:hover {
            transform: translateY(-20px) scale(1.03);
            box-shadow: var(--shadow-glow), 0 25px 50px rgba(0,0,0,0.25);
        }

        .watch-badge {
            position: absolute;
            top: 20px;
            right: 20px;
            background: var(--gradient-pink);
            color: white;
            padding: 6px 15px;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 700;
            box-shadow: 0 4px 15px rgba(236, 72, 153, 0.4);
            z-index: 2;
        }

        .watch-img-container {
            position: relative;
            margin-bottom: 25px;
            overflow: hidden;
            border-radius: 20px;
            background: linear-gradient(135deg, #fdf2f8 0%, #fce7f3 100%);
            padding: 20px;
        }

        .watch-img {
            width: 100%;
            height: 280px;
            object-fit: contain;
            transition: all 0.6s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            filter: drop-shadow(0 10px 25px rgba(0,0,0,0.2));
        }

        .watch-card:hover .watch-img {
            transform: scale(1.15) rotate(1deg);
            filter: drop-shadow(0 15px 35px rgba(0,0,0,0.3));
        }

        .watch-name {
            display: block;
            font-size: 1.5rem;
            font-weight: 800;
            margin: 20px 0 12px;
            color: var(--dark);
            transition: all 0.3s ease;
            position: relative;
        }

        .watch-card:hover .watch-name {
            background: var(--gradient-1);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            transform: translateY(-5px);
        }

        .watch-price {
            display: block;
            font-size: 1.4rem;
            font-weight: 800;
            margin-bottom: 20px;
            padding: 12px 20px;
            background: var(--gradient-pink);
            color: white;
            border-radius: 15px;
            transition: all 0.3s ease;
            box-shadow: 0 6px 20px rgba(236, 72, 153, 0.3);
        }

        .watch-card:hover .watch-price {
            transform: scale(1.08);
            box-shadow: 0 8px 25px rgba(236, 72, 153, 0.5);
        }

        /* Action Buttons */
        .watch-actions {
            display: flex;
            gap: 12px;
            justify-content: center;
            margin-top: 20px;
        }

        .btn-primary {
            background: var(--gradient-1);
            color: white;
            border: none;
            padding: 14px 28px;
            font-size: 1rem;
            font-weight: 700;
            border-radius: 15px;
            cursor: pointer;
            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            position: relative;
            overflow: hidden;
            box-shadow: 0 6px 20px rgba(236, 72, 153, 0.3);
            flex: 1;
        }

        .btn-secondary {
            background: var(--gradient-3);
            color: white;
            border: none;
            padding: 14px 28px;
            font-size: 1rem;
            font-weight: 700;
            border-radius: 15px;
            cursor: pointer;
            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            position: relative;
            overflow: hidden;
            box-shadow: 0 6px 20px rgba(249, 168, 212, 0.3);
            flex: 1;
        }

        .btn-primary::before, .btn-secondary::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.3), transparent);
            transition: left 0.6s ease;
        }

        .btn-primary:hover::before, .btn-secondary:hover::before {
            left: 100%;
        }

        .btn-primary:hover {
            transform: translateY(-5px) scale(1.05);
            box-shadow: 0 12px 30px rgba(236, 72, 153, 0.5);
        }

        .btn-secondary:hover {
            transform: translateY(-5px) scale(1.05);
            box-shadow: 0 12px 30px rgba(249, 168, 212, 0.5);
        }

        /* Enhanced Animations */
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(60px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes fadeInLeft {
            from {
                opacity: 0;
                transform: translateX(-60px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        @keyframes fadeInRight {
            from {
                opacity: 0;
                transform: translateX(60px);
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

        @keyframes floatCard {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
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

        .float-card {
            animation: floatCard 6s ease-in-out infinite;
        }

        .delay-1 { animation-delay: 0.1s; }
        .delay-2 { animation-delay: 0.2s; }
        .delay-3 { animation-delay: 0.3s; }
        .delay-4 { animation-delay: 0.4s; }
        .delay-5 { animation-delay: 0.5s; }

        /* Responsive Design */
        @media (max-width: 1200px) {
            .header-container {
                padding: 0 20px;
            }
            
            ul.menu-list > li > a {
                font-size: 0.8rem;
                padding: 6px 10px;
            }

            .watch-container {
                grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
                gap: 30px;
                padding: 30px;
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

            .page-title {
                font-size: 3rem;
                margin: 30px 0 40px;
            }

            .watch-container {
                grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
                gap: 25px;
                padding: 20px;
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

            .page-title {
                font-size: 2.5rem;
                margin: 25px 0 30px;
            }

            .watch-container {
                grid-template-columns: 1fr;
                gap: 20px;
                padding: 15px;
            }

            .watch-card {
                padding: 25px 20px;
            }

            .watch-img {
                height: 240px;
            }

            .watch-actions {
                flex-direction: column;
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

            .page-title {
                font-size: 2.2rem;
                margin: 20px 0 25px;
            }

            .watch-container {
                padding: 10px;
            }

            .watch-img {
                height: 220px;
            }

            .watch-name {
                font-size: 1.3rem;
            }

            .watch-price {
                font-size: 1.2rem;
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
                <asp:Image ID="imgLogo" runat="server" ImageUrl="~/images/Main_logo1.png"
                    AlternateText="Timeless Watches Logo" CssClass="logo-img" />
            </a>
            <ul class="menu-list">
                <li><a href="Main.aspx">Home</a></li>
                <li><a href="Shop.aspx">Shop</a></li>
                <li><a href="LuxuryWatch.aspx">Luxury Watch</a></li>
                <li><a href="ManWatch.aspx">Man Watch</a></li>
                <li class="active"><a href="WomanWatch.aspx">Woman Watch</a></li>
                <li><a href="ChildWatch.aspx">Child Watch</a></li>
                <li><a href="Review.aspx">Review</a></li>
                <li><a href="AboutUs.aspx">About Us</a></li>
                <li><a href="Map.aspx">Location</a></li>
                <li><a href="ContactUs.aspx">Contact Us</a></li>
                <li><a href="Blog.aspx">Blog</a></li>
                <li><a href="Privous_review.aspx">Privous Review</a></li>
                <li><a href="OrdersAll.aspx">Order</a></li>
            </ul>
        </div>
    </header>

    <form id="form2" runat="server">
      <div class="hero-section">
            <div class="hero-bg"></div>
            <h1 class="page-title animate-on-scroll fade-in-up">💎 Women's Elegant Collection</h1>
            <p class="page-subtitle animate-on-scroll fade-in-up delay-1">Discover sophisticated timepieces crafted for the modern woman. Elegance, beauty, and grace in every detail.</p>
        </div>

        <div class="watch-container">
            <!-- 20 Cards -->
            <div class="watch-card">
                <asp:Image ID="imgWatch1" runat="server" CssClass="watch-img" ImageUrl="~/images/F1.png" AlternateText="Rolex Lady-Datejust" />
                <asp:Label ID="lblWatch1" runat="server" CssClass="watch-name" Text="Rolex Lady-Datejust"></asp:Label>
                <asp:Label ID="lblPrice1" runat="server" CssClass="watch-price" Text="$9500"></asp:Label>
            </div>

            <div class="watch-card">
                <asp:Image ID="imgWatch2" runat="server" CssClass="watch-img" ImageUrl="~/images/F2.png" AlternateText="Omega Constellation" />
                <asp:Label ID="lblWatch2" runat="server" CssClass="watch-name" Text="Omega Constellation"></asp:Label>
                <asp:Label ID="lblPrice2" runat="server" CssClass="watch-price" Text="$7800"></asp:Label>
            </div>

            <div class="watch-card">
                <asp:Image ID="imgWatch3" runat="server" CssClass="watch-img" ImageUrl="~/images/F3.png" AlternateText="Cartier Ballon Bleu" />
                <asp:Label ID="lblWatch3" runat="server" CssClass="watch-name" Text="Cartier Ballon Bleu"></asp:Label>
                <asp:Label ID="lblPrice3" runat="server" CssClass="watch-price" Text="$10200"></asp:Label>
            </div>

            <div class="watch-card">
                <asp:Image ID="imgWatch4" runat="server" CssClass="watch-img" ImageUrl="~/images/F4.png" AlternateText="Chanel J12" />
                <asp:Label ID="lblWatch4" runat="server" CssClass="watch-name" Text="Chanel J12"></asp:Label>
                <asp:Label ID="lblPrice4" runat="server" CssClass="watch-price" Text="$7200"></asp:Label>
            </div>

            <div class="watch-card">
                <asp:Image ID="imgWatch5" runat="server" CssClass="watch-img" ImageUrl="~/images/F5.png" AlternateText="Gucci G-Timeless" />
                <asp:Label ID="lblWatch5" runat="server" CssClass="watch-name" Text="Gucci G-Timeless"></asp:Label>
                <asp:Label ID="lblPrice5" runat="server" CssClass="watch-price" Text="$1600"></asp:Label>
            </div>

            <div class="watch-card">
                <asp:Image ID="imgWatch6" runat="server" CssClass="watch-img" ImageUrl="~/images/F6.png" AlternateText="Michael Kors Parker" />
                <asp:Label ID="lblWatch6" runat="server" CssClass="watch-name" Text="Michael Kors Parker"></asp:Label>
                <asp:Label ID="lblPrice6" runat="server" CssClass="watch-price" Text="$350"></asp:Label>
            </div>

            <div class="watch-card">
                <asp:Image ID="imgWatch7" runat="server" CssClass="watch-img" ImageUrl="~/images/F7.png" AlternateText="Longines DolceVita" />
                <asp:Label ID="lblWatch7" runat="server" CssClass="watch-name" Text="Longines DolceVita"></asp:Label>
                <asp:Label ID="lblPrice7" runat="server" CssClass="watch-price" Text="$2200"></asp:Label>
            </div>

            <div class="watch-card">
                <asp:Image ID="imgWatch8" runat="server" CssClass="watch-img" ImageUrl="~/images/F8.png" AlternateText="Hermès Nantucket" />
                <asp:Label ID="lblWatch8" runat="server" CssClass="watch-name" Text="Hermès Nantucket"></asp:Label>
                <asp:Label ID="lblPrice8" runat="server" CssClass="watch-price" Text="$3400"></asp:Label>
            </div>

            <div class="watch-card">
                <asp:Image ID="imgWatch9" runat="server" CssClass="watch-img" ImageUrl="~/images/F9.png" AlternateText="Versace Vanity" />
                <asp:Label ID="lblWatch9" runat="server" CssClass="watch-name" Text="Versace Vanity"></asp:Label>
                <asp:Label ID="lblPrice9" runat="server" CssClass="watch-price" Text="$1200"></asp:Label>
            </div>

            <div class="watch-card">
                <asp:Image ID="imgWatch10" runat="server" CssClass="watch-img" ImageUrl="~/images/F10.png" AlternateText="Movado Amorosa" />
                <asp:Label ID="lblWatch10" runat="server" CssClass="watch-name" Text="Movado Amorosa"></asp:Label>
                <asp:Label ID="lblPrice10" runat="server" CssClass="watch-price" Text="$850"></asp:Label>
            </div>

            <!-- Cards 11–20 -->
            <div class="watch-card">
                <asp:Image ID="imgWatch11" runat="server" CssClass="watch-img" ImageUrl="~/images/F11.png" AlternateText="Bvlgari Serpenti" />
                <asp:Label ID="lblWatch11" runat="server" CssClass="watch-name" Text="Bvlgari Serpenti"></asp:Label>
                <asp:Label ID="lblPrice11" runat="server" CssClass="watch-price" Text="$18000"></asp:Label>
            </div>

            <div class="watch-card">
                <asp:Image ID="imgWatch12" runat="server" CssClass="watch-img" ImageUrl="~/images/F12.png" AlternateText="Fossil Jacqueline" />
                <asp:Label ID="lblWatch12" runat="server" CssClass="watch-name" Text="Fossil Jacqueline"></asp:Label>
                <asp:Label ID="lblPrice12" runat="server" CssClass="watch-price" Text="$250"></asp:Label>
            </div>

            <div class="watch-card">
                <asp:Image ID="imgWatch13" runat="server" CssClass="watch-img" ImageUrl="~/images/F13.png" AlternateText="Tissot Lovely" />
                <asp:Label ID="lblWatch13" runat="server" CssClass="watch-name" Text="Tissot Lovely"></asp:Label>
                <asp:Label ID="lblPrice13" runat="server" CssClass="watch-price" Text="$700"></asp:Label>
            </div>

            <div class="watch-card">
                <asp:Image ID="imgWatch14" runat="server" CssClass="watch-img" ImageUrl="~/images/F14.png" AlternateText="Seiko Lukia" />
                <asp:Label ID="lblWatch14" runat="server" CssClass="watch-name" Text="Seiko Lukia"></asp:Label>
                <asp:Label ID="lblPrice14" runat="server" CssClass="watch-price" Text="$850"></asp:Label>
            </div>

            <div class="watch-card">
                <asp:Image ID="imgWatch15" runat="server" CssClass="watch-img" ImageUrl="~/images/F15.png" AlternateText="Citizen L Sunrise" />
                <asp:Label ID="lblWatch15" runat="server" CssClass="watch-name" Text="Citizen L Sunrise"></asp:Label>
                <asp:Label ID="lblPrice15" runat="server" CssClass="watch-price" Text="$400"></asp:Label>
            </div>

            <div class="watch-card">
                <asp:Image ID="imgWatch16" runat="server" CssClass="watch-img" ImageUrl="~/images/F16.png" AlternateText="Casio Sheen" />
                <asp:Label ID="lblWatch16" runat="server" CssClass="watch-name" Text="Casio Sheen"></asp:Label>
                <asp:Label ID="lblPrice16" runat="server" CssClass="watch-price" Text="$180"></asp:Label>
            </div>

            <div class="watch-card">
                <asp:Image ID="imgWatch17" runat="server" CssClass="watch-img" ImageUrl="~/images/F17.png" AlternateText="Rolex Pearlmaster" />
                <asp:Label ID="lblWatch17" runat="server" CssClass="watch-name" Text="Rolex Pearlmaster"></asp:Label>
                <asp:Label ID="lblPrice17" runat="server" CssClass="watch-price" Text="$28000"></asp:Label>
            </div>

            <div class="watch-card">
                <asp:Image ID="imgWatch18" runat="server" CssClass="watch-img" ImageUrl="~/images/F18.png" AlternateText="Omega De Ville" />
                <asp:Label ID="lblWatch18" runat="server" CssClass="watch-name" Text="Omega De Ville"></asp:Label>
                <asp:Label ID="lblPrice18" runat="server" CssClass="watch-price" Text="$7500"></asp:Label>
            </div>

            <div class="watch-card">
                <asp:Image ID="imgWatch19" runat="server" CssClass="watch-img" ImageUrl="~/images/F19.png" AlternateText="Tag Heuer Aquaracer Lady" />
                <asp:Label ID="lblWatch19" runat="server" CssClass="watch-name" Text="Tag Heuer Aquaracer Lady"></asp:Label>
                <asp:Label ID="lblPrice19" runat="server" CssClass="watch-price" Text="$3200"></asp:Label>
            </div>

            <div class="watch-card">
                <asp:Image ID="imgWatch20" runat="server" CssClass="watch-img" ImageUrl="~/images/F20.png" AlternateText="Michael Kors Darci" />
                <asp:Label ID="lblWatch20" runat="server" CssClass="watch-name" Text="Michael Kors Darci"></asp:Label>
                <asp:Label ID="lblPrice20" runat="server" CssClass="watch-price" Text="$400"></asp:Label>
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

            // Add interactive cursor effect for watch cards
            const watchCards = document.querySelectorAll('.watch-card');

            watchCards.forEach(card => {
                card.addEventListener('mousemove', (e) => {
                    const rect = card.getBoundingClientRect();
                    const x = e.clientX - rect.left;
                    const y = e.clientY - rect.top;

                    const centerX = rect.width / 2;
                    const centerY = rect.height / 2;

                    const rotateX = (y - centerY) / 25;
                    const rotateY = (centerX - x) / 25;

                    card.style.transform = `perspective(1000px) rotateX(${rotateX}deg) rotateY(${rotateY}deg) translateY(-20px) scale(1.03)`;
                });

                card.addEventListener('mouseleave', () => {
                    card.style.transform = '';
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
            .watch-card {
                transition: all 0.6s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            }
            
            .watch-img {
                transition: all 0.6s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            }
            
            .btn-primary, .btn-secondary {
                transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            }
            
            .watch-card:hover {
                z-index: 10;
            }
        `;
        document.head.appendChild(style);
     </script>
</body>
</html>
