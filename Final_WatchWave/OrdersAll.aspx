<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrdersAll.aspx.cs" Inherits="Final_WatchWave.OrdersAll" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>All Confirmed Orders | WatchWave</title>
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
        .order-list {
            max-width: 1200px;
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

        .order-list::before {
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
        .order-list::after {
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

        /* Order Section Styling */
        .section-title {
            font-size: 1.3rem;
            font-weight: 700;
            color: var(--dark);
            margin: 40px 0 15px;
            padding: 15px 25px;
            background: linear-gradient(135deg, #ffffff 0%, #f8fafc 100%);
            border-radius: 15px;
            box-shadow: var(--shadow-sm);
            border-left: 5px solid transparent;
            border-image: var(--gradient-1);
            border-image-slice: 1;
            position: relative;
            transition: all 0.4s ease;
        }

        .section-title:hover {
            transform: translateX(10px);
            box-shadow: var(--shadow-md);
        }

        .order-info {
            background: linear-gradient(135deg, #f8fafc 0%, #e2e8f0 100%);
            border-left: 4px solid var(--secondary);
            border-radius: 12px;
            padding: 20px 25px;
            margin-bottom: 25px;
            font-size: 1rem;
            line-height: 1.7;
            color: var(--text);
            box-shadow: var(--shadow-sm);
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .order-info::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, transparent, rgba(99, 102, 241, 0.05), transparent);
            opacity: 0;
            transition: opacity 0.3s ease;
        }

        .order-info:hover::before {
            opacity: 1;
        }

        .order-info:hover {
            transform: translateY(-3px);
            box-shadow: var(--shadow-md);
        }

        .order-info b {
            color: var(--primary);
            font-weight: 700;
            background: var(--gradient-1);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        /* Modern Table Styling */
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0 25px;
            overflow: hidden;
            border-radius: 15px;
            box-shadow: var(--shadow-sm);
            background: #fff;
            transition: all 0.4s ease;
        }

        table:hover {
            box-shadow: var(--shadow-md);
        }

        th {
            background: var(--gradient-1);
            color: #fff;
            padding: 16px 12px;
            text-align: left;
            font-size: 0.95rem;
            font-weight: 600;
            letter-spacing: 0.4px;
            position: relative;
            overflow: hidden;
        }

        th::after {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent);
            transition: left 0.6s ease;
        }

        th:hover::after {
            left: 100%;
        }

        td {
            padding: 14px 12px;
            border-bottom: 1px solid rgba(99, 102, 241, 0.1);
            background-color: #fff;
            transition: all 0.3s ease;
            font-size: 0.9rem;
        }

        tr:hover td {
            background-color: rgba(99, 102, 241, 0.03);
            transform: translateX(5px);
        }

        td img {
            width: 70px;
            height: 70px;
            object-fit: cover;
            border-radius: 10px;
            box-shadow: var(--shadow-sm);
            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            border: 2px solid transparent;
        }

        td img:hover {
            transform: scale(1.15) rotate(2deg);
            box-shadow: var(--shadow-glow);
            border-color: var(--secondary);
        }

        /* Cancel Button */
        .cancel-btn {
            background: var(--gradient-red);
            color: #fff;
            border: none;
            padding: 12px 24px;
            border-radius: 10px;
            font-size: 0.95rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            position: relative;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(239, 68, 68, 0.3);
            margin-top: 10px;
        }

        .cancel-btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent);
            transition: left 0.6s ease;
        }

        .cancel-btn:hover::before {
            left: 100%;
        }

        .cancel-btn:hover {
            transform: translateY(-3px) scale(1.05);
            box-shadow: 0 8px 25px rgba(239, 68, 68, 0.4);
        }

        /* Message Styling */
        #litMessage {
            display: block;
            text-align: center;
            color: var(--text);
            font-weight: 600;
            margin: 20px auto;
            padding: 15px 25px;
            background: rgba(255, 255, 255, 0.9);
            border-radius: 12px;
            box-shadow: var(--shadow-sm);
            max-width: 600px;
            border-left: 4px solid var(--secondary);
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

        /* Empty State */
        .empty-state {
            text-align: center;
            padding: 60px 20px;
            color: var(--text-light);
        }

        .empty-state h3 {
            font-size: 1.8rem;
            margin-bottom: 15px;
            background: var(--gradient-1);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .empty-state p {
            font-size: 1.1rem;
            max-width: 500px;
            margin: 0 auto 30px;
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

            .order-list {
                padding: 40px 30px;
                margin: 40px 20px;
            }

            h2 {
                font-size: 2.5rem;
            }

            table {
                font-size: 0.85rem;
            }

            td img {
                width: 60px;
                height: 60px;
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

            .order-list {
                padding: 30px 20px;
            }

            h2 {
                font-size: 2.2rem;
            }

            .section-title {
                font-size: 1.1rem;
                padding: 12px 20px;
            }

            table {
                display: block;
                overflow-x: auto;
            }

            th, td {
                padding: 10px 8px;
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

            .order-list {
                padding: 25px 15px;
            }

            h2 {
                font-size: 2rem;
            }

            .section-title {
                font-size: 1rem;
                padding: 10px 15px;
            }

            .order-info {
                padding: 15px 20px;
            }

            td img {
                width: 50px;
                height: 50px;
            }

            .cancel-btn {
                padding: 10px 20px;
                font-size: 0.9rem;
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
                <li><a href="WomanWatch.aspx">Woman Watch</a></li>
                <li><a href="ChildWatch.aspx">Child Watch</a></li>
                <li><a href="Review.aspx">Review</a></li>
                <li><a href="AboutUs.aspx">About Us</a></li>
                <li><a href="Map.aspx">Location</a></li>
                <li><a href="ContactUs.aspx">Contact Us</a></li>
                <li><a href="Blog.aspx">Blog</a></li>
                <li><a href="Privous_review.aspx">Previous Review</a></li>
                <li class="active"><a href="OrdersAll.aspx">Order</a></li>
            </ul>
        </div>
    </header>

    <form id="form1" runat="server">
        <h2 class="animate-on-scroll fade-in-up">📦 All Confirmed Orders</h2>
        <asp:Literal ID="litMessage" runat="server" ></asp:Literal>
        
        <div class="order-list animate-on-scroll fade-in-up">
            <asp:Repeater ID="rptOrders" runat="server" OnItemDataBound="rptOrders_ItemDataBound" OnItemCommand="rptOrders_ItemCommand">
                <ItemTemplate>
                    <div class="animate-on-scroll fade-in-up" style="margin-bottom: 50px; animation-delay: <%# Container.ItemIndex * 0.1 %>s">
                        <div class="section-title animate-on-scroll fade-in-left">
                            Order ID: <%# Eval("OrderID") %> |
                            Placed On: <%# Convert.ToDateTime(Eval("OrderDate")).ToString("dd MMM yyyy hh:mm tt") %>
                        </div>

                        <div class="order-info animate-on-scroll fade-in-right">
                            <b>Name:</b> <%# Eval("CustomerName") %> |
                            <b>Mobile:</b> <%# Eval("Mobile") %> |
                            <b>Address:</b> <%# Eval("Address") %>, <%# Eval("District") %>, <%# Eval("Taluko") %> |
                            <b>Payment:</b> <%# Eval("PaymentMethod") %>
                        </div>

                        <table class="animate-on-scroll scale-in">
                            <tr>
                                <th>Product ID</th>
                                <th>Watch Name</th>
                                <th>Price (₹)</th>
                                <th>Quantity</th>
                                <th>Image</th>
                            </tr>
                            <asp:Repeater ID="rptOrderDetails" runat="server">
                                <ItemTemplate>
                                    <tr class="animate-on-scroll fade-in-up">
                                        <td><%# Eval("ProductID") %></td>
                                        <td><%# Eval("WatchName") %></td>
                                        <td><%# Convert.ToDecimal(Eval("Price")).ToString("N2") %></td>
                                        <td><%# Eval("Quantity") %></td>
                                        <td><img src="<%# Eval("Image") %>" alt="Watch Image" /></td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </table>

                        <asp:Button ID="btnCancel" runat="server" Text="Cancel Order"
                            CommandName="CancelOrder"
                            CommandArgument='<%# Eval("OrderID") %>'
                            CssClass="cancel-btn animate-on-scroll fade-in-up delay-1"
                            OnClientClick="return confirm('Are you sure you want to cancel this order?');" />
                    </div>
                </ItemTemplate>
            </asp:Repeater>

            <asp:Panel ID="pnlEmpty" runat="server" Visible="false" CssClass="empty-state animate-on-scroll fade-in-up">
                <h3>No Orders Yet</h3>
                <p>Your confirmed orders will appear here once you make a purchase!</p>
            </asp:Panel>
            <p>
                <asp:Button ID="Button1" runat="server" Text="Order Details Crystal Report" OnClick="Button1_Click" /></p>
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

            // Add interactive effects for table rows
            const tableRows = document.querySelectorAll('table tr');
            
            tableRows.forEach(row => {
                row.addEventListener('mouseenter', function() {
                    this.style.transform = 'translateX(5px)';
                });

                row.addEventListener('mouseleave', function() {
                    this.style.transform = 'translateX(0)';
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
            .section-title {
                transition: all 0.4s ease;
            }
            
            .order-info {
                transition: all 0.3s ease;
            }
            
            table tr {
                transition: all 0.3s ease;
            }
            
            .cancel-btn {
                transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            }
        `;
        document.head.appendChild(style);
    </script>
</body>
</html>