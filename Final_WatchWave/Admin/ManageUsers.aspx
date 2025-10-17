<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageUsers.aspx.cs" Inherits="Final_WatchWave.Admin.ManageUsers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Users - Admin Panel</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet" />
    <style>
        :root {
            --primary: #1a1f36;
            --primary-light: #2d3748;
            --secondary: #3182ce;
            --secondary-light: #4299e1;
            --accent: #38a169;
            --accent-light: #48bb78;
            --gradient-1: linear-gradient(135deg, #3182ce 0%, #805ad5 100%);
            --gradient-2: linear-gradient(135deg, #4299e1 0%, #38a169 100%);
            --gradient-3: linear-gradient(135deg, #38a169 0%, #3182ce 100%);
            --gradient-sidebar: linear-gradient(180deg, #1a1f36 0%, #2d3748 100%);
            --glass: rgba(255, 255, 255, 0.08);
            --shadow-glow: 0 0 30px rgba(49, 130, 206, 0.2);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
            background: linear-gradient(135deg, #1a1f36 0%, #2d3748 50%, #4a5568 100%);
            background-attachment: fixed;
            margin: 0;
            min-height: 100vh;
            color: #2d3748;
        }

        /* Animated Background */
        body::before {
            content: '';
            position: fixed;
            top: -50%;
            right: -50%;
            width: 100%;
            height: 100%;
            background: 
                radial-gradient(circle at 20% 80%, rgba(49, 130, 206, 0.1) 0%, transparent 50%),
                radial-gradient(circle at 80% 20%, rgba(56, 161, 105, 0.08) 0%, transparent 50%);
            animation: float 30s ease-in-out infinite;
            pointer-events: none;
            z-index: -1;
        }

        @keyframes float {
            0%, 100% { transform: translate(0, 0) rotate(0deg) scale(1); }
            33% { transform: translate(20px, -15px) rotate(60deg) scale(1.02); }
            66% { transform: translate(-15px, 10px) rotate(120deg) scale(0.98); }
        }

        /* Premium Sidebar Styling */
        .sidebar {
            background: var(--gradient-sidebar);
            backdrop-filter: blur(15px);
            height: 100vh;
            padding: 25px 15px;
            position: fixed;
            top: 0;
            left: 0;
            width: 260px;
            overflow-y: auto;
            border-right: 1px solid rgba(255, 255, 255, 0.1);
            box-shadow: 4px 0 20px rgba(0, 0, 0, 0.3);
            z-index: 1000;
        }

        .sidebar h4 {
            color: #fff;
            text-align: center;
            margin-bottom: 40px;
            font-weight: 700;
            font-size: 1.4rem;
            padding: 15px 0;
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
            letter-spacing: 0.5px;
        }

        .sidebar a {
            display: flex;
            align-items: center;
            gap: 12px;
            color: #cbd5e1;
            padding: 14px 18px;
            margin: 6px 0;
            text-decoration: none;
            border-radius: 10px;
            font-size: 15px;
            transition: all 0.3s ease;
            border: 1px solid transparent;
            position: relative;
            overflow: hidden;
        }

        .sidebar a::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(49, 130, 206, 0.2), transparent);
            transition: left 0.6s;
        }

        .sidebar a:hover {
            background: rgba(49, 130, 206, 0.15);
            color: #fff;
            transform: translateX(5px);
            border-color: rgba(49, 130, 206, 0.3);
        }

        .sidebar a:hover::before {
            left: 100%;
        }

        .sidebar a.active {
            background: rgba(49, 130, 206, 0.25);
            color: white;
            font-weight: 600;
            border: 1px solid rgba(49, 130, 206, 0.4);
            box-shadow: 0 4px 12px rgba(49, 130, 206, 0.3);
        }

        .sidebar a i {
            font-size: 1.1rem;
            width: 20px;
            text-align: center;
            color: #4299e1;
        }

        .sidebar a.active i {
            color: #fff;
        }

        /* Enhanced Main Content */
        .content {
            margin-left: 260px;
            padding: 40px;
            min-height: 100vh;
            animation: slideInUp 0.8s ease-out;
        }

        @keyframes slideInUp {
            0% {
                opacity: 0;
                transform: translateY(30px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Enhanced Header Styling */
        h1 {
            font-weight: 700;
            color: #2d3748;
            margin-bottom: 15px;
            font-size: 2.5rem;
            animation: fadeInUp 0.8s ease-out 0.2s both;
            text-align: center;
        }

        h1 span {
            background: var(--gradient-1);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Premium Form Container */
        .content table[border="3"] {
            width: 100%;
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            padding: 30px;
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.15);
            border: 1px solid rgba(255, 255, 255, 0.3);
            position: relative;
            overflow: hidden;
            margin: 30px 0;
            border: none !important;
        }

        .content table[border="3"]::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 5px;
            background: var(--gradient-1);
        }

        /* Enhanced Table Styling */
        .content table {
            border-collapse: collapse;
            margin: 20px 0;
        }

        .content table[border="3"] tr:nth-child(even) {
            background: rgba(49, 130, 206, 0.03);
        }

        .content table[border="3"] tr:hover {
            background: rgba(49, 130, 206, 0.08);
        }

        .content table[border="3"] td {
            padding: 16px 20px;
            text-align: left;
            border: none;
            font-size: 15px;
            color: #2d3748;
            transition: all 0.3s ease;
        }

        .content table[border="3"] td:first-child {
            font-weight: 600;
            color: #2d3748;
            width: 30%;
            padding-left: 25px;
        }

        /* Enhanced Form Controls */
        .content input[type="text"],
        .content input[type="password"],
        .content input[type="email"] {
            width: 100%;
            padding: 14px 18px;
            border: 2px solid #e2e8f0;
            border-radius: 12px;
            font-size: 15px;
            outline: none;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            background: rgba(255, 255, 255, 0.9);
            font-family: 'Segoe UI', sans-serif;
            color: #2d3748;
        }

        .content input[type="text"]:focus,
        .content input[type="password"]:focus,
        .content input[type="email"]:focus {
            border-color: #3182ce;
            background: white;
            box-shadow: 0 0 0 3px rgba(49, 130, 206, 0.1);
            transform: translateY(-2px);
        }

        /* Premium Button Styling */
        .aspNetButton {
            width: 100%;
            padding: 16px;
            margin-top: 10px;
            background: var(--gradient-1);
            border: none;
            border-radius: 12px;
            color: #fff;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            position: relative;
            overflow: hidden;
        }

        .aspNetButton::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.3), transparent);
            transition: left 0.5s;
        }

        .aspNetButton:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(49, 130, 206, 0.4);
        }

        .aspNetButton:hover::before {
            left: 100%;
        }

        /* Premium GridView Styling */
        #GridView1 {
            margin-top: 40px;
            border-collapse: collapse;
            width: 100%;
            font-size: 14px;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            background: white;
            animation: fadeInUp 0.8s ease-out 0.2s both;
        }

        #GridView1 th {
            background: var(--gradient-1);
            color: white;
            text-align: center;
            padding: 18px 15px;
            font-weight: 600;
            font-size: 14px;
            border: none;
        }

        #GridView1 td {
            padding: 16px 15px;
            text-align: center;
            border-bottom: 1px solid #e2e8f0;
            color: #4a5568;
            transition: all 0.2s ease;
        }

        #GridView1 tr:nth-child(even) {
            background-color: #f8fafc;
        }

        #GridView1 tr:hover {
            background-color: rgba(49, 130, 206, 0.08);
            transform: scale(1.01);
        }

        /* Enhanced Link Buttons */
        .linkbutton, #GridView1 a {
            color: #3182ce;
            font-weight: 600;
            text-decoration: none;
            padding: 10px 18px;
            border-radius: 8px;
            transition: all 0.3s ease;
            border: 1px solid transparent;
            display: inline-block;
            min-width: 100px;
            margin: 2px;
        }

        .linkbutton:hover, #GridView1 a:hover {
            background: #3182ce;
            color: #fff;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(49, 130, 206, 0.3);
            text-decoration: none;
        }

        /* Error Message Styling */
        .error {
            font-size: 0.85rem;
            color: #e53e3e;
            margin-top: 8px;
            display: block;
            font-weight: 500;
            padding: 8px 12px;
            background: rgba(229, 62, 62, 0.1);
            border-radius: 6px;
            border-left: 3px solid #e53e3e;
        }

        /* Custom Scrollbar */
        .sidebar::-webkit-scrollbar {
            width: 5px;
        }

        .sidebar::-webkit-scrollbar-track {
            background: rgba(255, 255, 255, 0.1);
            border-radius: 3px;
        }

        .sidebar::-webkit-scrollbar-thumb {
            background: rgba(49, 130, 206, 0.5);
            border-radius: 3px;
        }

        .sidebar::-webkit-scrollbar-thumb:hover {
            background: rgba(49, 130, 206, 0.7);
        }

        /* Responsive Design */
        @media (max-width: 1100px) {
            body {
                margin-left: 0;
            }
            
            .sidebar {
                position: relative;
                width: 100%;
                height: auto;
                margin-bottom: 20px;
            }
            
            .content {
                margin-left: 0;
                padding: 30px 20px;
            }
        }

        @media (max-width: 768px) {
            .content {
                padding: 25px 15px;
            }
            
            h1 {
                font-size: 2rem;
            }
            
            .content table[border="3"] td:first-child {
                width: 35%;
                padding-left: 15px;
            }
            
            #GridView1 {
                font-size: 12px;
            }
            
            #GridView1 th,
            #GridView1 td {
                padding: 12px 8px;
            }
            
            .content table[border="3"] {
                padding: 20px 15px;
            }
        }

        @media (max-width: 480px) {
            h1 {
                font-size: 1.8rem;
            }
            
            .content table[border="3"] td {
                display: block;
                width: 100%;
                text-align: left;
                padding: 12px 15px;
            }
            
            .content table[border="3"] tr {
                display: block;
                margin-bottom: 15px;
                padding: 15px;
                background: rgba(255, 255, 255, 0.9);
                border-radius: 10px;
            }
            
            #GridView1 {
                display: block;
                overflow-x: auto;
            }
        }

        /* Loading Animation */
        @keyframes pulse {
            0%, 100% { opacity: 1; }
            50% { opacity: 0.7; }
        }

        .loading {
            animation: pulse 1.5s ease-in-out infinite;
        }

        /* Success Message Animation */
        .success-message {
            background: var(--gradient-2);
            color: white;
            padding: 15px;
            border-radius: 10px;
            margin: 15px 0;
            animation: bounceIn 0.6s ease-out;
            text-align: center;
        }

        @keyframes bounceIn {
            0% { 
                opacity: 0;
                transform: scale(0.3);
            }
            50% {
                opacity: 1;
                transform: scale(1.05);
            }
            100% {
                opacity: 1;
                transform: scale(1);
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Updated Sidebar to Match Dashboard -->
        <div class="sidebar">
            <h4>Admin Panel</h4>
            <a href="Dashboard.aspx">
                <i class="bi bi-speedometer2"></i>Dashboard
            </a>
            <a href="Add_ManageProducts.aspx">
                <i class="bi bi-plus-circle"></i>Add & Manage Product
            </a>
            <a href="ManageUsers.aspx" class="active">
                <i class="bi bi-people"></i>Manage Users
            </a>
            <a href="ManageReviews.aspx">
                <i class="bi bi-chat-left-text"></i>Manage Reviews
            </a>
            <a href="AdminLogout.aspx">
                <i class="bi bi-box-arrow-right"></i>Logout
            </a>
        </div>

        <div class="content">
            <center>
                <!-- Updated Header to Match Dashboard -->
                <h1>Manage <span>Users</span></h1>
                
                <table border="3">
                    <tr>
                        <td>Username:</td>
                        <td>
                            <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Email:</td>
                        <td>
                            <asp:TextBox ID="txteml" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Password:</td>
                        <td>
                            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Confirm Password:</td>
                        <td>
                            <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:CompareValidator ID="CompareValidator1" runat="server"
                                ControlToValidate="txtConfirmPassword"
                                ControlToCompare="txtPassword"
                                ErrorMessage="Passwords do not match."
                                CssClass="error" />
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:Button ID="Button1" runat="server" Text="Save User" OnClick="Button1_Click" CssClass="aspNetButton" /></td>
                    </tr>
                </table>

                <br />
                <br />

                <!-- GridView with Enhanced Styling -->
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1" OnRowCommand="GridView1_RowCommand">
                    <Columns>
                        <asp:TemplateField HeaderText="Id">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="UserName">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Username") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Email">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Password">
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("Password") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Update">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server"
                                    CommandArgument='<%# Eval("Id") %>'
                                    CommandName="cmd_edt" CssClass="linkbutton">Update</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Delete">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton2" runat="server"
                                    CommandArgument='<%# Eval("Id") %>'
                                    CommandName="cmd_dlt" CssClass="linkbutton">Remove User</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </center>
        </div>
    </form>
</body>
</html>