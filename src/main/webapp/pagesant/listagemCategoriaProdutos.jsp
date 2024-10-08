<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="org.constroocrud.crud.models.CategoriaProduto" %>
<%@ page import="org.constroocrud.crud.DAOs.CategoriaProdutoDAO" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>

    <%-- recebe o css --%>.
    <link rel="stylesheet" href="${pageContext.request.contextPath}/cascading-style-sheets/listagemCategoriaProduto.css">

    <title>CRUD</title>
        <%-- NAVBAR --%>.
    <div id="navbar">
        <p id="navbar-Constroo">Constroo</p>
        <div id="navbar-line"></div>
    </div>

        <%-- Nesta parte o usuario sera direcionado para as outras listagens

         ex: ListagensProdutos.jsp--%>.

    <div id="div-entidades">
        <a href="#">
            Categorias/Tags
        </a>
        <a href="${pageContext.request.contextPath}/pagesant/listagemAdministradores.jsp">
            Administração

        </a>
        <a href="#">
            Planos
        </a>
    </div>
    <div id="div-crud-usuario">
        <h1 id="usuarios-titulo">Categoria Produto</h1>

        <div id="right-options-crud">

        <%--Acesso ao cadastro de um usuario--%>
            <form id="form-usuario-criar" action="${pageContext.request.contextPath}/hyperText-markup-language/cadastrarCategoriaProduto.html">
                <button id="button-criar">Criar</button>
                <input type="text">
                <input type="submit" value="pesquisar">
            </form>
        </div>

    </div>
        <%-- fiz um sistemas de :target para dividir a seçao de profissionais e compradores/vendedores--%>.
    <div id="tipos-usuario" >
        <a href="#">
            Categoria Produto
        </a>
        <a href="${pageContext.request.contextPath}/pages/listagemTagServico.jsp">
            Tag Serviços
        </a>
    </div>
    <div id="secao_CategoriaProduto">

        <%--Esta é a seçao de compradores vendedores

        Ocorre um while no result set retornado pelos buscarCopradorVendedor, criando divs a cada resultado
        voce consegue colocar um codigo java por meio desse < e %, caso vc queira colocar apenas uma expressao, tipo um valor string voce precisa de um < % = (sem os espaços entre si)

        Coloquei tudo dentro e dentro e dentro de divs para fazer a estilização no CSS
        --%>
        <%

            CategoriaProdutoDAO categoriaProdutoDAO = new CategoriaProdutoDAO();

            ResultSet resultSet =categoriaProdutoDAO.buscarCategoriaProduto();
            try {
                while (resultSet.next()){
        %>


        <div class="Usuario">
            <div class="top-usuario-infos">
                <div class="infos-principais-usuario">


                    <h1 class="nome-Usuario"><%= resultSet.getString("nome")%></h1>
                    <p>ID: <%= resultSet.getInt("id")%></p>
                </div>
                <p><%= resultSet.getString("descricao")%></p>

                <div class="deletar-alterar">

                    <%--Este form post é para fazer o acesso ao servlet de deletar users que tem um input escondido que recebe o id do comprador vendedor--%>
                    <form action="${pageContext.request.contextPath}/DeletarCategoriaProdutoServlet" method="post">
                        <input type="hidden" name="categoria_id" value=<%=resultSet.getInt("id")%>>
                        <button type="submit" class="button-deletar-alterar">Deletar</button>
                    </form>
                    <form action="${pageContext.request.contextPath}/DirecionarCategoriaProdutoAlterarServlet" method="post">
                         <input type="hidden" name="categoria_id" value=<%=resultSet.getInt("id")%>>
                        <input type="hidden" name="nome" value=<%=resultSet.getString("nome")%>>
                        <input type="hidden" name="descricao" value=<%=resultSet.getString("descricao")%>>
                         <button type="submit" class="button-deletar-alterar">Alterar</button>
                    </form>


                </div>

            </div>





        </div>




        <%


                }
            }catch (SQLException sqlException){
                sqlException.printStackTrace();

            }
        %>
    </div>



</head>
<body>

</body>
</html>
