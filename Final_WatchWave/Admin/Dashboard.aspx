<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Final_WatchWave.Admin.Dashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Dashboard</title>
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
            --success: #38a169;
            --warning: #d69e2e;
            --danger: #e53e3e;
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
            overflow-x: hidden;
            margin: 0;
            color: #2d3748;
            min-height: 100vh;
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
            padding: 30px;
            min-height: 100vh;
        }

        /* Premium Welcome Section */
        .welcome-section {
            animation: slideInUp 0.8s ease-out;
            background: rgba(255, 255, 255, 0.98);
            backdrop-filter: blur(10px);
            padding: 45px;
            border-radius: 18px;
            box-shadow: 0 8px 35px rgba(0, 0, 0, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.3);
            position: relative;
            overflow: hidden;
        }

        .welcome-section::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
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

        .welcome-section h1 {
            font-weight: 700;
            color: #2d3748;
            margin-bottom: 15px;
            font-size: 2.5rem;
        }

        .welcome-section h1 span {
            background: var(--gradient-1);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .welcome-section .lead {
            color: #718096;
            font-size: 1.15rem;
            font-weight: 400;
            line-height: 1.6;
        }

        .welcome-section hr {
            border: none;
            height: 2px;
            background: linear-gradient(90deg, transparent, #3182ce, transparent);
            margin: 35px 0;
            opacity: 0.6;
        }

        /* Enhanced Counter Cards */
        .counter-card {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 14px;
            padding: 28px 20px;
            text-align: center;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            border: 1px solid rgba(255, 255, 255, 0.4);
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.08);
            position: relative;
            overflow: hidden;
        }

        .counter-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: var(--gradient-1);
        }

        .counter-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.15);
        }

        .icon-box {
            font-size: 3rem;
            margin-bottom: 18px;
            color: #3182ce;
            display: inline-block;
            transition: all 0.3s ease;
        }

        .counter-card:hover .icon-box {
            transform: scale(1.15);
            color: #4299e1;
        }

        .counter {
            font-size: 2.2rem;
            font-weight: 700;
            color: #2d3748;
            margin-bottom: 8px;
            display: block;
        }

        .counter-card p {
            color: #718096;
            font-weight: 600;
            font-size: 0.95rem;
            margin: 0;
        }

        /* Premium Card Styling */
        .card {
            border: none;
            border-radius: 14px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.08);
            transition: all 0.3s ease;
            overflow: hidden;
            background: rgba(255, 255, 255, 0.95);
        }

        .card:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.12);
        }

        .card-header {
            background: var(--gradient-1) !important;
            border: none;
            padding: 18px;
            font-weight: 600;
            font-size: 1.05rem;
            color: white;
        }

        .card-header.bg-success {
            background: var(--gradient-2) !important;
        }

        /* Enhanced Table Styling */
        .table {
            margin-bottom: 0;
            border-collapse: separate;
            border-spacing: 0;
        }

        .table-striped tbody tr:nth-of-type(odd) {
            background-color: rgba(49, 130, 206, 0.04);
        }

        .table th {
            background: rgba(49, 130, 206, 0.08);
            border: none;
            padding: 14px;
            font-weight: 600;
            color: #2d3748;
            font-size: 0.9rem;
        }

        .table td {
            border: none;
            padding: 14px;
            vertical-align: middle;
            color: #4a5568;
            font-size: 0.9rem;
        }

        .table tbody tr {
            transition: all 0.2s ease;
        }

        .table tbody tr:hover {
            background: rgba(49, 130, 206, 0.08) !important;
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

        /* Grid Animation */
        .row > div {
            animation: fadeInUp 0.6s ease-out forwards;
        }

        .row > div:nth-child(1) { animation-delay: 0.1s; }
        .row > div:nth-child(2) { animation-delay: 0.2s; }
        .row > div:nth-child(3) { animation-delay: 0.3s; }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(15px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Responsive Design */
        @media (max-width: 991.98px) {
            .sidebar {
                width: 240px;
            }
            .main-content {
                margin-left: 240px;
                padding: 25px;
            }
        }

        @media (max-width: 767.98px) {
            .sidebar {
                position: relative;
                width: 100%;
                height: auto;
                padding: 20px 15px;
            }

            .main-content {
                margin-left: 0;
                padding: 20px 15px;
            }

            .welcome-section {
                padding: 30px 20px;
            }

            .counter-card {
                margin-bottom: 20px;
                padding: 25px 15px;
            }

            .icon-box {
                font-size: 2.5rem;
            }

            .counter {
                font-size: 1.8rem;
            }
        }

        @media (max-width: 575.98px) {
            .welcome-section h1 {
                font-size: 2rem;
            }
            
            .welcome-section .lead {
                font-size: 1rem;
            }
            
            .counter-card {
                padding: 20px 15px;
            }
        }

        /* Loading States */
        .loading {
            opacity: 0.7;
            pointer-events: none;
        }

        /* Focus States for Accessibility */
        .sidebar a:focus,
        .counter-card:focus {
            outline: 2px solid #3182ce;
            outline-offset: 2px;
        }
    </style>
</head>
<body>

    <!-- Sidebar -->
    <div class="sidebar">
        <h4>Admin Panel</h4>
        <a href="Dashboard.aspx" class="active">
            <i class="bi bi-speedometer2"></i>Dashboard
        </a>
        <a href="Add_ManageProducts.aspx">
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
        <!-- Main Content -->
        <div class="main-content">
            <div class="welcome-section text-center">
                <h1 class="mb-4">Welcome to the <span class="text-primary">WatchWave</span> Admin Dashboard</h1>
                <p class="lead">Manage watches, customers, and inventory all in one place.</p>
                <hr />

                <!-- Top Summary Counters -->
                <div class="row mt-5 justify-content-center">
                    <div class="col-6 col-md-3">
                        <div class="counter-card">
                            <div class="icon-box"><i class="bi bi-people-fill"></i></div>
                            <div class="counter">
                                <asp:Label ID="lblUsers" runat="server" Text="0"></asp:Label>
                            </div>
                            <p>Customers</p>
                        </div>
                    </div>
                    <div class="col-6 col-md-3">
                        <div class="counter-card">
                            <div class="icon-box"><i class="bi bi-watch"></i></div>
                            <div class="counter">
                                <asp:Label ID="lblProducts" runat="server" Text="0"></asp:Label>
                            </div>
                            <p>Watches</p>
                        </div>
                    </div>
                    <div class="col-6 col-md-3">
                        <div class="counter-card">
                            <div class="icon-box"><i class="bi bi-archive-fill"></i></div>
                            <div class="counter">
                                <asp:Label ID="lblStock" runat="server" Text="0"></asp:Label>
                            </div>
                            <p>Total Stock</p>
                        </div>
                    </div>
                </div>

                <hr class="my-5" />

                <!-- Recent Data -->
                <div class="row mt-4">
                    <!-- Recent Customers -->
                    <div class="col-md-6 mb-4">
                        <div class="card shadow-sm rounded-3">
                            <div class="card-header bg-primary text-white fw-bold">Recent Customers</div>
                            <div class="card-body p-0">
                                <asp:GridView ID="gvCustomers" runat="server" AutoGenerateColumns="False" CssClass="table table-striped mb-0">
                                    <Columns>
                                        <asp:BoundField DataField="Id" HeaderText="ID" />
                                        <asp:BoundField DataField="Username" HeaderText="Name" />
                                        <asp:BoundField DataField="Email" HeaderText="Email" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>

                    <!-- Recent Watches -->
                    <div class="col-md-6 mb-4">
                        <div class="card shadow-sm rounded-3">
                            <div class="card-header bg-success text-white fw-bold">Recent Watches</div>
                            <div class="card-body p-0">
                                <asp:GridView ID="gvWatches" runat="server" AutoGenerateColumns="False" CssClass="table table-striped mb-0">
                                    <Columns>
                                        <asp:BoundField DataField="Id" HeaderText="ID" />
                                        <asp:BoundField DataField="WatchName" HeaderText="Watch Name" />
                                        <asp:BoundField DataField="Brand" HeaderText="Brand" />
                                        <asp:BoundField DataField="Price" HeaderText="Price" DataFormatString="{0:C}" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </form>
    <!-- Counter Animation Script -->
    <script>
        // Animate number counters smoothly
        function animateCounter(id, endValue, duration = 1500) {
            const counter = document.getElementById(id);
            if (!counter) return;

            let startValue = 0;
            let startTime = null;

            function step(currentTime) {
                if (!startTime) startTime = currentTime;
                const progress = currentTime - startTime;
                const current = Math.min(Math.floor((progress / duration) * endValue), endValue);
                counter.innerText = current.toLocaleString();
                if (progress < duration) {
                    requestAnimationFrame(step);
                } else {
                    counter.innerText = endValue.toLocaleString();
                }
            }

            requestAnimationFrame(step);
        }

        window.onload = function () {
            const users = parseInt(document.getElementById('<%= lblUsers.ClientID %>').innerText.replace(/\D/g, '')) || 0;
            const products = parseInt(document.getElementById('<%= lblProducts.ClientID %>').innerText.replace(/\D/g, '')) || 0;
            const stock = parseInt(document.getElementById('<%= lblStock.ClientID %>').innerText.replace(/\D/g, '')) || 0;

            animateCounter('<%= lblUsers.ClientID %>', users);
            animateCounter('<%= lblProducts.ClientID %>', products);
            animateCounter('<%= lblStock.ClientID %>', stock);
        };
    </script>

</body>
</html>