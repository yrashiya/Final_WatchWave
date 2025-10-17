<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add_ManageProducts.aspx.cs" Inherits="Manage_p_r.ManageProducts" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>⌚ Add Watch Product</title>
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
            display: flex;
            justify-content: center;
            align-items: flex-start;
            padding: 40px 20px;
            margin-left: 260px;
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

        /* UPDATED SIDEBAR TO MATCH DASHBOARD */
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

        /* Enhanced Form Container */
        form {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.15);
            width: 900px;
            text-align: center;
            border: 1px solid rgba(255, 255, 255, 0.3);
            position: relative;
            overflow: hidden;
            animation: slideInUp 0.8s ease-out;
        }

        form::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 5px;
            background: var(--gradient-1);
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

        /* Enhanced Title */
        h1 {
            font-size: 2.2rem;
            margin-bottom: 30px;
            background: var(--gradient-1);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            font-weight: 700;
            position: relative;
            padding-bottom: 15px;
        }

        h1::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 3px;
            background: var(--gradient-1);
            border-radius: 2px;
        }

        /* Premium Table Styling */
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }

        table[border="3"] {
            border: none !important;
            background: rgba(255, 255, 255, 0.5);
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.08);
        }

        td {
            padding: 16px 12px;
            text-align: left;
            border: none;
            font-size: 14px;
            color: #2d3748;
            transition: all 0.3s ease;
        }

        table[border="3"] tr:nth-child(even) {
            background: rgba(49, 130, 206, 0.03);
        }

        table[border="3"] tr:hover {
            background: rgba(49, 130, 206, 0.08);
        }

        table[border="3"] td:first-child {
            font-weight: 600;
            color: #2d3748;
            width: 25%;
            padding-left: 25px;
        }

        /* Enhanced Form Controls */
        input[type="text"],
        select,
        textarea {
            width: 100%;
            padding: 12px 16px;
            border: 2px solid #e2e8f0;
            border-radius: 10px;
            font-size: 14px;
            outline: none;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            background: rgba(255, 255, 255, 0.9);
            font-family: 'Segoe UI', sans-serif;
        }

        input[type="text"]:focus,
        select:focus,
        textarea:focus {
            border-color: #3182ce;
            background: white;
            box-shadow: 0 0 0 3px rgba(49, 130, 206, 0.1);
            transform: translateY(-2px);
        }

        /* Enhanced Radio Button List */
        .asp\:RadioButtonList {
            display: flex;
            gap: 20px;
            align-items: center;
        }

        .asp\:RadioButtonList input[type="radio"] {
            margin-right: 6px;
            transform: scale(1.2);
            accent-color: #3182ce;
        }

        .asp\:RadioButtonList label {
            display: flex;
            align-items: center;
            cursor: pointer;
            font-weight: 500;
            color: #4a5568;
        }

        /* File Upload Styling */
        input[type="file"] {
            padding: 10px;
            border: 2px dashed #cbd5e0;
            border-radius: 10px;
            background: rgba(255, 255, 255, 0.8);
            transition: all 0.3s ease;
            width: 100%;
        }

        input[type="file"]:hover {
            border-color: #3182ce;
            background: rgba(49, 130, 206, 0.05);
        }

        /* Premium Button Styling */
        .asp\:Button,
        input[type="submit"],
        button {
            width: 100%;
            padding: 14px;
            margin-top: 15px;
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

        .asp\:Button::before,
        input[type="submit"]::before,
        button::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.3), transparent);
            transition: left 0.5s;
        }

        .asp\:Button:hover,
        input[type="submit"]:hover,
        button:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(49, 130, 206, 0.4);
        }

        .asp\:Button:hover::before,
        input[type="submit"]:hover::before,
        button:hover::before {
            left: 100%;
        }

        /* Premium GridView Styling */
        .styled-gridview {
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

        .styled-gridview th {
            background: var(--gradient-1);
            color: white;
            text-align: center;
            padding: 16px 12px;
            font-weight: 600;
            font-size: 14px;
            border: none;
        }

        .styled-gridview td {
            padding: 14px 12px;
            text-align: center;
            border-bottom: 1px solid #e2e8f0;
            color: #4a5568;
            transition: all 0.2s ease;
        }

        .styled-gridview tr:nth-child(even) {
            background-color: #f8fafc;
        }

        .styled-gridview tr:hover {
            background-color: rgba(49, 130, 206, 0.08);
            transform: scale(1.01);
        }

        .styled-gridview a {
            color: #3182ce;
            font-weight: 600;
            text-decoration: none;
            padding: 8px 16px;
            border-radius: 8px;
            transition: all 0.3s ease;
            border: 1px solid transparent;
            display: inline-block;
            min-width: 80px;
        }

        .styled-gridview a:hover {
            background: #3182ce;
            color: #fff;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(49, 130, 206, 0.3);
        }

        /* Dropdown Styling */
        select {
            appearance: none;
            background-image: url("data:image/svg+xml;charset=US-ASCII,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 4 5'><path fill='%23333' d='M2 0L0 2h4zm0 5L0 3h4z'/></svg>");
            background-repeat: no-repeat;
            background-position: right 12px center;
            background-size: 12px;
            padding-right: 40px;
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
                padding: 20px;
            }
            
            .sidebar {
                position: relative;
                width: 100%;
                height: auto;
                margin-bottom: 20px;
            }
            
            form {
                width: 100%;
                padding: 30px 20px;
            }
        }

        @media (max-width: 768px) {
            form {
                padding: 25px 15px;
            }
            
            h1 {
                font-size: 1.8rem;
            }
            
            table[border="3"] td:first-child {
                width: 35%;
                padding-left: 15px;
            }
            
            .asp\:RadioButtonList {
                flex-direction: column;
                gap: 10px;
                align-items: flex-start;
            }
            
            .styled-gridview {
                font-size: 12px;
            }
            
            .styled-gridview th,
            .styled-gridview td {
                padding: 12px 8px;
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

    <!-- UPDATED SIDEBAR TO MATCH DASHBOARD -->
    <div class="sidebar">
        <h4>Admin Panel</h4>
        <a href="Dashboard.aspx">
            <i class="bi bi-speedometer2"></i>Dashboard
        </a>
        <a href="Add_ManageProducts.aspx" class="active">
            <i class="bi bi-plus-circle"></i>Add & Manage Product
        </a>
        <a href="ManageUsers.aspx">
            <i class="bi bi-people"></i>Manage Users
        </a>
        <a href="ManageReviews.aspx">
            <i class="bi bi-chat-left-text"></i>Manage Reviews
        </a>
        <a href="AdminLogout.aspx">
            <i class="bi bi-box-arrow-right"></i>Logout
        </a>
    </div>

    <form id="form1" runat="server">
        <div>
            <center>
                <h1>⌚ Add Watch Product</h1>
                <table border="3">
                    <tr>
                        <td>Watch Name :</td>
                        <td>
                            <asp:TextBox ID="txtWatchName" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Brand :</td>
                        <td>
                            <asp:DropDownList ID="ddlBrand" runat="server">
                                <asp:ListItem>Rolex</asp:ListItem>
                                <asp:ListItem>Omega</asp:ListItem>
                                <asp:ListItem>Casio</asp:ListItem>
                                <asp:ListItem>Fossil</asp:ListItem>
                                <asp:ListItem>Titan</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>Type :</td>
                        <td>
                            <asp:RadioButtonList ID="rdbType" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem>Analog</asp:ListItem>
                                <asp:ListItem>Digital</asp:ListItem>
                                <asp:ListItem>Smart</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td>Price :</td>
                        <td>
                            <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Quantity :</td>
                        <td>
                            <asp:TextBox ID="txtQty" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Watch Image :</td>
                        <td>
                            <asp:FileUpload ID="fuImage" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:Button ID="Button1" runat="server" Text="Save Watch" OnClick="Button1_Click" />
                        </td>
                    </tr>
                </table>

                <table>
                    <tr>
                        <td>
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="styled-gridview" OnRowCommand="GridView1_RowCommand1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                                <Columns>
                                    <asp:TemplateField HeaderText="Id">
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="WatchName">
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("WatchName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Brand">
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("Brand") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Type">
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("Type") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Price">
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Quentity">
                                        <ItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="image">
                                        <ItemTemplate>
                                            <asp:Label ID="Label6" runat="server" Text='<%# Eval("Image") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Update">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="cmd_edt">Update</asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Delete">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="cmd_dlt">Delete</asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                </Columns>
                            </asp:GridView>
                        </td>
                    </tr>
                </table>
            </center>
        </div>
    </form>
</body>
</html>