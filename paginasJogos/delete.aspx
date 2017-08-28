<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="delete.aspx.cs" Inherits="paginasJogos.delete" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="imgs/bootstrap.css" />
    <script src="imgs/jquery-3.2.1.min.js"></script>
    <style>
        header {
            background-color: black;
            min-width: 100%;
        }

        #logo {
            width: 150px;
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
            height: 400px;
            background-color: black;
            border: crimson;
            border-style: solid;
            border-width: medium;
            color: white;
        }

        #car {
            margin-top: 20px;
        }


        #myDiv {
            margin-left: 8px;
        }

        .myimg {
            float: left;
            position: relative;
        }

        .txtdescricao {
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

        .line-invisible {
            width: 100%;
            height: 2px;
            display: block;
            margin-top: 2px;
        }
        #form1 {
        margin-bottom:150px;
        }
        @media screen and (max-width: 640px) {
            .txtdescricao {
                font-size: 9px !important;
            }

            .header {
                margin-top: 13px;
                font-size: 16px;
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

            #myDiv {
                margin-left: 0;
            }

            .myimg {
                float: left;
                position: relative;
            }
        }
    </style>
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
                      <button type="button" class="btn btn-group-bg">Compras</button>
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
            <div id="divBuscar" class="input-group-sm col-md-6 col-sm-12 col-xs-12" runat="server">

                <asp:TextBox ID="T1" class="form-control" placeholder="Digite o nome do jogo" runat="server"></asp:TextBox>
                <asp:Button ID="Button1" class="btn btn-danger" runat="server" Text="Pesquisar" OnClick="Button1_Click" />
                
            </div>


            <div runat="server" class="col-lg-10 col-md-10 col-sm-12 col-xs-12" id="myDiv">
            </div>

        </form>

</body>
</html>
