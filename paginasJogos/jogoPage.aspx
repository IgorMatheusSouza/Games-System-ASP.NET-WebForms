<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="jogoPage.aspx.cs" Inherits="paginasJogos.jogoPage" %>

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
            color: white;
        }

            .btn-group-bg:hover {
                background-color: rgba(109, 17, 17, 0.56);
                color: white;
            }

        #form1 {
            margin-bottom: 150px;
        }

        .main {
            margin: auto;
            display: block;
            max-width: 1180px;
        }

        #nomeCliente , #quantHide{
            display: none;
        }
        .finaltxt {
        font-size:medium;
        text-align:center;

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
                        <a href="Insert.aspx">
                            <button type="button" class="btn btn-group-bg">Cadastrar</button></a>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-group-bg">Relatorios</button>
                    </div>
                </div>
            </div>

        </div>

    </header>




    <form id="form1" runat="server">






        <div class="container">
            <div runat="server" class="col-lg-10 col-md-10 col-sm-12 col-xs-12" id="myDiv">
            </div>
            <div id="form" class="col-lg-10 col-md-10 col-sm-12 col-xs-12">
                <div class="col-md-11">                   
                <h4>Nome</h4>
                    <input id="nome" list="listAjuda" class="form-control" onkeyup="Buscar()" onblur="buscarCpf()" autocomplete="off" type="text" />
                    <asp:TextBox ID="nomeCliente" runat="server"></asp:TextBox>
                
                <datalist id="listAjuda">
                    <option class="opt" value=""></option>
                    <option class="opt" value=""></option>
                    <option class="opt" value=""></option>
                    <option class="opt" value=""></option>
                    <option class="opt" value=""></option>
                </datalist>
                </div>

                <div class="col-md-2">
                <h4>Quantidade</h4>
                    <input id="qntd" type="number" class="form-control" onblur="verifyQuant()" min="1" max="20" value="1" />
                    <asp:TextBox ID="quantHide" type="number" runat="server"></asp:TextBox>
                </div>
                
                <div class="col-md-5">
                <h4>Cpf</h4>
                <input id="desc" class="form-control" type="text" readonly="true" />
                </div>
                
                
                <div class="col-md-12" style="margin-top:25px">
                <asp:Button ID="ButtonFinalizar" class="btn btn-danger" Text="Finalizar compra" runat="server" OnClick="ButtonFinalizar_Click" />

                <a href="Insert.aspx" target="_blank">
                    <h4 class="text-warning">Caso o cliente não possua cadastro clique aqui</h4>
                </a>
          </div>
    </div>
        


        <div id="divFinal" runat="server">
            </div>

    </form>
    <script>
        function Buscar() {

            $.ajax({
                type: "POST",
                url: "jogoPage.aspx/BuscaCliente",
                data: "{Codigo: '" + $("#nome").val() + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (resposta) {

                    var x = resposta.d + "";
                    var nomesData = x.split("~~");

                    var options = document.getElementsByClassName("opt");

                    for (var i = 0; i < options.length; i++) {

                        options[i].value = nomesData[i];

                    }
                }
            })

        }
        function buscarCpf() {

            $.ajax({
                type: "POST",
                url: "jogoPage.aspx/cpf",
                data: "{Codigo: '" + $("#nome").val() + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (resp) {

                    $("#desc").val(resp.d);

                }
            })

            $("#nomeCliente").val($("#nome").val());
            $("#quantHide").val($("#qntd").val());
        }

        function verifyQuant() {

            if ($("#qntd").val() > 20) {
                alert("Quantidade inválida");
                $("#qntd").val(1);
            }
        }
   </script>
</body>
</html>
