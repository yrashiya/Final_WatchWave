<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LuxuryWatch.aspx.cs" Inherits="Final_WatchWave.LuxuryWatch" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
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

        /* Modern Typography */
        .page-title {
            font-size: 3.5rem;
            font-weight: 800;
            background: var(--gradient-1);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            text-align: center;
            margin: 60px 0 40px;
            letter-spacing: -1px;
            position: relative;
            line-height: 1.2;
        }

        .page-title::after {
            content: '';
            position: absolute;
            bottom: -20px;
            left: 50%;
            transform: translateX(-50%);
            width: 150px;
            height: 6px;
            background: var(--gradient-1);
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(99, 102, 241, 0.5);
        }

        /* Modern Watch Container */
        .watch-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
            gap: 30px;
            padding: 40px;
            max-width: 1400px;
            margin: 0 auto;
        }

        /* Modern Watch Card */
        .watch-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            border-radius: 25px;
            box-shadow: var(--shadow-lg);
            text-align: center;
            padding: 30px 25px;
            transition: all 0.5s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            position: relative;
            overflow: hidden;
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        .watch-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: var(--gradient-1);
            transform: scaleX(0);
            transition: transform 0.4s ease;
        }

        .watch-card:hover::before {
            transform: scaleX(1);
        }

        .watch-card:hover {
            transform: translateY(-15px) scale(1.02);
            box-shadow: var(--shadow-glow);
        }

        .watch-img {
            width: 100%;
            height: 280px;
            object-fit: contain;
            margin-bottom: 20px;
            border-radius: 15px;
            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            filter: drop-shadow(0 8px 20px rgba(0,0,0,0.15));
        }

        .watch-card:hover .watch-img {
            transform: scale(1.08) rotate(2deg);
            filter: drop-shadow(0 12px 30px rgba(0,0,0,0.25));
        }

        .watch-name {
            display: block;
            font-size: 1.4rem;
            font-weight: 700;
            margin: 15px 0 10px;
            color: var(--dark);
            transition: all 0.3s ease;
            position: relative;
        }

        .watch-card:hover .watch-name {
            background: var(--gradient-1);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            transform: translateY(-3px);
        }

        .watch-price {
            display: block;
            font-size: 1.3rem;
            color: #e63946;
            font-weight: 700;
            margin-bottom: 15px;
            padding: 8px 16px;
            background: rgba(230, 57, 70, 0.1);
            border-radius: 10px;
            transition: all 0.3s ease;
        }

        .watch-card:hover .watch-price {
            background: var(--gradient-red);
            color: white;
            transform: scale(1.05);
        }

        /* Add to Cart Button */
        .add-to-cart {
            background: var(--gradient-1);
            color: white;
            border: none;
            padding: 12px 25px;
            font-size: 1rem;
            font-weight: 600;
            border-radius: 12px;
            cursor: pointer;
            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            position: relative;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(99, 102, 241, 0.3);
            margin-top: 10px;
        }

        .add-to-cart::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.3), transparent);
            transition: left 0.6s ease;
        }

        .add-to-cart:hover::before {
            left: 100%;
        }

        .add-to-cart:hover {
            transform: translateY(-3px) scale(1.05);
            box-shadow: 0 8px 25px rgba(99, 102, 241, 0.5);
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

        .delay-1 { animation-delay: 0.1s; }
        .delay-2 { animation-delay: 0.2s; }
        .delay-3 { animation-delay: 0.3s; }
        .delay-4 { animation-delay: 0.4s; }

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
                grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
                gap: 25px;
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
                font-size: 2.8rem;
                margin: 40px 0 30px;
            }

            .watch-container {
                grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
                gap: 20px;
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
                font-size: 2.4rem;
                margin: 30px 0 25px;
            }

            .watch-container {
                grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
                gap: 15px;
                padding: 15px;
            }

            .watch-card {
                padding: 20px 15px;
            }

            .watch-img {
                height: 220px;
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
                font-size: 2rem;
                margin: 25px 0 20px;
            }

            .watch-container {
                grid-template-columns: 1fr;
                gap: 15px;
                padding: 10px;
            }

            .watch-img {
                height: 200px;
            }

            .watch-name {
                font-size: 1.2rem;
            }

            .watch-price {
                font-size: 1.1rem;
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
                <li class="active"><a href="LuxuryWatch.aspx">Luxury Watch</a></li>
                <li><a href="ManWatch.aspx">Man Watch</a></li>
                <li><a href="WomanWatch.aspx">Woman Watch</a></li>
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


    <form id="form1" runat="server">
        <h1 class="page-title">✨ Luxury Watches Collection</h1>

        <div class="watch-container">
            <!-- Card 1 -->
            <!-- Card 1 -->
            <div class="watch-card">
                <asp:Image ID="imgManWatch1" runat="server" CssClass="watch-img"
                    ImageUrl="~/images/L1.png" AlternateText="Rolex Daytona" />
                <asp:Label ID="lblManWatch1" runat="server" CssClass="watch-name" Text="Rolex Daytona"></asp:Label>
                <asp:Label ID="lblPrice1" runat="server" CssClass="watch-price" Text="$12000"></asp:Label>
            </div>

            <!-- Card 2 -->
            <div class="watch-card">
                <asp:Image ID="imgManWatch2" runat="server" CssClass="watch-img"
                    ImageUrl="~/images/L2.png" AlternateText="Omega Seamaster" />
                <asp:Label ID="lblManWatch2" runat="server" CssClass="watch-name" Text="Omega Seamaster"></asp:Label>
                <asp:Label ID="lblPrice2" runat="server" CssClass="watch-price" Text="$8000"></asp:Label>
            </div>

            <!-- Card 3 -->
            <div class="watch-card">
                <asp:Image ID="imgManWatch3" runat="server" CssClass="watch-img"
                    ImageUrl="~/images/L3.png" AlternateText="Tag Heuer Monaco" />
                <asp:Label ID="lblManWatch3" runat="server" CssClass="watch-name" Text="Tag Heuer Monaco"></asp:Label>
                <asp:Label ID="lblPrice3" runat="server" CssClass="watch-price" Text="$7000"></asp:Label>
            </div>

            <!-- Card 4 -->
            <div class="watch-card">
                <asp:Image ID="imgManWatch4" runat="server" CssClass="watch-img"
                    ImageUrl="~/images/L4.png" AlternateText="Breitling Superocean" />
                <asp:Label ID="lblManWatch4" runat="server" CssClass="watch-name" Text="Breitling Superocean"></asp:Label>
                <asp:Label ID="lblPrice4" runat="server" CssClass="watch-price" Text="$6500"></asp:Label>
            </div>

            <!-- Card 5 -->
            <div class="watch-card">
                <asp:Image ID="imgManWatch5" runat="server" CssClass="watch-img"
                    ImageUrl="~/images/L5.png" AlternateText="Panerai Radiomir" />
                <asp:Label ID="lblManWatch5" runat="server" CssClass="watch-name" Text="Panerai Radiomir"></asp:Label>
                <asp:Label ID="lblPrice5" runat="server" CssClass="watch-price" Text="$9000"></asp:Label>
            </div>

            <!-- Card 6 -->
            <div class="watch-card">
                <asp:Image ID="imgManWatch6" runat="server" CssClass="watch-img"
                    ImageUrl="~/images/L6.png" AlternateText="Audemars Piguet Code 11.59" />
                <asp:Label ID="lblManWatch6" runat="server" CssClass="watch-name" Text="Audemars Piguet Code 11.59"></asp:Label>
                <asp:Label ID="lblPrice6" runat="server" CssClass="watch-price" Text="$20000"></asp:Label>
            </div>

            <!-- Card 7 -->
            <div class="watch-card">
                <asp:Image ID="imgManWatch7" runat="server" CssClass="watch-img"
                    ImageUrl="~/images/L7.png" AlternateText="Hublot Classic Fusion" />
                <asp:Label ID="lblManWatch7" runat="server" CssClass="watch-name" Text="Hublot Classic Fusion"></asp:Label>
                <asp:Label ID="lblPrice7" runat="server" CssClass="watch-price" Text="$15000"></asp:Label>
            </div>

            <!-- Card 8 -->
            <div class="watch-card">
                <asp:Image ID="imgManWatch8" runat="server" CssClass="watch-img"
                    ImageUrl="~/images/L8.png" AlternateText="IWC Big Pilot" />
                <asp:Label ID="lblManWatch8" runat="server" CssClass="watch-name" Text="IWC Big Pilot"></asp:Label>
                <asp:Label ID="lblPrice8" runat="server" CssClass="watch-price" Text="$11000"></asp:Label>
            </div>

            <!-- Card 9 -->
            <div class="watch-card">
                <asp:Image ID="imgManWatch9" runat="server" CssClass="watch-img"
                    ImageUrl="~/images/L9.png" AlternateText="JLC Master Control" />
                <asp:Label ID="lblManWatch9" runat="server" CssClass="watch-name" Text="JLC Master Control"></asp:Label>
                <asp:Label ID="lblPrice9" runat="server" CssClass="watch-price" Text="$13000"></asp:Label>
            </div>

            <!-- Card 10 -->
            <div class="watch-card">
                <asp:Image ID="imgManWatch10" runat="server" CssClass="watch-img"
                    ImageUrl="~/images/L10.png" AlternateText="Vacheron Constantin Overseas" />
                <asp:Label ID="lblManWatch10" runat="server" CssClass="watch-name" Text="Vacheron Constantin Overseas"></asp:Label>
                <asp:Label ID="lblPrice10" runat="server" CssClass="watch-price" Text="$22000"></asp:Label>
            </div>

            <!-- Card 11 -->
            <div class="watch-card">
                <asp:Image ID="imgManWatch11" runat="server" CssClass="watch-img"
                    ImageUrl="~/images/L11.png" AlternateText="Breguet Marine" />
                <asp:Label ID="lblManWatch11" runat="server" CssClass="watch-name" Text="Breguet Marine"></asp:Label>
                <asp:Label ID="lblPrice11" runat="server" CssClass="watch-price" Text="$18000"></asp:Label>
            </div>

            <!-- Card 12 -->
            <div class="watch-card">
                <asp:Image ID="imgManWatch12" runat="server" CssClass="watch-img"
                    ImageUrl="~/images/L12.png" AlternateText="Chopard Mille Miglia" />
                <asp:Label ID="lblManWatch12" runat="server" CssClass="watch-name" Text="Chopard Mille Miglia"></asp:Label>
                <asp:Label ID="lblPrice12" runat="server" CssClass="watch-price" Text="$9500"></asp:Label>
            </div>

            <!-- Card 13 -->
            <div class="watch-card">
                <asp:Image ID="imgManWatch13" runat="server" CssClass="watch-img"
                    ImageUrl="~/images/L13.png" AlternateText="Girard-Perregaux Laureato" />
                <asp:Label ID="lblManWatch13" runat="server" CssClass="watch-name" Text="Girard-Perregaux Laureato"></asp:Label>
                <asp:Label ID="lblPrice13" runat="server" CssClass="watch-price" Text="$12500"></asp:Label>
            </div>

            <!-- Card 14 -->
            <div class="watch-card">
                <asp:Image ID="imgManWatch14" runat="server" CssClass="watch-img"
                    ImageUrl="~/images/L14.png" AlternateText="Blancpain Fifty Fathoms" />
                <asp:Label ID="lblManWatch14" runat="server" CssClass="watch-name" Text="Blancpain Fifty Fathoms"></asp:Label>
                <asp:Label ID="lblPrice14" runat="server" CssClass="watch-price" Text="$17500"></asp:Label>
            </div>

            <!-- Card 15 -->
            <div class="watch-card">
                <asp:Image ID="imgManWatch15" runat="server" CssClass="watch-img"
                    ImageUrl="~/images/L15.png" AlternateText="Tudor Black Bay" />
                <asp:Label ID="lblManWatch15" runat="server" CssClass="watch-name" Text="Tudor Black Bay"></asp:Label>
                <asp:Label ID="lblPrice15" runat="server" CssClass="watch-price" Text="$4500"></asp:Label>
            </div>

            <!-- Card 16 -->
            <div class="watch-card">
                <asp:Image ID="imgManWatch16" runat="server" CssClass="watch-img"
                    ImageUrl="~/images/L16.png" AlternateText="Grand Seiko Spring Drive" />
                <asp:Label ID="lblManWatch16" runat="server" CssClass="watch-name" Text="Grand Seiko Spring Drive"></asp:Label>
                <asp:Label ID="lblPrice16" runat="server" CssClass="watch-price" Text="$6800"></asp:Label>
            </div>

            <!-- Card 17 -->
            <div class="watch-card">
                <asp:Image ID="imgManWatch17" runat="server" CssClass="watch-img"
                    ImageUrl="~/images/L17.png" AlternateText="Maurice Lacroix Aikon" />
                <asp:Label ID="lblManWatch17" runat="server" CssClass="watch-name" Text="Maurice Lacroix Aikon"></asp:Label>
                <asp:Label ID="lblPrice17" runat="server" CssClass="watch-price" Text="$3500"></asp:Label>
            </div>

            <!-- Card 18 -->
            <div class="watch-card">
                <asp:Image ID="imgManWatch18" runat="server" CssClass="watch-img"
                    ImageUrl="~/images/L18.png" AlternateText="Raymond Weil Freelancer" />
                <asp:Label ID="lblManWatch18" runat="server" CssClass="watch-name" Text="Raymond Weil Freelancer"></asp:Label>
                <asp:Label ID="lblPrice18" runat="server" CssClass="watch-price" Text="$2700"></asp:Label>
            </div>

            <!-- Card 19 -->
            <div class="watch-card">
                <asp:Image ID="imgManWatch19" runat="server" CssClass="watch-img"
                    ImageUrl="~/images/L19.png" AlternateText="Hamilton Khaki Field" />
                <asp:Label ID="lblManWatch19" runat="server" CssClass="watch-name" Text="Hamilton Khaki Field"></asp:Label>
                <asp:Label ID="lblPrice19" runat="server" CssClass="watch-price" Text="$1200"></asp:Label>
            </div>

            <!-- Card 20 -->
            <div class="watch-card">
                <asp:Image ID="imgManWatch20" runat="server" CssClass="watch-img"
                    ImageUrl="~/images/L20.png" AlternateText="Oris Aquis Date" />
                <asp:Label ID="lblManWatch20" runat="server" CssClass="watch-name" Text="Oris Aquis Date"></asp:Label>
                <asp:Label ID="lblPrice20" runat="server" CssClass="watch-price" Text="$2100"></asp:Label>
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
            .watch-card {
                transition: all 0.5s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            }
            
            .watch-img {
                transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            }
            
            .add-to-cart {
                transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            }
        `;
         document.head.appendChild(style);
     </script>
</body>
</html>
