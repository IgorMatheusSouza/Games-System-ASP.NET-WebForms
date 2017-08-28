using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using model;
using System.Web.Services;
using System.Web.Script.Services;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
namespace paginasJogos
{
    public partial class jogoPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           

            conexaoBancoDataContext connect = new conexaoBancoDataContext();

            jogo cli = connect.jogos.First(pk => pk.idjogos == int.Parse(Request.QueryString["id"]));

            System.Web.UI.HtmlControls.HtmlGenericControl createDiv =
            new System.Web.UI.HtmlControls.HtmlGenericControl("div");
            createDiv.Attributes.Add("class", "line col-sm-12 col-xs-12");
            myDiv.Controls.Add(createDiv);


            Label txt = new Label();
            txt.Text = Convert.ToString(cli.nome);
            txt.CssClass = "header col-md-12 text-center col-xs-12 col-sm-12";
            txt.Attributes.Add("onclick", "click(5)");
            myDiv.Controls.Add(txt);

            Image img = new Image();
            img.CssClass = "col-md-6  col-sm-6  col-xs-12 myimg";
            img.ImageUrl = Convert.ToString(cli.img);
            myDiv.Controls.Add(img);


            System.Web.UI.HtmlControls.HtmlGenericControl createh2 =
            new System.Web.UI.HtmlControls.HtmlGenericControl("p");
            createh2.Attributes.Add("class", "txtdescricao col-md-6  col-sm-6 col-xs-12 text-danger ");
            createh2.InnerText = cli.descricao;
            myDiv.Controls.Add(createh2);

            System.Web.UI.HtmlControls.HtmlGenericControl creatediv1 =
            new System.Web.UI.HtmlControls.HtmlGenericControl("div");
            creatediv1.Attributes.Add("class", "line-invisible col-sm-12 col-xs-12");
            myDiv.Controls.Add(creatediv1);

            Label preco = new Label();
            preco.Text = "R$ " + Convert.ToString(cli.preco);
            preco.CssClass = "txtpreco col-md-3 text-center text-success col-xs-4 col-sm-4";
            myDiv.Controls.Add(preco);


           

            

            Label platform = new Label();
            platform.Text = "Plataforma: " + Convert.ToString(cli.plataforma);
            platform.CssClass = "smalltxt text-danger col-md-3 pull-left col-xs-4 col-sm-4";
            myDiv.Controls.Add(platform);

            Label dt = new Label();
            dt.Text = "Data de lançamento: " + Convert.ToString(cli.dtLancamentos);
            dt.CssClass = "smalltxt text-danger col-md-3 pull-left col-xs-4 col-sm-4";
            myDiv.Controls.Add(dt);

            Label quant = new Label();
            quant.Text = "Quantidade: " + Convert.ToString(cli.quantidade);
            quant.CssClass = "smalltxt text-danger col-md-3 pull-left col-xs-4 col-sm-4";
            myDiv.Controls.Add(quant);

            
        }
        [WebMethod]
        [ScriptMethod]

        public static string BuscaCliente(string Codigo)
        {
            conexaoBancoDataContext connect = new conexaoBancoDataContext();
            int k = (from mat in connect.clientes
                     select mat.idclientes).Count();

            ArrayList nomes = new ArrayList();
            String nomesJs = "";
            for (int i = 2; i < k + 2; i++)
            {
                cliente cliente = connect.clientes.First(p => p.idclientes == i);
                if (cliente.nome.ToLower().Contains(Codigo.ToLower()))
                {
                    nomes.Add(cliente.nome + "~~");
                }

            }
            if (nomes.Count > 0)
            {
                for (int i = 0; i < nomes.Count; i++)
                {
                    nomesJs += nomes[i];
                }
                return nomesJs;
            }
            else
            {
                return "nada";
            }
        }

        [WebMethod]
        [ScriptMethod]

        public static string cpf(string Codigo)
        {
            conexaoBancoDataContext connect = new conexaoBancoDataContext();
            int k = (from mat in connect.clientes
                     select mat.idclientes).Count();
            String cpf = "";
            for (int i = 2; i < k + 2; i++)
            {
                cliente cliente = connect.clientes.First(p => p.idclientes == i);
                if (cliente.nome.ToLower().Equals(Codigo.ToLower()))
                {
                    cpf = Convert.ToString(cliente.cpf);
                    break;
                }

            }
            if (cpf != "")
            {
                return cpf;
            }
            else
            {
                return "Sem registros";
            }

        }

        protected void ButtonFinalizar_Click(object sender, EventArgs e)
        {
            conexaoBancoDataContext connect = new conexaoBancoDataContext();

            jogo game = connect.jogos.First(pk => pk.idjogos == int.Parse(Request.QueryString["id"]));

            cliente cli = connect.clientes.First(pk => pk.nome == nomeCliente.Text.Trim());

            compra compra = new compra();

            if (Convert.ToInt32(quantHide.Text) <= game.quantidade)
            {   
                float valorCompra = Convert.ToInt64(game.preco * Convert.ToInt32(quantHide.Text)); 

                Label compraTxt = new Label();
                compraTxt.Text = "A compra do cliente " + nomeCliente.Text + " foi cadastrada com o de R$ " + valorCompra;
                compraTxt.CssClass = "text-success finaltxt col-md-12  col-xs-12 col-sm-12";
                divFinal.Controls.Add(compraTxt);

                game.quantidade -= Convert.ToInt32(quantHide.Text);
                cli.valorGasto += valorCompra;
                connect.SubmitChanges();
                //--------------------------------------------------//
                compra.clientes_idclientes = cli.idclientes;
                compra.jogos_idjogos = game.idjogos;
                compra.valor = valorCompra;
                compra.dtCompra = Convert.ToDateTime(System.DateTime.Now.ToShortDateString());
                compra.quantidade = Convert.ToInt32(quantHide.Text);
                connect.compras.InsertOnSubmit(compra);
                connect.SubmitChanges();
                connect.Dispose();


            }

            else {

                Label compraTxt = new Label();
                compraTxt.Text = "deu merda"+ game.nome+ game.quantidade;
                compraTxt.CssClass = "finaltxt text-danger col-md-12  col-xs-12 col-sm-12";
                divFinal.Controls.Add(compraTxt);
            
            }



        }
        
    }   
}