<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Shop.aspx.cs" Inherits="add_product.Shop" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>🛍️ Watch Shop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
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
        .container {
            max-width: 1200px;
            margin: 60px auto;
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            padding: 60px 40px;
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

        /* Search Bar Styling */
        .search-bar {
            width: 60%;
            margin: 30px auto;
            animation: slideInDown 0.8s ease-out 0.3s both;
        }

        @keyframes slideInDown {
            from { 
                opacity: 0; 
                transform: translateY(-30px); 
            }
            to { 
                opacity: 1; 
                transform: translateY(0); 
            }
        }

        .form-control {
            transition: all 0.4s ease;
            border: 2px solid rgba(99, 102, 241, 0.2);
            border-radius: 12px;
            padding: 12px 20px;
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(10px);
        }

        .form-control:focus {
            border-color: var(--secondary);
            box-shadow: 0 0 0 0.3rem rgba(99, 102, 241, 0.15);
            transform: scale(1.02);
            background: rgba(255, 255, 255, 1);
        }

        /* Product Grid */
        #dlProducts {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 25px;
            animation: fadeInUp 1s ease-out 0.5s both;
        }

        @keyframes fadeInUp {
            from { 
                opacity: 0; 
                transform: translateY(40px); 
            }
            to { 
                opacity: 1; 
                transform: translateY(0); 
            }
        }

        /* Enhanced product card styling with modern design */
        .product-card {
            border: 1px solid rgba(99, 102, 241, 0.1);
            border-radius: 20px;
            padding: 25px 20px;
            text-align: center;
            background: linear-gradient(135deg, #ffffff 0%, #f8fafc 100%);
            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            height: 100%;
            width: 250px;
            box-shadow: var(--shadow-sm);
            position: relative;
            overflow: hidden;
            animation: cardEntrance 0.6s ease-out both;
            animation-delay: calc(var(--card-index) * 0.1s);
        }

        @keyframes cardEntrance {
            0% {
                opacity: 0;
                transform: scale(0.8) rotateY(20deg);
            }
            100% {
                opacity: 1;
                transform: scale(1) rotateY(0);
            }
        }

        .product-card::before {
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

        .product-card::after {
            content: '';
            position: absolute;
            inset: 0;
            background: var(--gradient-1);
            opacity: 0;
            transition: opacity 0.4s ease;
            border-radius: 20px;
        }

        .product-card:hover {
            transform: translateY(-15px) scale(1.02);
            box-shadow: var(--shadow-lg), var(--shadow-glow);
        }

        .product-card:hover::before {
            transform: scaleX(1);
        }

        .product-card:hover::after {
            opacity: 0.05;
        }

        .product-img {
            height: 160px;
            object-fit: contain;
            margin-bottom: 20px;
            transition: all 0.5s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            position: relative;
            z-index: 1;
            filter: drop-shadow(0 4px 8px rgba(0,0,0,0.1));
        }

        .product-card:hover .product-img {
            transform: scale(1.15) rotate(2deg);
            filter: drop-shadow(0 8px 16px rgba(0,0,0,0.15));
        }

        .product-card h5 {
            color: var(--primary);
            font-weight: 700;
            margin-bottom: 12px;
            position: relative;
            z-index: 1;
            transition: transform 0.3s ease;
        }

        .product-card:hover h5 {
            transform: translateY(-3px);
        }

        .product-card h6 {
            color: var(--secondary);
            font-weight: 800;
            font-size: 1.2rem;
            margin: 15px 0;
            position: relative;
            z-index: 1;
            text-shadow: 0 2px 4px rgba(99, 102, 241, 0.2);
        }

        /* Enhanced button styling with modern gradients */
        .btn-primary {
            background: var(--gradient-1);
            border: none;
            font-weight: 600;
            transition: all 0.4s ease;
            position: relative;
            overflow: hidden;
            z-index: 1;
            box-shadow: 0 4px 15px rgba(99, 102, 241, 0.3);
            border-radius: 10px;
            padding: 10px 20px;
        }

        .btn-primary::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.3), transparent);
            transition: left 0.6s ease;
            z-index: -1;
        }

        .btn-primary:hover::before {
            left: 100%;
        }

        .btn-primary:hover {
            transform: translateY(-3px) scale(1.05);
            box-shadow: 0 8px 25px rgba(99, 102, 241, 0.4);
        }

        .btn-secondary {
            background: var(--gradient-2);
            border: none;
            font-weight: 600;
            transition: all 0.4s ease;
            position: relative;
            overflow: hidden;
            z-index: 1;
            box-shadow: 0 4px 15px rgba(245, 87, 108, 0.3);
            border-radius: 10px;
            padding: 10px 20px;
        }

        .btn-secondary::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent);
            transition: left 0.6s ease;
            z-index: -1;
        }

        .btn-secondary:hover::before {
            left: 100%;
        }

        .btn-secondary:hover {
            transform: translateY(-3px) scale(1.05);
            box-shadow: 0 8px 25px rgba(245, 87, 108, 0.4);
        }

        /* Search button styling */
        .btn-secondary {
    background: var(--gradient-3);
    border: none;
    font-weight: 600;
    transition: all 0.4s ease;
    position: relative;
    overflow: hidden;
    z-index: 1;
    box-shadow: 0 4px 15px rgba(79, 172, 254, 0.3);
    border-radius: 10px;
    padding: 10px 20px;
}

.btn-secondary::before {
    content: '';
    position: absolute;
    top: 0;
    left: -100%;
    width: 100%;
    height: 100%;
    background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent);
    transition: left 0.6s ease;
    z-index: -1;
}

.btn-secondary:hover::before {
    left: 100%;
}

.btn-secondary:hover {
    transform: translateY(-3px) scale(1.05);
    box-shadow: 0 8px 25px rgba(79, 172, 254, 0.4);
}

        /* Enhanced Animations from About Us Page */
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

            .container {
                padding: 40px 30px;
                margin: 40px 20px;
            }

            .search-bar {
                width: 80%;
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

            .search-bar {
                width: 90%;
            }
            
            .product-card {
                width: 100%;
                max-width: 300px;
            }

            @keyframes cardEntrance {
                0% {
                    opacity: 0;
                    transform: scale(0.9) translateX(-20px);
                }
                100% {
                    opacity: 1;
                    transform: scale(1) translateX(0);
                }
            }

            .product-card .btn {
                min-width: 80px;
                font-size: 0.8rem;
                padding: 6px 10px;
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

            .product-card {
                padding: 20px 15px;
            }

            .product-card .btn {
                display: block;
                width: 100%;
                margin: 5px 0;
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
    <form id="form1" runat="server">
        <header>
            <div class="header-container">
                <a href="Main.aspx" class="logo-link">
                    <asp:Image ID="imgLogo" runat="server" ImageUrl="~/images/Main_logo1.png" AlternateText="Timeless Watches Logo" CssClass="logo-img" />
                </a>
                <ul class="menu-list">
                    <li><a href="Main.aspx">Home</a></li>
                    <li class="active"><a href="Shop.aspx">Shop</a></li>
                    <li><a href="LuxuryWatch.aspx">Luxury Watch</a></li>
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

        <div class="container animate-on-scroll fade-in-up">

            <!-- 🔍 Search -->
            <div class="search-bar input-group animate-on-scroll fade-in-up delay-1">
                <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Search Watch"></asp:TextBox>
                <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-dark" Text="Search" OnClick="btnSearch_Click" />
            </div>
            <p>
                <asp:Button ID="Button1" runat="server" Text="Crystal Report of Watches" OnClick="Button1_Click" /></p>
            <!-- 🛍️ Product Grid -->
            <asp:DataList ID="dlProducts" runat="server" RepeatColumns="4" RepeatDirection="Horizontal"
                CellPadding="10" CellSpacing="10" OnItemCommand="dlProducts_ItemCommand" OnSelectedIndexChanged="dlProducts_SelectedIndexChanged">

                <ItemTemplate>
                    <div class="product-card animate-on-scroll scale-in">
                        <img src='<%# Eval("Image") %>' class="product-img" alt="Watch" />
                        <h5><%# Eval("WatchName") %></h5>
                        <h6 class="text-success">₹ <%# Eval("Price") %></h6>
                        <asp:Button ID="btnAddCart" runat="server" Text="Add to Cart"
                            CommandName="addtocart" CommandArgument='<%# Eval("Id") %>'
                            CssClass="btn btn-primary btn-sm" />
                        <asp:Button ID="btnViewDetail" runat="server" Text="View Detail" CommandName="viewdetail" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-secondary btn-sm" />
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>
    </form>
     <script>
         // Enhanced JavaScript for better animations
         document.addEventListener('DOMContentLoaded', function () {
             // Enhanced button hover effects
             const buttons = document.querySelectorAll('.btn');
             buttons.forEach(button => {
                 button.addEventListener('mouseenter', function () {
                     this.style.transform = 'translateY(-3px) scale(1.08)';
                 });
                 button.addEventListener('mouseleave', function () {
                     this.style.transform = 'translateY(0) scale(1)';
                 });
             });

             // Scroll animation for product cards
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
             document.querySelectorAll('.animate-on-scroll').forEach((element, index) => {
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

             // Add interactive cursor effect for product cards
             const productCards = document.querySelectorAll('.product-card');

             productCards.forEach(card => {
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

             // Add ripple effect to buttons
             function createRipple(event) {
                 const button = event.currentTarget;
                 const circle = document.createElement("span");
                 const diameter = Math.max(button.clientWidth, button.clientHeight);
                 const radius = diameter / 2;

                 circle.style.width = circle.style.height = `${diameter}px`;
                 circle.style.left = `${event.clientX - button.getBoundingClientRect().left - radius}px`;
                 circle.style.top = `${event.clientY - button.getBoundingClientRect().top - radius}px`;
                 circle.classList.add("ripple");

                 const ripple = button.getElementsByClassName("ripple")[0];
                 if (ripple) {
                     ripple.remove();
                 }

                 button.appendChild(circle);
             }

             // Add ripple effect to all buttons
             buttons.forEach(button => {
                 button.addEventListener("click", createRipple);
             });
         });

         // Add CSS for ripple effect
         const style = document.createElement('style');
         style.textContent = `
            .ripple {
                position: absolute;
                border-radius: 50%;
                background-color: rgba(255, 255, 255, 0.7);
                transform: scale(0);
                animation: ripple-animation 0.6s linear;
                pointer-events: none;
            }

            @keyframes ripple-animation {
                to {
                    transform: scale(4);
                    opacity: 0;
                }
            }

            .btn {
                position: relative;
                overflow: hidden;
            }
        `;
         document.head.appendChild(style);
     </script>
</body>
</html>