using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DD_Footwear_Manufacturer
{
    public partial class Product : System.Web.UI.Page
    {
        SqlConnection sqlCon = new SqlConnection("Data Source=DESKTOP-M4RRMNB\\SQLEXPRESS;Initial Catalog=ASPCRUD;Integrated Security=True;");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                btnDelete.Enabled = false;
                FillGridView();
            }
            
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            Clear();
        }

        public void Clear()
        {
            hfProductId.Value = "";
            txtProductName.Text = txtProductColor.Text = txtProductPrice.Text = txtProductQuantity.Text = "";
            lblSuccessMessage.Text = lblErrorMessage.Text = "";
            btnSave.Text = "Save";
            btnDelete.Enabled = false;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if(sqlCon.State == ConnectionState.Closed)
                sqlCon.Open();
            SqlCommand sqlCmd = new SqlCommand("ProductCreateOrUpdate",sqlCon);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.AddWithValue("@ProductId", (hfProductId.Value == "" ? 0:Convert.ToInt32(hfProductId.Value)));
            sqlCmd.Parameters.AddWithValue("@ProductName", txtProductName.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@ProductColor", txtProductColor.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@ProductPrice", txtProductPrice.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@ProductQuantity", txtProductQuantity.Text.Trim());
            sqlCmd.ExecuteNonQuery();
            sqlCon.Close();
            String ProductId = hfProductId.Value;
            Clear();
            if (ProductId == "")
                lblSuccessMessage.Text = "Saved Successfully";
            else
                lblSuccessMessage.Text = "Updated Successfully";
            FillGridView();
        }

        void FillGridView()
        {
            if (sqlCon.State == ConnectionState.Closed)
                sqlCon.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("ProductViewAll", sqlCon);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dtbl = new DataTable();
            sqlDa.Fill(dtbl);
            sqlCon.Close();
            gvProduct.DataSource = dtbl;
            gvProduct.DataBind();
        }

        protected void lnk_OnClick(object sender, EventArgs e)
        {
            int productId = Convert.ToInt32((sender as LinkButton).CommandArgument);
            if (sqlCon.State == ConnectionState.Closed)
                sqlCon.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("ProductViewById", sqlCon);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlDa.SelectCommand.Parameters.AddWithValue("@ProductId", productId);
            DataTable dtbl = new DataTable();
            sqlDa.Fill(dtbl);
            sqlCon.Close();
            hfProductId.Value = productId.ToString();
            txtProductName.Text = dtbl.Rows[0]["ProductName"].ToString();
            txtProductColor.Text = dtbl.Rows[0]["ProductColor"].ToString();
            txtProductPrice.Text = dtbl.Rows[0]["ProductPrice"].ToString();
            txtProductQuantity.Text = dtbl.Rows[0]["ProductQuantity"].ToString();
            btnSave.Text = "Update";
            btnDelete.Enabled = true;
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (sqlCon.State == ConnectionState.Closed)
                sqlCon.Open();
            SqlCommand sqlCmd = new SqlCommand("ProductDeleteById", sqlCon);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.AddWithValue("@ProductId", Convert.ToInt32(hfProductId.Value));
            sqlCmd.ExecuteNonQuery();
            sqlCon.Close();
            Clear();
            FillGridView();
            lblSuccessMessage.Text = "Deleted Successfully";

        }
    }
}