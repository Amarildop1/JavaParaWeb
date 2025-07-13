<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Calculadora de Consumo de Lavadora</title>
        <style>
            body { font-family: Arial, sans-serif; margin: 20px; background-color: #f4f4f4; }
            .container { background-color: #fff; padding: 30px; border-radius: 8px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); max-width: 600px; margin: auto; }
            h1 { text-align: center; color: #333; }
            label { display: block; margin-bottom: 8px;  }
            input[type="text"], input[type="number"] { width: calc(100% - 350px); padding: 10px; margin-bottom: 15px; border: 1px solid #ddd; border-radius: 4px; }
            .month-input { display: flex; align-items: center; margin-bottom: 10px; width: 350px;}
            .month-input label { flex: 1; margin-bottom: 0; }
            .month-input input { flex: 2; margin-bottom: 0; margin-left: 50px;}
            input[type="submit"] { background-color: #007bff; color: white; padding: 12px 20px; border: none; border-radius: 4px; cursor: pointer; font-size: 16px; width: 80%; }
            input[type="submit"]:hover { background-color: #0056b3; }
            .error-message { color: red; text-align: center; margin-top: 15px; }
            form { display: flex; flex-direction: column; align-items: center;}
            .nomeUsuario{ display: flex; flex-direction: row; justify-content: center; align-items: center; }
            .nomeUsuario input{ width: 220px; margin-left: 15px; }
            footer{ text-align: center; }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Consumo de Energia da Lavadora</h1>
            <hr>
            <br>
            <%
                // Verificando se há mensagem de erro para exibir (se o Servlet redirecionou para cá)
                String errorMessage = (String) request.getAttribute("errorMessage");
                if (errorMessage != null) {
            %>
            <p class="error-message"><%= errorMessage%></p>
            <%
                }
            %>
            <form action="ConsumoServlet" method="post">
                <div class="nomeUsuario">
                    <label for="userName" id="lblNomeUsuario">Nome do Usuário:</label>
                    <input type="text" id="userName" name="userName" required autofocus placeholder="Digite seu nome aqui..."><br>
                </div>

                <h3>Informe o Consumo Mensal (em Watts):</h3>
                <%
                    // Array com os meses
                    String[] months = {"Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"};
                    // Loop para criar os 12 campos de entrada dos meses
                    for (int i = 0; i < months.length; i++) {
                %>
                <div class="month-input">
                    <label for="month<%= i + 1%>"><%= months[i]%>: </label>
                    <input type="number" id="month<%= i + 1%>" name="month<%= i + 1%>" min="0" step="0.01" required placeholder="Ex: 80"> W
                </div>
                <%
                    }
                %>
                <br>
                <input type="submit" value="Calcular Consumo">
            </form>
        </div>

        <footer> 
            <p> 2025 &copy; Amarildo </p>
        </footer>
    </body>
</html>
