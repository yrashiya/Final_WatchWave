<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderConfirmed.aspx.cs" Inherits="Final_WatchWave.OrderConfirmed" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Order Confirmation | WatchWave</title>
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

        /* Order Section Styling */
        .section-title {
            font-size: 1.4rem;
            font-weight: 700;
            color: var(--dark);
            margin: 40px 0 20px;
            padding: 20px 30px;
            background: linear-gradient(135deg, #ffffff 0%, #f8fafc 100%);
            border-radius: 20px;
            box-shadow: var(--shadow-sm);
            border-left: 5px solid transparent;
            border-image: var(--gradient-1);
            border-image-slice: 1;
            position: relative;
            transition: all 0.4s ease;
            display: block;
        }

        .section-title:hover {
            transform: translateX(10px);
            box-shadow: var(--shadow-md);
        }

        .customer-info {
            background: linear-gradient(135deg, #f8fafc 0%, #e2e8f0 100%);
            border-left: 4px solid var(--secondary);
            border-radius: 15px;
            padding: 25px 30px;
            margin-bottom: 30px;
            font-size: 1.1rem;
            line-height: 1.8;
            color: var(--text);
            box-shadow: var(--shadow-sm);
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .customer-info::before {
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

        .customer-info:hover::before {
            opacity: 1;
        }

        .customer-info:hover {
            transform: translateY(-3px);
            box-shadow: var(--shadow-md);
        }

        .customer-info b {
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
            margin: 25px 0 35px;
            overflow: hidden;
            border-radius: 20px;
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
            padding: 18px 15px;
            text-align: left;
            font-size: 1rem;
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
            padding: 16px 15px;
            border-bottom: 1px solid rgba(99, 102, 241, 0.1);
            background-color: #fff;
            transition: all 0.3s ease;
            font-size: 0.95rem;
        }

        tr:hover td {
            background-color: rgba(99, 102, 241, 0.03);
            transform: translateX(5px);
        }

        td img {
            width: 80px;
            height: 80px;
            object-fit: cover;
            border-radius: 12px;
            box-shadow: var(--shadow-sm);
            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            border: 2px solid transparent;
        }

        td img:hover {
            transform: scale(1.15) rotate(2deg);
            box-shadow: var(--shadow-glow);
            border-color: var(--secondary);
        }

        /* Back Button */
        .back-btn {
            background: var(--gradient-1);
            color: #fff;
            border: none;
            padding: 16px 35px;
            font-size: 1.1rem;
            font-weight: 600;
            border-radius: 12px;
            cursor: pointer;
            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            display: block;
            margin: 40px auto 0;
            position: relative;
            overflow: hidden;
            box-shadow: 0 6px 20px rgba(99, 102, 241, 0.3);
            min-width: 200px;
        }

        .back-btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.3), transparent);
            transition: left 0.6s ease;
        }

        .back-btn:hover::before {
            left: 100%;
        }

        .back-btn:hover {
            transform: translateY(-5px) scale(1.05);
            box-shadow: 0 12px 30px rgba(99, 102, 241, 0.5);
        }

        /* Message Styling */
        #litMessage {
            display: block;
            text-align: center;
            color: var(--text);
            font-weight: 600;
            margin: 30px auto;
            padding: 20px 30px;
            background: rgba(255, 255, 255, 0.9);
            border-radius: 15px;
            box-shadow: var(--shadow-sm);
            max-width: 600px;
            border-left: 4px solid var(--secondary);
            font-size: 1.1rem;
        }

        /* Success Animation */
        .success-animation {
            text-align: center;
            margin-bottom: 30px;
        }

        .checkmark {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            display: block;
            stroke-width: 2;
            stroke: #4bb71b;
            stroke-miterlimit: 10;
            margin: 0 auto;
            box-shadow: inset 0px 0px 0px #4bb71b;
            animation: fill .4s ease-in-out .4s forwards, scale .3s ease-in-out .9s both;
        }

        .checkmark__circle {
            stroke-dasharray: 166;
            stroke-dashoffset: 166;
            stroke-width: 2;
            stroke-miterlimit: 10;
            stroke: #4bb71b;
            fill: none;
            animation: stroke 0.6s cubic-bezier(0.65, 0, 0.45, 1) forwards;
        }

        .checkmark__check {
            transform-origin: 50% 50%;
            stroke-dasharray: 48;
            stroke-dashoffset: 48;
            animation: stroke 0.3s cubic-bezier(0.65, 0, 0.45, 1) 0.8s forwards;
        }

        @keyframes stroke {
            100% { stroke-dashoffset: 0; }
        }

        @keyframes scale {
            0%, 100% { transform: none; }
            50% { transform: scale3d(1.1, 1.1, 1); }
        }

        @keyframes fill {
            100% { box-shadow: inset 0px 0px 0px 30px #4bb71b; }
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
            .order-list {
                padding: 50px 40px;
            }
        }

        @media (max-width: 992px) {
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
                width: 70px;
                height: 70px;
            }
        }

        @media (max-width: 768px) {
            .order-list {
                padding: 30px 20px;
            }

            h2 {
                font-size: 2.2rem;
            }

            .section-title {
                font-size: 1.2rem;
                padding: 15px 20px;
            }

            .customer-info {
                padding: 20px 25px;
                font-size: 1rem;
            }

            table {
                display: block;
                overflow-x: auto;
            }

            th, td {
                padding: 12px 10px;
            }
        }

        @media (max-width: 576px) {
            .order-list {
                padding: 25px 15px;
            }

            h2 {
                font-size: 2rem;
            }

            .section-title {
                font-size: 1.1rem;
                padding: 12px 15px;
            }

            .customer-info {
                padding: 15px 20px;
                font-size: 0.95rem;
            }

            td img {
                width: 60px;
                height: 60px;
            }

            .back-btn {
                padding: 14px 25px;
                font-size: 1rem;
            }
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <h2 class="animate-on-scroll fade-in-up">✅ Order Confirmed</h2>

        <div class="success-animation animate-on-scroll scale-in">
            <svg class="checkmark" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 52 52">
                <circle class="checkmark__circle" cx="26" cy="26" r="25" fill="none"/>
                <path class="checkmark__check" fill="none" d="M14.1 27.2l7.1 7.2 16.7-16.8"/>
            </svg>
        </div>

        <asp:Literal ID="litMessage" runat="server"></asp:Literal>

        <div class="order-list animate-on-scroll fade-in-up">
            <asp:Repeater ID="rptOrders" runat="server" OnItemDataBound="rptOrders_ItemDataBound">
                <ItemTemplate>
                    <div class="animate-on-scroll fade-in-up" style="margin-bottom: 50px; animation-delay: <%# Container.ItemIndex * 0.1 %>s">
                        <div class="section-title animate-on-scroll fade-in-left">
                            🧾 Order ID: <%# Eval("OrderID") %> | 
                            Placed On: <%# Convert.ToDateTime(Eval("OrderDate")).ToString("dd MMM yyyy hh:mm tt") %>
                        </div>

                        <div class="customer-info animate-on-scroll fade-in-right">
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
                                        <td>
                                            <img src="<%# Eval("Image") %>" alt="Watch Image" />
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </table>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

            <asp:Button ID="Button1" runat="server" Text="Back to Shop" OnClick="btnBackToShop_Click" CssClass="back-btn animate-on-scroll scale-in delay-1" />
            <asp:Button ID="Button2" runat="server" Text="Crystal Report of Order" OnClick="Button2_Click" />
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

            // Add confetti effect for order confirmation
            function createConfetti() {
                const colors = ['#6366f1', '#818cf8', '#f59e0b', '#10b981', '#ef4444'];
                const confettiCount = 50;

                for (let i = 0; i < confettiCount; i++) {
                    const confetti = document.createElement('div');
                    confetti.style.position = 'fixed';
                    confetti.style.width = '10px';
                    confetti.style.height = '10px';
                    confetti.style.background = colors[Math.floor(Math.random() * colors.length)];
                    confetti.style.borderRadius = '50%';
                    confetti.style.top = '0';
                    confetti.style.left = Math.random() * 100 + 'vw';
                    confetti.style.opacity = '0';
                    confetti.style.zIndex = '9999';
                    confetti.style.pointerEvents = 'none';
                    
                    document.body.appendChild(confetti);

                    // Animate confetti
                    const animation = confetti.animate([
                        { transform: 'translateY(0) rotate(0deg)', opacity: 1 },
                        { transform: `translateY(${window.innerHeight}px) rotate(${360 + Math.random() * 360}deg)`, opacity: 0 }
                    ], {
                        duration: 2000 + Math.random() * 2000,
                        easing: 'cubic-bezier(0.1, 0.8, 0.3, 1)'
                    });

                    animation.onfinish = () => confetti.remove();
                }
            }

            // Trigger confetti on page load
            setTimeout(createConfetti, 500);
        });

        // Add CSS for enhanced effects
        const style = document.createElement('style');
        style.textContent = `
            .section-title {
                transition: all 0.4s ease;
            }
            
            .customer-info {
                transition: all 0.3s ease;
            }
            
            table tr {
                transition: all 0.3s ease;
            }
            
            .back-btn {
                transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            }
        `;
        document.head.appendChild(style);
    </script>
</body>
</html>