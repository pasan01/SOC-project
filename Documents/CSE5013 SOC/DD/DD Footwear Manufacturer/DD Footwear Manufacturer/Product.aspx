<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="DD_Footwear_Manufacturer.Product" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        /* Add your CSS styles here */

        /* Style for the entire body */
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
        }

        /* Style for the form container */
        .form-container {
            background-color: #fff;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin: 20px;
        }

        /* Style for labels and textboxes */
        .label, .input-text {
            display: block;
            margin-bottom: 10px;
        }

        /* Style for buttons */
        .btn {
            background-color: #007bff;
            color: #fff;
            padding: 5px 10px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }

        .btn-danger {
            background-color: #dc3545;
        }

        /* Style for the success message label */
        .success-message {
            color: green;
            font-weight: bold;
        }

        /* Style for the error message label */
        .error-message {
            color: red;
            font-weight: bold;
        }

        /* Style for the table (GridView) */
        .table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .table th, .table td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        .table th {
            background-color: #007bff;
            color: #fff;
        }

        /* Style for the View link button */
        .view-link {
            background-color: #007bff;
            color: #fff;
            padding: 5px 10px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:HiddenField ID="hfProductId" runat="server" />

            <table>

                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="ProductName" CssClass="label"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtProductName" runat="server" CssClass="input-text"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="ProductColor" CssClass="label"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtProductColor" runat="server" CssClass="input-text"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="ProductPrice" CssClass="label"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtProductPrice" runat="server" CssClass="input-text"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="ProductQuantity" CssClass="label"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtProductQuantity" runat="server" CssClass="input-text"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>
                       
                    </td>
                    <td colspan="2">
                        <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn" OnClick="btnSave_Click" />
                        <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn" OnClick="btnDelete_Click" />
                        <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn" OnClick="btnClear_Click" />
                    </td>
                </tr>

                <tr>
                    <td>
                       
                    </td>
                    <td colspan="2">
                        <asp:Label ID="lblSuccessMessage" runat="server" Text="" CssClass="success-message" ForeColor="Green"></asp:Label>
                    </td>
                </tr>

                <tr>
                    <td>
                       
                    </td>
                    <td colspan="2">
                        <asp:Label ID="lblErrorMessage" runat="server" Text="" CssClass="error-message" ForeColor="Red"></asp:Label>
                    </td>
                </tr>

            </table>
            <br />

            <asp:GridView ID="gvProduct" runat="server" CssClass="table" AutoGenerateColumns="false">

                <Columns>
                    <asp:BoundField DataField="ProductName" HeaderText="ProductName" />
                    <asp:BoundField DataField="ProductColor" HeaderText="ProductColor" />
                    <asp:BoundField DataField="ProductPrice" HeaderText="ProductPrice" />
                    <asp:BoundField DataField="ProductQuantity" HeaderText="ProductQuantity" />

                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkView" runat="server" CommandArgument='<%# Eval("ProductId") %>' OnClick="lnk_OnClick" CssClass="view-link">View</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>

            </asp:GridView>

        </div>
    </form>
</body>
</html>
