<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Insert.aspx.cs" Inherits="paginasJogos.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="imgs/bootstrap.css" />
    <link rel="stylesheet" href="css/Menu.css" />
    <title>Inserir Jogos</title>
    <script src="imgs/jquery-3.2.1.min.js"></script>
    <meta name="description" content="The description of my page" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <style>
        #descricao {
            height: 130px;
        }

        #form1 {
            margin-bottom: 150px;
        }
        #cadastrarJogoArea {
           display:none;
        }
        .btn-incial {
        display:block;
        margin:auto;
        text-align:center;
        margin-top:40px;
        
        }
        @media screen and (max-width: 760px) {

            #logo {
                width: 100%;
                max-width: 150px;
                display: block;
                margin: auto;
                margin-top: 10px;
            }



            #car, #sniper {
                margin-top: 30px;
            }

            #descricao {
                height: 85px;
            }
        }
    </style>

</head>
<body>
    <header class="col-md-12 col-sm-12 col-xs-12">
      <div class="main">

            <img src="imgs/car.png" class="col-lg-3 col-md-3  col-sm-3  hidden-xs " id="car" />

          <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                <img src="imgs/logo.png" id="logo" />
          </div>

            <img src="imgs/sniper.png" class="col-lg-3  col-md-3  col-sm-3  hidden-xs" id="sniper" />
         <div id="linha-vermelha"></div>
            <div id="menu">
                <div class="btn-group btn-group-justified" role="group" aria-label="...">
                    <div class="btn-group" role="group">
                        <a href="index.aspx"><span class="btn btn-group-bg">Jogos</span></a>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-group-bg">Compras</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-group-bg">Cadastrar</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-group-bg">Relatorios</button>
                    </div>
                </div>

            </div>
        </div>
    </header>
   

    <div runat="server" id="formulario" class="main">
       

        <div class="btn-incial col-md-6">
            <div id="cadastrarj" class="btn btn-danger">Cadastrar Jogo</div>
        </div>

        <div class="btn-incial col-md-6">
            <div id="cadastrarc" class="btn btn-danger">Cadastrar Cliente</div>
        </div>


        <form id="form1" style="margin-left: 7%" runat="server">
        

       <div runat="server" id="cadastrarJogoArea">
            <div class="input-group input-group-lg">
                <h4 class="text-danger">Nome do jogo</h4>
                <asp:TextBox ID="nome" Class="form-control " runat="server"></asp:TextBox>
            </div>

            <div class="input-group input-group-lg">
                <h4 class="text-danger">Descrição</h4>
                <asp:TextBox TextMode="multiline" Class="form-control col-md-12 col-ms-12 col-xs-12" Columns="50" Rows="6" ID="descricao" runat="server"></asp:TextBox>
            </div>

            <div class="input-group input-group-lg">
                <h4 class="text-danger">Data de Lançamento</h4>
                <asp:TextBox type="date" Class="form-control col-md-4 col-ms-6 col-xs-12" ID="dtLan" runat="server"></asp:TextBox>
                <br />
            </div>

            <div class="input-group input-group-lg">
                <h4 class="text-danger">Plataforma</h4>
            </div>
            <div class="input-group input-group-lg">
                <asp:DropDownList Class="form-control col-md-2 col-sm-6 col-xs-12" ID="plataforma" runat="server">
                    <asp:ListItem Value="pc">PC</asp:ListItem>
                    <asp:ListItem Value="ps3">Ps3</asp:ListItem>
                    <asp:ListItem Value="ps4">Ps4</asp:ListItem>
                    <asp:ListItem Value="xbox 360">Xbox 360</asp:ListItem>
                    <asp:ListItem Value="xbox one">Xbox One</asp:ListItem>

                </asp:DropDownList>
            </div>
            <br />
            <div class="input-group input-group-lg">
                <h4 class="text-danger">Preço</h4>
                <asp:TextBox ID="preco" Class="form-control col-md-2 col-ms-6 col-xs-12" type="number" runat="server" default="0"></asp:TextBox>
                <br />
            </div>
            <div class="input-group input-group-lg">
                <h4 class="text-danger">Quantidade</h4>
                <asp:TextBox ID="quantidade" Class="form-control col-md-3 col-ms-6 col-xs-12" type="number" runat="server" default="0"></asp:TextBox>
            </div>
            <br />
            <div class="input-group input-group-lg">
                <h4 class="text-danger">Enviar Foto</h4>
                <asp:FileUpload ID="fotoJogo" runat="server" />
            </div>
             <br />
             <br />
            <div class="input-group input-group-lg">

                <asp:Button ID="Button1" runat="server" Class="btn btn-danger" Text="Inserir Jogo" OnClick="validacao" />
            </div>
        </div>
          
      <div runat="server" id="CadastrarClienteArea">
            <div class="input-group input-group-lg">
                <h4 class="text-danger">Nome do Cliente</h4>
                <asp:TextBox ID="cnome" Class="form-control " runat="server"></asp:TextBox>
            </div>
            
            <div class="input-group input-group-lg">
                <h4 class="text-danger">Data de Nascimento</h4>
                <asp:TextBox type="date" Class="form-control col-md-4 col-ms-6 col-xs-12" ID="dtnasc" runat="server"></asp:TextBox>
                <br />
            </div>
           
            <br />
            <div class="input-group input-group-lg">
                <h4 class="text-danger">Cpf</h4>
                <asp:TextBox ID="Cpf" Class="form-control col-md-2 col-ms-6 col-xs-12" type="number" runat="server" default="0"></asp:TextBox>
                <br />
            </div>

            <br />
            <br />
            <div class="input-group input-group-lg">

                <asp:Button ID="inserirCli" runat="server" Class="btn btn-danger" Text="Inserir Cliente" OnClick="validacaoCliente" />
            </div>
     </div>

            
        </form>
    </div>

   <script>
        $("#documnet").ready(function() {

            $("#cadastrarj").click(function(){
                $("#CadastrarClienteArea").hide(0);
                $("#cadastrarJogoArea").fadeIn(700);
            })
            $("#cadastrarc").click(function(){
                $("#cadastrarJogoArea").hide(0);
                $("#CadastrarClienteArea").fadeIn(700);
            })  
        })
  </script>
</body>
</html>
