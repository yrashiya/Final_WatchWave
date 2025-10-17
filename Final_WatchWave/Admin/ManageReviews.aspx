<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageReviews.aspx.cs" Inherits="Final_WatchWave.Admin.ManageReviews" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Reviews - Admin Panel</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
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
        .main-content {
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

        /* Enhanced Container */
        .container {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.15);
            border: 1px solid rgba(255, 255, 255, 0.3);
            position: relative;
            overflow: hidden;
        }

        .container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 5px;
            background: var(--gradient-1);
        }

        /* Enhanced Header Styling */
        h2 {
            font-weight: 700;
            color: #2d3748;
            margin-bottom: 30px;
            font-size: 2.5rem;
            animation: fadeInUp 0.8s ease-out 0.2s both;
            text-align: center;
        }

        h2 span {
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

        /* Premium Table Styling */
        .table {
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            background: white;
            animation: fadeInUp 0.8s ease-out 0.4s both;
            margin-top: 20px;
        }

        .table th {
            background: var(--gradient-1);
            color: white;
            text-align: center;
            padding: 18px 15px;
            font-weight: 600;
            font-size: 16px;
            border: none;
            position: relative;
        }

        .table th::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            height: 2px;
            background: rgba(255, 255, 255, 0.3);
        }

        .table td {
            vertical-align: middle;
            text-align: center;
            font-size: 15px;
            padding: 16px 15px;
            border-bottom: 1px solid #e2e8f0;
            color: #4a5568;
            transition: all 0.3s ease;
        }

        .table-striped tbody tr:nth-of-type(odd) {
            background-color: #f8fafc;
        }

        .table tbody tr:hover {
            background-color: rgba(49, 130, 206, 0.08);
            transform: scale(1.01);
        }

        /* Enhanced Button Styling */
        .btn {
            padding: 8px 20px;
            font-size: 14px;
            border-radius: 12px;
            font-weight: 600;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            position: relative;
            overflow: hidden;
            border: none;
        }

        .btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.3), transparent);
            transition: left 0.5s;
        }

        .btn:hover::before {
            left: 100%;
        }

        .btn-danger {
            background: linear-gradient(135deg, #e53e3e 0%, #c53030 100%);
            box-shadow: 0 4px 15px rgba(229, 62, 62, 0.4);
        }

        .btn-danger:hover {
            background: linear-gradient(135deg, #c53030 0%, #9b2c2c 100%);
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(229, 62, 62, 0.6);
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
            
            .main-content {
                margin-left: 0;
                padding: 30px 20px;
            }
        }

        @media (max-width: 768px) {
            .main-content {
                padding: 25px 15px;
            }
            
            .container {
                padding: 30px 20px;
            }
            
            h2 {
                font-size: 2rem;
            }
            
            .table {
                font-size: 14px;
            }
            
            .table th,
            .table td {
                padding: 12px 8px;
            }
            
            .btn {
                padding: 6px 15px;
                font-size: 13px;
            }
        }

        @media (max-width: 480px) {
            h2 {
                font-size: 1.8rem;
            }
            
            .container {
                padding: 20px 15px;
            }
            
            .table {
                display: block;
                overflow-x: auto;
            }
            
            .main-content {
                padding: 20px 10px;
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

        /* Empty State Styling */
        .empty-state {
            text-align: center;
            padding: 60px 20px;
            color: #718096;
        }

        .empty-state i {
            font-size: 4rem;
            margin-bottom: 20px;
            opacity: 0.5;
        }

        .empty-state h3 {
            font-size: 1.5rem;
            margin-bottom: 10px;
            color: #4a5568;
        }
    </style>
</head>
<body>
    <!-- Updated Sidebar to Match Dashboard -->
    <div class="sidebar">
        <h4>Admin Panel</h4>
        <a href="Dashboard.aspx">
            <i class="bi bi-speedometer2"></i>Dashboard
        </a>
        <a href="Add_ManageProducts.aspx">
            <i class="bi bi-plus-circle"></i>Add & Manage Product
        </a>
        <a href="ManageUsers.aspx">
            <i class="bi bi-people"></i>Manage Users
        </a>
        <a href="ManageReviews.aspx" class="active">
            <i class="bi bi-chat-left-text"></i>Manage Reviews
        </a>
        <a href="AdminLogout.aspx">
            <i class="bi bi-box-arrow-right"></i>Logout
        </a>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <form id="form1" runat="server">
            <div class="container">
                <!-- Updated Header to Match Dashboard -->
                <h2>📋 Manage <span>Customer Reviews</span></h2>
                <asp:GridView ID="gvReviews" runat="server" CssClass="table table-bordered table-striped"
                    AutoGenerateColumns="False" DataKeyNames="ReviewId" OnRowDeleting="gvReviews_RowDeleting">
                    <Columns>
                        <asp:BoundField DataField="ReviewId" HeaderText="ID" ReadOnly="True" />
                        <asp:BoundField DataField="Name" HeaderText="Name" />
                        <asp:BoundField DataField="ReviewText" HeaderText="Review" />
                        <asp:CommandField ShowDeleteButton="True" HeaderText="Actions"
                            DeleteText='<span class="btn btn-danger btn-sm"><i class="bi bi-trash"></i> Delete</span>' />
                    </Columns>
                </asp:GridView>
            </div>
        </form>
    </div>
</body>
</html>