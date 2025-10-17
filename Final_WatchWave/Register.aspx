<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="user_re_lo.Register" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Registration</title>
    <style>
        /* Modern Design System */
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
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #0f172a 0%, #1e293b 50%, #334155 100%);
            background-attachment: fixed;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            color: var(--text);
            line-height: 1.7;
            overflow-x: hidden;
            position: relative;
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

        /* Form container */
        center {
            width: 100%;
            max-width: 500px;
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            padding: 50px 40px;
            border-radius: 25px;
            box-shadow: var(--shadow-lg);
            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            position: relative;
            overflow: hidden;
            border: 1px solid rgba(255, 255, 255, 0.2);
            animation: fadeInUp 0.8s ease-out;
        }

        center::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 6px;
            background: var(--gradient-1);
            box-shadow: 0 0 20px rgba(99, 102, 241, 0.5);
        }

        center::after {
            content: '';
            position: absolute;
            width: 300px;
            height: 300px;
            background: radial-gradient(circle, rgba(99, 102, 241, 0.08) 0%, transparent 70%);
            border-radius: 50%;
            bottom: -150px;
            right: -150px;
            pointer-events: none;
            animation: pulse 8s ease-in-out infinite;
        }

        center:hover {
            transform: translateY(-10px);
            box-shadow: var(--shadow-lg), var(--shadow-glow);
        }

        @keyframes pulse {
            0%, 100% { transform: scale(1); opacity: 0.5; }
            50% { transform: scale(1.1); opacity: 0.8; }
        }

        /* Heading */
        h1 {
            font-size: 2.5rem;
            background: var(--gradient-1);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            font-weight: 800;
            text-align: center;
            margin-bottom: 30px;
            letter-spacing: 1px;
            position: relative;
            animation: fadeInUp 0.8s ease-out 0.2s both;
        }

        h1::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 4px;
            background: var(--gradient-1);
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(99, 102, 241, 0.4);
        }

        /* Table & input spacing */
        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0 20px;
            animation: fadeInUp 0.8s ease-out 0.4s both;
        }

        td {
            padding: 12px 15px;
            vertical-align: middle;
        }

        td:first-child {
            font-weight: 600;
            color: var(--dark);
            width: 35%;
            text-align: right;
            padding-right: 20px;
            font-size: 1rem;
        }

        /* Input fields */
        input[type="text"],
        input[type="email"],
        input[type="password"],
        .aspTextBox {
            width: 100%;
            padding: 16px 18px;
            font-size: 1rem;
            border: 2px solid rgba(99, 102, 241, 0.2);
            border-radius: 12px;
            transition: all 0.3s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            box-sizing: border-box;
            background-color: rgba(248, 250, 252, 0.8);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            position: relative;
        }

        input[type="text"]:focus,
        input[type="email"]:focus,
        input[type="password"]:focus,
        .aspTextBox:focus {
            border-color: var(--secondary);
            box-shadow: 0 0 0 3px rgba(99, 102, 241, 0.2), var(--shadow-sm);
            background-color: #fff;
            outline: none;
            transform: translateY(-2px);
        }

        /* Buttons */
        input[type="submit"],
        .aspButton {
            width: 100%;
            padding: 16px 0;
            font-size: 1.2rem;
            font-weight: 700;
            border: none;
            border-radius: 12px;
            cursor: pointer;
            background: var(--gradient-1);
            color: white;
            transition: all 0.3s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            box-shadow: 0 6px 20px rgba(99, 102, 241, 0.4);
            position: relative;
            overflow: hidden;
        }

        input[type="submit"]:hover,
        .aspButton:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 25px rgba(99, 102, 241, 0.5);
        }

        input[type="submit"]:active,
        .aspButton:active {
            transform: translateY(0);
        }

        /* Button ripple effect */
        input[type="submit"]::after,
        .aspButton::after {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            width: 0;
            height: 0;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.3);
            transform: translate(-50%, -50%);
            transition: width 0.6s, height 0.6s;
        }

        input[type="submit"]:active::after,
        .aspButton:active::after {
            width: 300px;
            height: 300px;
        }

        /* Error messages */
        .text-danger {
            color: #e74c3c;
            font-size: 0.9rem;
            font-weight: 600;
            margin-top: 8px;
            display: block;
            animation: shake 0.5s ease-in-out;
        }

        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            25% { transform: translateX(-5px); }
            75% { transform: translateX(5px); }
        }

        /* Enhanced Animations */
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

        @keyframes fadeInLeft {
            from {
                opacity: 0;
                transform: translateX(-40px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        @keyframes fadeInRight {
            from {
                opacity: 0;
                transform: translateX(40px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        /* Form row animations */
        tr {
            opacity: 0;
            animation: fadeInUp 0.6s ease-out forwards;
        }

        tr:nth-child(1) { animation-delay: 0.1s; }
        tr:nth-child(2) { animation-delay: 0.2s; }
        tr:nth-child(3) { animation-delay: 0.3s; }
        tr:nth-child(4) { animation-delay: 0.4s; }
        tr:nth-child(5) { animation-delay: 0.5s; }

        /* Success message animation */
        .success-message {
            background: var(--gradient-3);
            color: white;
            padding: 15px;
            border-radius: 12px;
            text-align: center;
            margin-top: 20px;
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

        /* Responsive */
        @media (max-width: 500px) {
            center {
                padding: 40px 25px;
                margin: 20px;
            }

            h1 {
                font-size: 2rem;
            }

            td:first-child {
                text-align: left;
                padding-right: 10px;
                width: 40%;
            }

            input[type="text"],
            input[type="email"],
            input[type="password"],
            .aspTextBox {
                padding: 14px 16px;
            }
        }

        /* Password strength indicator */
        .password-strength {
            height: 4px;
            border-radius: 2px;
            margin-top: 5px;
            transition: all 0.3s ease;
        }

        .strength-weak { background: #e74c3c; width: 25%; }
        .strength-medium { background: #f39c12; width: 50%; }
        .strength-strong { background: #2ecc71; width: 100%; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <center>
            <h1>User Registration</h1>
            <table>
                <tr>
                    <td>Username:</td>
                    <td>
                        <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvUsername" runat="server"
                            ControlToValidate="txtUsername" ErrorMessage="Username is required"
                            CssClass="text-danger" Display="Dynamic" ValidationGroup="RegForm" />
                    </td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td>
                        <asp:TextBox ID="txteml" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                            ControlToValidate="txteml" ErrorMessage="Email is required"
                            CssClass="text-danger" Display="Dynamic" ValidationGroup="RegForm" />
                        <asp:RegularExpressionValidator ID="revEmail" runat="server"
                            ControlToValidate="txteml"
                            ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$"
                            ErrorMessage="Enter email in proper format"
                            CssClass="text-danger" Display="Dynamic" ValidationGroup="RegForm" />
                    </td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server"
                            ControlToValidate="txtPassword" ErrorMessage="Password is required"
                            CssClass="text-danger" Display="Dynamic" ValidationGroup="RegForm" />
                    </td>
                </tr>
                <tr>
                    <td>Confirm Password:</td>
                    <td>
                        <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvConfirmPassword" runat="server"
                            ControlToValidate="txtConfirmPassword" ErrorMessage="Confirm password is required"
                            CssClass="text-danger" Display="Dynamic" ValidationGroup="RegForm" />
                        <asp:CompareValidator ID="CompareValidator1" runat="server"
                            ControlToValidate="txtConfirmPassword" ControlToCompare="txtPassword"
                            ErrorMessage="Passwords do not match." CssClass="text-danger"
                            Display="Dynamic" ValidationGroup="RegForm" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="Save" OnClick="Button1_Click"
                            ValidationGroup="RegForm" CssClass="aspButton" />
                    </td>
                </tr>
            </table>
        </center>
    </form>
</body>
</html>
