using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using model;


namespace paginasJogos
{
    public partial class delete : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            conexaoBancoDataContext connect = new conexaoBancoDataContext();



            /* String text = from mat in connect.jogos
                           where mat.idjogos.Equals(2)
                           select mat.nome;
              */
            int k = (from mat in connect.jogos
                     select mat.idjogos).Count();


            for (int i = 0; i < k; i++)
            {
                jogo game = connect.jogos.First(pk => pk.idjogos == i);


                if (!!game.validacao != false)
                {
                    createElements(game, i);
                }
            }
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            conexaoBancoDataContext connect = new conexaoBancoDataContext();

            int k = (from mat in connect.jogos
                     select mat.idjogos).Count();
            myDiv.InnerHtml = "";

            for (int i = 0; i < k; i++)
            {
                jogo game = connect.jogos.First(pk => pk.idjogos == i);
                String s = T1.Text.ToLower();


                if ((game.nome.ToLower().Contains(s)) && game.validacao == true)
                {
                    createElements(game, i);
                }

            }
        }



        protected void createElements(jogo game, int i)
        {

            System.Web.UI.HtmlControls.HtmlGenericControl createDiv =
            new System.Web.UI.HtmlControls.HtmlGenericControl("div");
            createDiv.Attributes.Add("class", "line col-sm-12 col-xs-12");
            myDiv.Controls.Add(createDiv);


            Label txt = new Label();
            txt.Text = Convert.ToString(game.nome);
            txt.CssClass = "header col-md-9 text-center col-xs-8 col-sm-9";
            txt.Attributes.Add("onclick", "click(5)");
            myDiv.Controls.Add(txt);

            Label preco = new Label();
            preco.Text = "R$ " + Convert.ToString(game.preco);
            preco.CssClass = "txtpreco col-md-3 text-center text-success col-xs-4 col-sm-3";
            myDiv.Controls.Add(preco);


            Image img = new Image();
            img.CssClass = "col-md-4  col-sm-6  col-xs-12 myimg";
            img.ImageUrl = Convert.ToString(game.img);
            myDiv.Controls.Add(img);

            System.Web.UI.HtmlControls.HtmlGenericControl createh2 =
            new System.Web.UI.HtmlControls.HtmlGenericControl("p");
            createh2.Attributes.Add("class", "txtdescricao col-md-8  col-sm-6 col-xs-12 text-danger ");
            createh2.InnerText = game.descricao;
            myDiv.Controls.Add(createh2);



            System.Web.UI.HtmlControls.HtmlGenericControl creatediv1 =
            new System.Web.UI.HtmlControls.HtmlGenericControl("div");
            creatediv1.Attributes.Add("class", "line-invisible col-sm-12 col-xs-12");
            myDiv.Controls.Add(creatediv1);

            Label platform = new Label();
            platform.Text = "Plataforma: " + Convert.ToString(game.plataforma);
            platform.CssClass = "smalltxt text-danger col-md-6 pull-left col-xs-12 col-sm-6";
            myDiv.Controls.Add(platform);


            Label dt = new Label();
            dt.Text = "Data de lançamento: " + Convert.ToString(game.dtLancamentos).Substring(0, 10);
            dt.CssClass = "smalltxt text-danger col-md-6 pull-left col-xs-12 col-sm-6";
            myDiv.Controls.Add(dt);

            Label quant = new Label();
            quant.Text = "Quantidade: " + Convert.ToString(game.quantidade);
            quant.CssClass = "smalltxt text-danger col-md-3 pull-left col-xs-4 col-sm-4";
            myDiv.Controls.Add(quant);

            HyperLink btnCompra = new HyperLink();
            btnCompra.NavigateUrl = "jogoPage.aspx?id=" + i;
            btnCompra.Text = "Comprar";
            btnCompra.CssClass = "btncompra btn btn-danger col-md-12 col-xs-12 col-sm-12";
            myDiv.Controls.Add(btnCompra);


        }

    }
}