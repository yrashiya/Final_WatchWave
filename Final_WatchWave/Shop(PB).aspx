<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Shop(PB).aspx.cs" Inherits="Final_WatchWave.Shop_PB_" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>⌚ Watch Shop</title>
    <style>
        /* Product card styling */
        .product-card {
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.08);
            transition: 0.3s;
            padding: 1rem;
            text-align: center;
            width: 250px;
        }

            .product-card:hover {
                transform: translateY(-8px);
            }

        .product-image img {
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-radius: 8px;
            margin-bottom: 10px;
        }

        .product-name {
            font-size: 1.1rem;
            font-weight: bold;
            margin-bottom: .5rem;
        }

        .product-price {
            font-size: 1rem;
            font-weight: 700;
            color: #2c3e50;
            margin: .5rem 0;
        }

        /* Buttons */
        .btn {
            display: inline-block;
            padding: .5rem 1rem;
            margin: .3rem;
            border-radius: 8px;
            border: none;
            cursor: pointer;
            font-size: 0.9rem;
            font-weight: 600;
        }

        .btn-cart {
            background: #28a745;
            color: #fff;
        }

            .btn-cart:hover {
                background: #218838;
            }

        .btn-detail {
            background: #007bff;
            color: #fff;
        }

            .btn-detail:hover {
                background: #0056b3;
            }

        /* DataList container */
        .datalist-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
            margin-top: 20px;
        }

        /* Pagination */
        .pagination-nav {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin-top: 25px;
        }

        .page-btn {
            padding: .5rem 1.2rem;
            border-radius: 20px;
            background: #0072ff;
            color: #fff;
            text-decoration: none;
        }

            .page-btn:hover {
                background: #0056b3;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <!-- ✅ Welcome Label (only once) -->
                <div class="col-12 text-center mb-3">
                    <asp:Label ID="lbl3" runat="server" CssClass="text-primary" />
                </div>

                <div class="col-12 text-center mb-5">
                    <h2>⌚ Our Watches</h2>
                </div>
            </div>

            <!-- DataList for Watches -->
            <div class="datalist-container">
                <asp:DataList ID="DataList1" runat="server" RepeatDirection="Horizontal" CellSpacing="30" >
                    <%--OnItemCommand="DataList1_ItemCommand"--%>
                    <ItemTemplate>
                        <div class="product-card">
                            <div class="product-image">
                                <asp:Image ID="imgWatch" runat="server" ImageUrl='<%# Eval("Image") %>' />
                            </div>
                            <h3 class="product-name"><%# Eval("WatchName") %></h3>
                            <div class="product-price">₹ <%# Eval("Price","{0:0.00}") %></div>

                            <asp:Button ID="btnAddToCart" runat="server" Text="🛒 Add to Cart" CssClass="btn btn-cart"
                                OnClientClick='<%# "redirectAddToCart(" + Eval("Id") + "); return false;" %>' />

                            <asp:Button ID="btnViewDetail" runat="server" Text="🔍 View Details" CssClass="btn btn-detail"
                                OnClientClick='<%# "redirectViewDetail(" + Eval("Id") + "); return false;" %>' />


                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </div>

            <!-- Pagination -->
            <div class="pagination-nav">
                <asp:LinkButton ID="btnPrev" runat="server" CssClass="page-btn" OnClick="btnPrev_Click">Previous</asp:LinkButton>
                <asp:LinkButton ID="btnNext" runat="server" CssClass="page-btn" OnClick="btnNext_Click">Next</asp:LinkButton>
            </div>
        </div>
    </form>
    <script type="text/javascript">
        function redirectAddToCart(id) {
            window.location.href = 'AddToCart.aspx?pid=' + id;
        }

        function redirectViewDetail(id) {
            window.location.href = 'ViewDetail.aspx?id=' + id;
        }
    </script>


</body>
</html>
