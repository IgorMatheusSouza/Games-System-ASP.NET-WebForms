using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using model;

namespace paginasJogos
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


        }

        protected void insertjogo() {
            conexaoBancoDataContext connect = new conexaoBancoDataContext();
            jogo game = new jogo();
            game.nome = Convert.ToString(nome.Text.Trim());
            game.descricao = Convert.ToString(descricao.Text.Trim());
            game.dtLancamentos = Convert.ToDateTime(dtLan.Text);
            game.plataforma = Convert.ToString(plataforma.Text);
            game.preco = Convert.ToInt64(preco.Text);
            game.quantidade = Convert.ToInt32(quantidade.Text);
            game.img = Convert.ToString("imgs/" + fotoJogo.FileName);
            game.validacao = true;
            connect.jogos.InsertOnSubmit(game);
            connect.SubmitChanges();
            connect.Dispose();

            Response.Redirect("index.aspx");
        
        }

        protected void validacao(object sender, EventArgs e)
        {


            if (fotoJogo.HasFile)
            {
                String extensao = System.IO.Path.GetExtension(fotoJogo.FileName);
                if (extensao == ".jpeg" || extensao == ".jpg" || extensao == ".png" ||
                    extensao == ".JPEG" || extensao == ".JPG" || extensao == ".PNG")
                {
                    String caminho = Server.MapPath("imgs/");
                    String srcFoto = caminho + fotoJogo.FileName;
                    fotoJogo.SaveAs(srcFoto);

                }
                else
                {
                    Label erro = new Label();
                    erro.Text = "Extensão de arquivo inválido";
                    erro.CssClass = "smalltxt text-danger col-md-6 pull-left col-xs-12 col-sm-6";
                    formulario.Controls.Add(erro);
                    return;
                }
            }
            else
            {
                Label erro = new Label();
                erro.Text = "Esqueceu de Enviar a foto do jogo";
                erro.CssClass = "text-danger col-md-6 pull-left col-xs-12 col-sm-6";
                formulario.Controls.Add(erro);
                return;

            }
            if (Convert.ToInt32(quantidade.Text) <= 0)
            {
                Label erro = new Label();
                erro.Text = "Quantidade invalida";
                erro.CssClass = "smalltxt text-danger col-md-6 pull-left col-xs-12 col-sm-6";
                formulario.Controls.Add(erro);
                return;

            }
            if (Convert.ToInt64(preco.Text) <= 0)
            {
                Label erro = new Label();
                erro.Text = "Preço invalido";
                erro.CssClass = "smalltxt text-danger col-md-6 pull-left col-xs-12 col-sm-6";
                formulario.Controls.Add(erro);
                return;

            }
            if (nome.Text == "" || descricao.Text=="")
            {
                Label erro = new Label();
                erro.Text = "Campo de texto Vazio";
                erro.CssClass = "smalltxt text-danger col-md-6 pull-left col-xs-12 col-sm-6";
                formulario.Controls.Add(erro);
                return;

            }
            

            insertjogo();
        

            
        }

        protected void cadastraJogo()
        {
            conexaoBancoDataContext connect = new conexaoBancoDataContext();

            cliente cli = new cliente();
            cli.nome = Convert.ToString(cnome.Text.Trim());
            cli.dtNascimento = Convert.ToDateTime(dtnasc.Text);
            cli.cpf = Convert.ToInt64(Cpf.Text);
            cli.valorGasto = 0;
            connect.clientes.InsertOnSubmit(cli);
            connect.SubmitChanges();
            connect.Dispose();

            Response.Redirect("index.aspx");
            
        }

        protected void validacaoCliente(object sender, EventArgs e)
        {
            if (cnome.Text == "" || Cpf.Text.Length < 6 || dtnasc.Text.Length < 7)
            {
                Label erro = new Label();
                erro.Text = "Campos preenchidos incorretamente.";
                erro.CssClass = "smalltxt text-danger col-md-6 pull-left col-xs-12 col-sm-6";
                formulario.Controls.Add(erro);
                return;

            }
            else {
                cadastraJogo();
            }

        
        }
    }
}