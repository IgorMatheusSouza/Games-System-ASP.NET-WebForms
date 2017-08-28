<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="paginasJogos.index" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="imgs/bootstrap.css" />
    <title>Pk Games</title>
    <script src="imgs/jquery-3.2.1.min.js"></script>
    <style>
        header {
            background-color: black;
            min-width: 100%;
        }

        #logo {
            width: 200px;
            display: block;
            margin: auto;
            margin-top: 10px;
        }

        #linha-vermelha {
            min-width: 103.3%;
            margin-left: -2%;
            height: 6px;
            background-color: crimson;
        }

        #aside {
            background-color: black;
            border: crimson;
            border-style: solid;
            border-width: medium;
            color: white;
        }

        #car {
            margin-top: 20px;
        }



        .main {
            margin: auto;
            display: block;
            max-width: 1180px;
        }

        .myimg {
            float: left;
            position: relative;
        }

        .txtdescricao {
            margin-top: 5px;
            float: right;
            color: black !important;
            font-size: 15px !important;
        }

        .header {
            display: block;
            margin-top: 20px;
            font-size: 35px;
        }

        .line {
            width: 100%;
            height: 2px;
            background-color: crimson;
            display: block;
            margin-top: 10px;
        }

        .smalltxt {
            margin-top: 10px;
            font-size: 14px;
        }

        .txtpreco {
            margin-top: 20px;
            font-size: 24px;
        }

        .btncompra {
            margin-top: 10px;
            font-size: 14px;
            display: block;
            padding: -30px 40px;
        }

        .line-invisible {
            width: 100%;
            height: 2px;
            display: block;
            margin-top: 2px;
        }

        #T1 {
            width: 80%;
            display: grid;
            float: left;
        }

        #Button1 {
            float: left;
            margin-left: 4px;
        }

        #divBuscar {
            margin: auto;
            display: block;
            margin-top: 50px;
        }

        .list-group-item {
            background-color: rgba(109, 17, 17, 0.56);
            color: white;
            border-color: black;
            text-align: center;
        }

        #HyperLink1 {
            color: white;
        }

        .insivible {
            display: none;
        }

        .list-group-items {
            text-decoration: none;
        }

        .list-group-item:hover {
            background-color: rgba(109, 17, 17, 0.16);
        }

        .btn-danger {
            background-color: rgb(128, 10, 10);
            border-color: rgb(128, 10, 10);
        }

        #filtrar {
            margin-bottom: 10px;
        }
        .btn-group-bg {
            background-color: rgb(128, 10, 10);
            border-color: black;
            color:white;
        }
        .btn-group-bg:hover {
            background-color: rgba(109, 17, 17, 0.56);
             color:white;
        }
        @media screen and (max-width: 760px) {

            #logo {
                width: 100%;
                max-width: 150px;
                display: block;
                margin: auto;
                margin-top: 10px;
            }

            .txtdescricao {
                font-size: 9px !important;
            }

            .header {
                margin-top: 13px;
                font-size: 14px;
            }

            .txtpreco {
                margin-top: 15px;
                font-size: 11px !important;
                margin-bottom: 35px;
            }

            .smalltxt {
                margin-top: 10px;
                font-size: 10px;
            }

            .myimg {
                width: 60%;
                display: block;
                margin-left: 20%;
            }


            #T1 {
                width: 62%;
            }

            #car, #sniper {
                margin-top: 30px;
            }
        }
    </style>
    <meta name="description" content="The description of my page" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
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
                      <button type="button" class="btn btn-group-bg">Jogos</button>
                    </div>
                    <div class="btn-group" role="group">
                      <button type="button" class="btn btn-group-bg" >Compras</button>
                    </div>
                    <div class="btn-group" role="group">
                      <a href="Insert.aspx"><button type="button" class="btn btn-group-bg">Cadastrar</button></a>
                    </div>
                    <div class="btn-group" role="group">
                      <button type="button" class="btn btn-group-bg">Relatorios</button>
                    </div>
                </div>
           </div>

        </div>
        
    </header>
    <form runat="server">
        <div class="main">


            <div id="divBuscar" class="input-group-sm col-md-6 col-sm-12 col-xs-12">

                <asp:TextBox ID="T1" class="form-control" placeholder="Digite o nome do jogo" runat="server"></asp:TextBox>
                <asp:Button ID="Button1" class="btn btn-danger" runat="server" Text="Pesquisar" OnClick="Button1_Click" />

            </div>


            <div runat="server" class="col-lg-10 col-md-10 col-sm-12 col-xs-12" id="myDiv">
            </div>

            <div runat="server" class="col-lg-2 col-md-2 col-sm-12 col-xs-12" id="aside">
                <h3>Filtrar por:</h3>
                <h4 class="text-center">Plataforma</h4>
                <ul class="list-group">

                    <li class="list-group-item" onclick="gg('pc')"> PC</li>
                    <li class="list-group-item" onclick="gg('ps3')">Ps3</li>
                    <li class="list-group-item" onclick="gg('ps4')">Ps4</li>
                    <li class="list-group-item" onclick="gg('xbox 360')">Xbox 360</li>
                    <li class="list-group-item" onclick="gg('xbox one')">Xbox one</li>
                </ul>
                <h4 class="text-center">Preço Max</h4>



                <asp:TextBox class="form-control text-danger" type="number" ID="preco" runat="server"></asp:TextBox>
                <br />
                <h4>Data lançamento</h4>
                <asp:DropDownList class="form-control text-danger" ID="select" runat="server">
                    <asp:ListItem Selected="True" Value="2">Todos</asp:ListItem>

                    <asp:ListItem Value="2017">2017</asp:ListItem>
                    <asp:ListItem Value="2016">2016</asp:ListItem>
                    <asp:ListItem Value="2015">2015</asp:ListItem>
                    <asp:ListItem Value="2014">2014</asp:ListItem>
                    <asp:ListItem Value="2013">2013</asp:ListItem>
                    <asp:ListItem Value="2012">2012</asp:ListItem>
                    <asp:ListItem Value="2011">2011</asp:ListItem>
                    <asp:ListItem Value="2010">2010</asp:ListItem>
                    <asp:ListItem Value="2009">2009</asp:ListItem>
                    <asp:ListItem Value="2008">2008</asp:ListItem>
                    
                </asp:DropDownList>
                <br />
                <asp:Button ID="filtrar" class="btn col-md-12 btn-danger" runat="server" Text="Filtrar" OnClick="filtrarjogos" />
            </div>
        </div>

        <div runat="server" class="insivible">
            <asp:Button ID="Button3" class="btn btn-danger" runat="server" Text="Pesquisar" OnClick="filtrarplat" />
            <asp:TextBox ID="inputInvisible" runat="server"></asp:TextBox>

        </div>


    </form>

    <script>

        function gg(plat) {
            $("#inputInvisible").val(plat);
            $("#Button3").click();
        }

    </script>
</body>

</html>
