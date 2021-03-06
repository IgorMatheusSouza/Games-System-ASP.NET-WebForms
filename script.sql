USE [master]
GO
/****** Object:  Database [sistemaJogos]    Script Date: 27/08/2017 19:47:02 ******/
CREATE DATABASE [sistemaJogos]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'sistemaJogos', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\sistemaJogos.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'sistemaJogos_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\sistemaJogos_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [sistemaJogos] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [sistemaJogos].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [sistemaJogos] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [sistemaJogos] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [sistemaJogos] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [sistemaJogos] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [sistemaJogos] SET ARITHABORT OFF 
GO
ALTER DATABASE [sistemaJogos] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [sistemaJogos] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [sistemaJogos] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [sistemaJogos] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [sistemaJogos] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [sistemaJogos] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [sistemaJogos] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [sistemaJogos] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [sistemaJogos] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [sistemaJogos] SET  ENABLE_BROKER 
GO
ALTER DATABASE [sistemaJogos] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [sistemaJogos] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [sistemaJogos] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [sistemaJogos] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [sistemaJogos] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [sistemaJogos] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [sistemaJogos] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [sistemaJogos] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [sistemaJogos] SET  MULTI_USER 
GO
ALTER DATABASE [sistemaJogos] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [sistemaJogos] SET DB_CHAINING OFF 
GO
ALTER DATABASE [sistemaJogos] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [sistemaJogos] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [sistemaJogos] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [sistemaJogos] SET QUERY_STORE = OFF
GO
USE [sistemaJogos]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [sistemaJogos]
GO
/****** Object:  Table [dbo].[clientes]    Script Date: 27/08/2017 19:47:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clientes](
	[idclientes] [int] IDENTITY(0,1) NOT NULL,
	[nome] [varchar](255) NOT NULL,
	[dtNascimento] [datetime] NOT NULL,
	[cpf] [bigint] NULL,
	[valorGasto] [real] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idclientes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[compra]    Script Date: 27/08/2017 19:47:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[compra](
	[idCompra] [int] IDENTITY(1,1) NOT NULL,
	[jogos_idjogos] [int] NOT NULL,
	[clientes_idclientes] [int] NOT NULL,
	[dtCompra] [datetime] NULL,
	[quantidade] [int] NULL,
	[valor] [real] NULL,
PRIMARY KEY CLUSTERED 
(
	[idCompra] ASC,
	[jogos_idjogos] ASC,
	[clientes_idclientes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[jogos]    Script Date: 27/08/2017 19:47:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[jogos](
	[idjogos] [int] IDENTITY(0,1) NOT NULL,
	[nome] [varchar](255) NULL,
	[descricao] [text] NULL,
	[img] [varchar](1000) NULL,
	[dtLancamentos] [date] NULL,
	[plataforma] [varchar](50) NULL,
	[preco] [real] NULL,
	[validacao] [bit] NULL,
	[quantidade] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idjogos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[clientes] ON 

INSERT [dbo].[clientes] ([idclientes], [nome], [dtNascimento], [cpf], [valorGasto]) VALUES (2, N'Igor Matheus de Souza', CAST(N'1996-11-14T00:00:00.000' AS DateTime), 18664170716, 430)
INSERT [dbo].[clientes] ([idclientes], [nome], [dtNascimento], [cpf], [valorGasto]) VALUES (3, N'Matheus de Souza', CAST(N'1905-05-27T00:00:00.000' AS DateTime), 58544171265, 400)
INSERT [dbo].[clientes] ([idclientes], [nome], [dtNascimento], [cpf], [valorGasto]) VALUES (4, N'Tiago Carvalho', CAST(N'1905-05-27T00:00:00.000' AS DateTime), 885441712144, 630)
INSERT [dbo].[clientes] ([idclientes], [nome], [dtNascimento], [cpf], [valorGasto]) VALUES (5, N'José Natalino de Souza', CAST(N'1960-12-25T00:00:00.000' AS DateTime), 152474152262, 225)
INSERT [dbo].[clientes] ([idclientes], [nome], [dtNascimento], [cpf], [valorGasto]) VALUES (6, N'Renan Lisboa Cordeiro', CAST(N'1999-06-13T00:00:00.000' AS DateTime), 19816512436, 458)
INSERT [dbo].[clientes] ([idclientes], [nome], [dtNascimento], [cpf], [valorGasto]) VALUES (7, N'Pedro Andrade Silva', CAST(N'2000-08-01T00:00:00.000' AS DateTime), 10236215896, 0)
INSERT [dbo].[clientes] ([idclientes], [nome], [dtNascimento], [cpf], [valorGasto]) VALUES (8, N'Patrick de Souza', CAST(N'1998-08-06T00:00:00.000' AS DateTime), 18314726536, 0)
INSERT [dbo].[clientes] ([idclientes], [nome], [dtNascimento], [cpf], [valorGasto]) VALUES (9, N'Carlos Antonio', CAST(N'1992-05-06T00:00:00.000' AS DateTime), 15741475212, 298)
SET IDENTITY_INSERT [dbo].[clientes] OFF
SET IDENTITY_INSERT [dbo].[compra] ON 

INSERT [dbo].[compra] ([idCompra], [jogos_idjogos], [clientes_idclientes], [dtCompra], [quantidade], [valor]) VALUES (1, 4, 5, CAST(N'2017-08-20T00:00:00.000' AS DateTime), 2, 150)
INSERT [dbo].[compra] ([idCompra], [jogos_idjogos], [clientes_idclientes], [dtCompra], [quantidade], [valor]) VALUES (5, 3, 6, CAST(N'2017-08-20T00:00:00.000' AS DateTime), 3, 458)
INSERT [dbo].[compra] ([idCompra], [jogos_idjogos], [clientes_idclientes], [dtCompra], [quantidade], [valor]) VALUES (6, 4, 5, CAST(N'2017-08-20T00:00:00.000' AS DateTime), 1, 75)
INSERT [dbo].[compra] ([idCompra], [jogos_idjogos], [clientes_idclientes], [dtCompra], [quantidade], [valor]) VALUES (7, 5, 2, CAST(N'2017-08-20T00:00:00.000' AS DateTime), 1, 80)
INSERT [dbo].[compra] ([idCompra], [jogos_idjogos], [clientes_idclientes], [dtCompra], [quantidade], [valor]) VALUES (9, 2, 9, CAST(N'2017-08-20T00:00:00.000' AS DateTime), 1, 18)
SET IDENTITY_INSERT [dbo].[compra] OFF
SET IDENTITY_INSERT [dbo].[jogos] ON 

INSERT [dbo].[jogos] ([idjogos], [nome], [descricao], [img], [dtLancamentos], [plataforma], [preco], [validacao], [quantidade]) VALUES (0, N'Assassins Creed Rogue', N'Em Assassins Creed Rogue, você controlará Shay Cormac, um assassino que se desilude com a sua ordem e se torna um templário. Nessa edição, o foco é mostrar os inimigos a partir de um novo ângulo. Para isso, todo o aparato técnico de Black Flag foi usado, o que garantiu uma recauchutada em poucos cenários, além de vender o título como se fosse um game novo. Por conta disso, até as fontes das letras do menu são as mesmas do jogo anterior.  A história    Em teoria, o principal componente é a história, que finalmente mostra os templários de forma positiva. O jogo não funciona com novatos na série. Isso porque tudo serve para referenciar e colocar uma nova interpretação dos vilões dos títulos anteriores.', N'imgs/asc-rogue.jpg', CAST(N'2014-11-05' AS Date), N'ps3', 87.67, 1, 6)
INSERT [dbo].[jogos] ([idjogos], [nome], [descricao], [img], [dtLancamentos], [plataforma], [preco], [validacao], [quantidade]) VALUES (1, N'Assassin''s Creed IV BLack Flag	assassin''s', N'Creed IV: Black Flag segue as aventuras de Edward James Kenway, um notável pirata e corsário que viveu nas Caraíbas durante a Época Dourada da Pirataria no inicio do séc. XVIII,que hoje é mais conhecida como América Central, pai de Haytham Kenway e avô de Ratonhnhaké:ton (Connor Kenway), os personagens jogáveis ??de Assassins Creed III. A história de Edward começa quando este se vê acidentalmente no meio do eterno conflito entre Assassinos e Templários. Enquanto isso os piratas mais famosos se juntaram em Nassau, Bahamas, na tentativa de estabelecer uma das primeiras sociedades democráticas. Ao contrário dos jogos anteriores da série, em Black Flag o foco do jogo é mais dirigido à exploração naval no mapa de mundo aberto, mas mantendo o combate e o sistema de infiltração típicos da série. Também está incluída uma componente multijogador, apesar de só ser jogada em missões e cenários em-terra.', N'imgs/asc-black.png', CAST(N'2013-01-05' AS Date), N'pc', 280.25, 1, 9)
INSERT [dbo].[jogos] ([idjogos], [nome], [descricao], [img], [dtLancamentos], [plataforma], [preco], [validacao], [quantidade]) VALUES (2, N'Left 4 Dead', N'Quem nunca ouviu falar no jogo de zumbis Left 4 Dead? Se você ainda não sabe do que se trata, preste atenção. Left 4 Dead é um jogo baseado em uma cidade que sofreu uma infecção e toda a população foi transformada em zumbis. Mas apenas 4 sobreviventes são totalmente imunes a infecção e acabam se unindo dentro do jogo.', N'imgs/l4d.jpg', CAST(N'2009-09-15' AS Date), N'xbox 360', 17.55, 1, 9)
INSERT [dbo].[jogos] ([idjogos], [nome], [descricao], [img], [dtLancamentos], [plataforma], [preco], [validacao], [quantidade]) VALUES (3, N'Batlefield 1', N' o game de tiro em primeira pessoa apresenta gráficos primorosos e multiplayer viciante. Enquanto o rival Call of Duty explora o futuro em Infinite Warfare, o jogo da DICE recria magistralmente a atmosfera da Primeira Guerra Mundial. Aliste-se nas nossas fileiras e confira seu review completo com prós e contras. A maré do combate virou. Após o lançamento dos divisivos Battlefield 4 e Hardline, desta vez a EA Games conseguiu botar nas prateleiras um título que deve agradar tanto recrutas quanto veteranos que sentiam falta dos melhores anos da série. Focar toda a experiência no pouco explorado cenário da Primeira Guerra Mundial se revelou um tiro certeiro, capaz de dar identidade própria e novo carisma à marca.', N'imgs/bf4.jpg', CAST(N'2016-05-25' AS Date), N'ps4', 152.65, 1, 7)
INSERT [dbo].[jogos] ([idjogos], [nome], [descricao], [img], [dtLancamentos], [plataforma], [preco], [validacao], [quantidade]) VALUES (4, N'The Last of Us', N'The Last of Us é um jogo eletrônico de ação-aventura e sobrevivência desenvolvido pela Naughty Dog e publicado pela Sony Computer Entertainment. Ele foi lançado exclusivamente para PlayStation 3 em 14 de junho de 2013. Na história, os jogadores controlam Joel, um homem encarregado de escoltar uma adolescente chamada Ellie através de um Estados Unidos pós-apocalíptico. The Last of Us é jogado a partir de uma perspectiva em terceira pessoa, com os jogadores usando armas de fogo, armas improvisadas e furtividade a fim de defenderem-se de humanos hostis e criaturas canibalísticas infectadas por uma mutação do fungo Cordyceps. Um "Modo de Escuta" permite a localização de inimigos por meio de uma escuta e percepção espacial aprimoradas. Armas podem ser melhoradas usando itens recolhidos do ambiente. Há um modo multijogador online em que até oito jogadores podem entrar em diferentes modos de partidas cooperativas ou competitivas.', N'imgs/tlou.jpg', CAST(N'2013-06-14' AS Date), N'ps3', 74.9, 1, 7)
INSERT [dbo].[jogos] ([idjogos], [nome], [descricao], [img], [dtLancamentos], [plataforma], [preco], [validacao], [quantidade]) VALUES (5, N'Mortal Kombat X', N'Mortal Kombat X não é apenas mais um jogo de luta, é um novo capítulo de uma das franquias mais antigas, famosas, polêmicas e divertidas de todos os tempos. O game é o décimo capítulo da série e sequência direta de Mortal Kombat, lançado em 2011 e que serviu para dar um reboot na história, contando os mesmos eventos dos três primeiros games anteriores, mas em uma linha de tempo alternativa.', N'imgs/mkx.jpg', CAST(N'2015-04-14' AS Date), N'xbox one', 79.99, 1, 9)
INSERT [dbo].[jogos] ([idjogos], [nome], [descricao], [img], [dtLancamentos], [plataforma], [preco], [validacao], [quantidade]) VALUES (6, N'Grand Theaf Auto V', N'
Vivencie o jogo em mundo aberto da Rockstar Games aclamado pela crítica , Grand Theft Auto V.

Quando um malandro de rua, um ladrão de bancos aposentado e um psicopata aterrorizante se envolvem com alguns dos criminosos mais assustadores e loucos do submundo, o governo dos EUA e a indústria do entretenimento, eles devem realizar golpes ousados para sobreviver nessa cidade implacável onde não podem confiar em ninguém, nem mesmo um no outro.

Explore o deslumbrante mundo de Los Santos e Blaine County na experiência definitiva de Grand Theft Auto V, apresentando amplas atualizações e melhorias técnicas tanto para jogadores novos quanto para os que estiverem retornando. Além de distâncias maiores de renderização e melhor resolução, os jogadores podem esperar diversas adições e melhorias, incluindo', N'imgs/gta5.jpg', CAST(N'2014-11-17' AS Date), N'ps3', 187.6, 1, 3)
INSERT [dbo].[jogos] ([idjogos], [nome], [descricao], [img], [dtLancamentos], [plataforma], [preco], [validacao], [quantidade]) VALUES (7, N'FIFA 17', N'Adquira o FIFA 17 Edição Standard para Xbox One ou Xbox 360! A Edição Standard inclui o jogo básico e um jogador do FIFA Ultimate Team Legends por empréstimo por 3 partidas.

Com tecnologia Frostbite, o FIFA 17 transforma a maneira de jogar, competir e se conectar emocionalmente ao jogo.

O FIFA 17 insere você em experiências de futebol autênticas, aproveitando um novo engine de jogo, trazendo jogadores de futebol cheios de profundidade e emoção; levando você a mundos novos e exclusivos do jogo. Você domina cada momento em campo com inovação total na maneira com que os jogadores pensam, se movimentam, interagem fisicamente com os adversários e executam ataques.', N'imgs/fifa.png', CAST(N'2016-09-26' AS Date), N'xbox one', 250, 1, 6)
INSERT [dbo].[jogos] ([idjogos], [nome], [descricao], [img], [dtLancamentos], [plataforma], [preco], [validacao], [quantidade]) VALUES (8, N'Batman: Arkham Knight', N'Em Batman: Arkham Knight, o Cavaleiro das Trevas deverá enfrentar a ameaça suprema contra a cidade que ele jurou proteger. Scarecrow está de volta e uniu um impressionante contigente de super vilões, incluindo o Pinguin, Duas-Caras e Harley Quinn para destruir Batman para sempre. O jogo introduz uma versão exclusiva do Batmovel que agora será possível dirigí-lo pela primeira vez na franquia. Batman: Arkham Knight é a experiência suprema da franquia e promete ser um dos melhores jogos do ano.', N'imgs/bat.jpg', CAST(N'2015-06-23' AS Date), N'ps4', 79, 1, 5)
INSERT [dbo].[jogos] ([idjogos], [nome], [descricao], [img], [dtLancamentos], [plataforma], [preco], [validacao], [quantidade]) VALUES (9, N'Far Cry Primal', N'Diferentemente dos outros jogos da franquia, Far Cry Primal pouco se aprofunda na narrativa. O título vai direto ao ponto e deixa o jogador livre no meio da selva. A premissa é simples –Takkar deve recrutar novos combatentes para fortalecer o exército de Wenjas, cujo objetivo é exterminar os líderes das tribos rivais Udam e Izila.
Embora a campanha seja consistente, composta por cenas memoráveis, o mesmo não pode ser dito dos vilões, que pouco acrescentam no contexto geral da trama. Um antagonista com personalidade realmente faz falta em Far Cry Primal, como as atuações impecáveis de Vaas Montenegro e Pagan Min em Far Cry 3 e Far Cry 4.', N'imgs/fcp.jpg', CAST(N'2016-02-23' AS Date), N'ps4', 107, 1, 3)
INSERT [dbo].[jogos] ([idjogos], [nome], [descricao], [img], [dtLancamentos], [plataforma], [preco], [validacao], [quantidade]) VALUES (10, N'Watch Dogs', N'Watch Dogs não é apenas um jogo de stealth, também funciona como um shooter tradicional na terceira pessoa. Por vezes torna-se uma necessidade enveredar por esta faceta, quando somos detectados e temos que abandonar o stealth. O jogo é competente de qualquer uma das formas de jogar, mas Pearce só aguenta sobreviver alguns segundos exposto aos tiros. É um modo subtil dos produtores dizerem que devem, sempre que possível, evitar confrontos diretos. Como último recurso para estas ocasiões, há uma habilidade desbloqueável para abrandar o tempo, ao estilo de Max Payne.', N'imgs/wdogs.jpg', CAST(N'2014-05-05' AS Date), N'xbox 360', 115, 1, 2)
SET IDENTITY_INSERT [dbo].[jogos] OFF
/****** Object:  Index [jogos_has_clientes_FKIndex1]    Script Date: 27/08/2017 19:47:02 ******/
CREATE NONCLUSTERED INDEX [jogos_has_clientes_FKIndex1] ON [dbo].[compra]
(
	[jogos_idjogos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [jogos_has_clientes_FKIndex2]    Script Date: 27/08/2017 19:47:02 ******/
CREATE NONCLUSTERED INDEX [jogos_has_clientes_FKIndex2] ON [dbo].[compra]
(
	[clientes_idclientes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[clientes] ADD  DEFAULT ((0)) FOR [valorGasto]
GO
ALTER TABLE [dbo].[compra]  WITH CHECK ADD  CONSTRAINT [FK_clientes] FOREIGN KEY([jogos_idjogos])
REFERENCES [dbo].[clientes] ([idclientes])
GO
ALTER TABLE [dbo].[compra] CHECK CONSTRAINT [FK_clientes]
GO
ALTER TABLE [dbo].[compra]  WITH CHECK ADD  CONSTRAINT [FK_jogos] FOREIGN KEY([jogos_idjogos])
REFERENCES [dbo].[jogos] ([idjogos])
GO
ALTER TABLE [dbo].[compra] CHECK CONSTRAINT [FK_jogos]
GO
/****** Object:  StoredProcedure [dbo].[pr_inserir_jogos]    Script Date: 27/08/2017 19:47:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[pr_inserir_jogos] @nome varchar(225), @descricao text, @img varchar(1000), @data date, @plataforma varchar(45), @preco real,@bit bit  as 
begin
insert into jogos 
			values(@nome,@descricao,@img,@data,@plataforma,@preco,@bit)

end
GO
USE [master]
GO
ALTER DATABASE [sistemaJogos] SET  READ_WRITE 
GO
