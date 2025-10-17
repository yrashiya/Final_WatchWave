<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddToCart.aspx.cs" Inherits="Final_WatchWave.AddToCart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>🛒 Your Cart - Timeless Watches</title>
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
        .container {
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
        h2 {
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

        /* Modern Cart GridView */
        #<%= gvCart.ClientID %> {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0 15px;
            font-family: 'Inter', sans-serif;
            box-shadow: var(--shadow-md);
            border-radius: 20px;
            overflow: hidden;
            background: transparent;
        }

        #<%= gvCart.ClientID %> thead th {
            background: var(--gradient-1);
            color: white;
            padding: 20px;
            font-weight: 600;
            font-size: 1.1rem;
            text-align: center;
            border: none;
        }

        #<%= gvCart.ClientID %> tbody tr {
            background: linear-gradient(135deg, #ffffff 0%, #f8fafc 100%);
            box-shadow: var(--shadow-sm);
            border-radius: 15px;
            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            display: table-row;
            position: relative;
            overflow: hidden;
        }

        #<%= gvCart.ClientID %> tbody tr::before {
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

        #<%= gvCart.ClientID %> tbody tr:hover {
            transform: translateY(-8px);
            box-shadow: var(--shadow-lg), var(--shadow-glow);
        }

        #<%= gvCart.ClientID %> tbody tr:hover::before {
            transform: scaleX(1);
        }

        #<%= gvCart.ClientID %> tbody td {
            padding: 25px 20px;
            vertical-align: middle;
            border: none;
            color: var(--text);
            font-weight: 500;
            font-size: 1rem;
            text-align: center;
            border-bottom: 1px solid rgba(99, 102, 241, 0.1);
        }

        #<%= gvCart.ClientID %> tbody td img {
            border-radius: 15px;
            width: 100px;
            height: 100px;
            object-fit: cover;
            box-shadow: var(--shadow-sm);
            transition: all 0.4s ease;
        }

        #<%= gvCart.ClientID %> tbody td img:hover {
            transform: scale(1.1);
            box-shadow: var(--shadow-md);
        }

        /* Modern Button Styles */
        #<%= gvCart.ClientID %> .btn-outline-danger,
        #<%= gvCart.ClientID %> .btn-outline-success,
        #<%= gvCart.ClientID %> .btn-danger {
            font-weight: 600;
            padding: 10px 16px;
            font-size: 0.9rem;
            border-radius: 10px;
            transition: all 0.3s ease;
            box-shadow: var(--shadow-sm);
            border: none;
            position: relative;
            overflow: hidden;
        }

        #<%= gvCart.ClientID %> .btn-outline-danger {
            background: transparent;
            color: #e74c3c;
            border: 2px solid #e74c3c;
        }

        #<%= gvCart.ClientID %> .btn-outline-danger:hover {
            background: #e74c3c;
            color: white;
            box-shadow: 0 8px 20px rgba(231, 76, 60, 0.4);
            transform: translateY(-2px);
        }

        #<%= gvCart.ClientID %> .btn-outline-success {
            background: transparent;
            color: #27ae60;
            border: 2px solid #27ae60;
        }

        #<%= gvCart.ClientID %> .btn-outline-success:hover {
            background: #27ae60;
            color: white;
            box-shadow: 0 8px 20px rgba(39, 174, 96, 0.4);
            transform: translateY(-2px);
        }

        #<%= gvCart.ClientID %> .btn-danger {
            background: var(--gradient-2);
            color: white;
            min-width: 120px;
            box-shadow: 0 6px 18px rgba(192, 57, 43, 0.4);
            transition: all 0.3s ease;
            border-radius: 10px;
            font-size: 0.9rem;
        }

        #<%= gvCart.ClientID %> .btn-danger:hover {
            background: var(--gradient-2);
            box-shadow: 0 10px 30px rgba(192, 57, 43, 0.6);
            transform: translateY(-3px);
        }

        #<%= gvCart.ClientID %> .mx-2 {
            font-size: 1.2rem;
            font-weight: 700;
            min-width: 40px;
            text-align: center;
            display: inline-block;
            color: var(--dark);
            background: rgba(99, 102, 241, 0.1);
            padding: 5px 10px;
            border-radius: 8px;
        }

        #<%= gvCart.ClientID %> a.btn {
            text-decoration: none !important;
        }

        /* Total Price Label */
        #<%= lblTotal.ClientID %> {
            font-size: 1.8rem;
            font-weight: 800;
            background: var(--gradient-1);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            text-shadow: 0 2px 6px rgba(99, 102, 241, 0.3);
        }

        /* Buy Now Button */
        .btn-primary {
            background: var(--gradient-1);
            border: none;
            color: #fff;
            padding: 14px 35px;
            font-size: 1.1rem;
            font-weight: 700;
            border-radius: 12px;
            cursor: pointer;
            box-shadow: var(--shadow-md);
            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            display: inline-block;
            text-align: center;
            user-select: none;
            position: relative;
            overflow: hidden;
        }

        .btn-primary::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.3), transparent);
            transition: left 0.5s ease;
        }

        .btn-primary:hover {
            background: var(--gradient-1);
            box-shadow: var(--shadow-lg), var(--shadow-glow);
            transform: translateY(-5px);
        }

        .btn-primary:hover::before {
            left: 100%;
        }

        /* Order Form Styling */
        .order-form {
            max-width: 500px;
            margin: 40px auto;
            padding: 40px;
            border-radius: 25px;
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            box-shadow: var(--shadow-lg);
            position: relative;
            overflow: hidden;
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        .order-form::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 6px;
            background: var(--gradient-1);
            box-shadow: 0 0 20px rgba(99, 102, 241, 0.5);
        }

        .order-form h2 {
            font-size: 2rem;
            margin-bottom: 30px;
        }

        .order-form table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0 15px;
            background: transparent;
        }

        .order-form table tr {
            background: transparent;
            transition: all 0.3s ease;
        }

        .order-form table tr:hover {
            transform: translateY(-3px);
        }

        .order-form td {
            padding: 12px 10px;
            font-size: 1rem;
            color: var(--text);
            font-weight: 500;
            border: none;
        }

        .order-form .form-control {
            width: 100%;
            padding: 12px 16px;
            border: 1px solid rgba(99, 102, 241, 0.2);
            border-radius: 10px;
            background: #ffffff;
            color: var(--text);
            font-weight: 500;
            transition: all 0.3s ease;
            box-shadow: var(--shadow-sm);
        }

        .order-form .form-control:focus {
            box-shadow: 0 0 0 3px rgba(99, 102, 241, 0.2);
            border-color: var(--secondary);
            transform: scale(1.02);
        }

        .order-form .btn {
            width: 100%;
            margin-top: 15px;
            background: var(--gradient-1);
            color: white;
            border: none;
            font-weight: 700;
            font-size: 1.1rem;
            padding: 14px;
            border-radius: 12px;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: var(--shadow-md);
        }

        .order-form .btn:hover {
            background: var(--gradient-1);
            box-shadow: var(--shadow-lg), var(--shadow-glow);
            transform: translateY(-3px);
        }

        /* Payment Method Styling */
        .order-form #rblPaymentMethod label {
            color: var(--text) !important;
            font-weight: 600;
            margin-right: 20px;
            cursor: pointer;
            padding: 8px 15px;
            border-radius: 8px;
            transition: all 0.3s ease;
        }

        .order-form #rblPaymentMethod label:hover {
            background: rgba(99, 102, 241, 0.1);
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
                padding: 50px 30px;
                margin: 40px 20px;
            }

            h2 {
                font-size: 2rem;
            }
        }

        @media (max-width: 768px) {
            .container {
                padding: 40px 25px;
            }

            h2 {
                font-size: 1.8rem;
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

            #<%= gvCart.ClientID %> {
                display: block;
                overflow-x: auto;
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

            .container {
                padding: 30px 20px;
                margin: 30px 15px;
            }

            .order-form {
                padding: 25px 20px;
            }

            h2 {
                font-size: 1.6rem;
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
    
    <form id="form1" runat="server">
        <div class="container mt-4 animate-on-scroll fade-in-up">
            <h2 class="mb-4">🛒 Items in Your Cart</h2>
            <asp:GridView ID="gvCart" runat="server" CssClass="table table-bordered table-striped" AutoGenerateColumns="False" OnRowCommand="gvCart_RowCommand">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Product ID" />
                    <asp:BoundField DataField="WatchName" HeaderText="Watch Name" />
                    <asp:BoundField DataField="Price" HeaderText="Price (₹)" />
                    <asp:ImageField DataImageUrlField="Image" HeaderText="Image" ControlStyle-Width="100" ControlStyle-Height="100" />
                    <asp:TemplateField HeaderText="Quantity">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnMinus" runat="server" CommandName="DecreaseQty" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-sm btn-outline-danger">-</asp:LinkButton>
                            <asp:Label ID="lblQty" runat="server" Text='<%# Eval("Quantity") %>' CssClass="mx-2 fw-bold"></asp:Label>
                            <asp:LinkButton ID="btnPlus" runat="server" CommandName="IncreaseQty" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-sm btn-outline-success">+</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Remove">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnRemove" runat="server" CommandName="RemoveItem" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-sm btn-danger">🗑 Remove</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <div class="d-flex justify-content-between align-items-center mt-3 animate-on-scroll fade-in-up delay-1">
                <asp:Label ID="lblTotal" runat="server" CssClass="fw-bold fs-5 text-success"></asp:Label>
                <asp:Button ID="btnBuy" runat="server" Text="Buy Now" CssClass="btn btn-primary" OnClick="btnBuy_Click" />
            </div>
        </div>

        <asp:Panel ID="pnlOrderForm" runat="server" Visible="false" CssClass="order-form animate-on-scroll scale-in">
            <h2>🛒 Place Your Order</h2>
            <table>
                <tr>
                    <td>Name:</td>
                    <td>
                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" ErrorMessage="Name is required" CssClass="text-danger" Display="Dynamic" ValidationGroup="OrderForm" />
                    </td>
                </tr>
                <tr>
                    <td>Mobile No:</td>
                    <td>
                        <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvMobile" runat="server" ControlToValidate="txtMobile" ErrorMessage="Mobile number is required" CssClass="text-danger" Display="Dynamic" ValidationGroup="OrderForm" />
                        <asp:RegularExpressionValidator ID="revMobile" runat="server" ControlToValidate="txtMobile" ErrorMessage="Enter a valid 10-digit mobile number" CssClass="text-danger" Display="Dynamic" ValidationExpression="^\d{10}$" ValidationGroup="OrderForm" />
                    </td>
                </tr>
                <tr>
                    <td>Address:</td>
                    <td>
                        <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="txtAddress" ErrorMessage="Address is required" CssClass="text-danger" Display="Dynamic" ValidationGroup="OrderForm" />
                    </td>
                </tr>
                <tr>
                    <td>District:</td>
                    <td>
                        <asp:TextBox ID="txtDistrict" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvDistrict" runat="server" ControlToValidate="txtDistrict" ErrorMessage="District is required" CssClass="text-danger" Display="Dynamic" ValidationGroup="OrderForm" />
                    </td>
                </tr>
                <tr>
                    <td>Sub-District:</td>
                    <td>
                        <asp:TextBox ID="txtTaluko" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvTaluko" runat="server" ControlToValidate="txtTaluko" ErrorMessage="Taluko is required" CssClass="text-danger" Display="Dynamic" ValidationGroup="OrderForm" />
                    </td>
                </tr>
                <tr>
                    <td>Payment Method:</td>
                    <td>
                        <asp:RadioButtonList ID="rblPaymentMethod" runat="server" CssClass="form-control" RepeatDirection="Horizontal">
                            <asp:ListItem Text="Cash on Delivery" Value="COD" Selected="True"></asp:ListItem>
                            <asp:ListItem Text="UPI" Value="UPI"></asp:ListItem>
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="rfvPaymentMethod" runat="server" ControlToValidate="rblPaymentMethod" InitialValue="" ErrorMessage="Select a payment method" CssClass="text-danger" Display="Dynamic" ValidationGroup="OrderForm" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="btnConfirmOrder" runat="server" Text="Conform Order" CssClass="btn" OnClick="btnConfirmOrder_Click" ValidationGroup="OrderForm" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </form>

    <script type="text/javascript">
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

            // Add interactive cursor effect for cart items
            const cartItems = document.querySelectorAll('#<%= gvCart.ClientID %> tbody tr');

            cartItems.forEach(item => {
                item.addEventListener('mousemove', (e) => {
                    const rect = item.getBoundingClientRect();
                    const x = e.clientX - rect.left;
                    const y = e.clientY - rect.top;

                    const centerX = rect.width / 2;
                    const centerY = rect.height / 2;

                    const rotateX = (y - centerY) / 25;
                    const rotateY = (centerX - x) / 25;

                    item.style.transform = `perspective(1000px) rotateX(${rotateX}deg) rotateY(${rotateY}deg) translateY(-8px)`;
                });

                item.addEventListener('mouseleave', () => {
                    item.style.transform = '';
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

        function showDeliveryMessage() {
            var days = Math.floor(Math.random() * 5) + 3;
            alert("✅ Your order will arrive in " + days + " days!");
        }
    </script>
</body>
</html>