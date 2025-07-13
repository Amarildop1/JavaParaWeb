<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Resultados do Consumo</title>
        <style>
            body { font-family: Arial, sans-serif; margin: 20px; background-color: #f4f4f4; }
            .container { background-color: #fff; padding: 30px; border-radius: 8px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); max-width: 600px; margin: auto; }
            h1 { text-align: center; color: #333; }
            p { font-size: 1.1em; line-height: 1.6; }
            strong { color: #007bff; }
            .back-button { display: block; width: 150px; margin: 20px auto 0; padding: 10px; text-align: center; background-color: #6c757d; color: white; text-decoration: none; border-radius: 4px; }
            .back-button:hover { background-color: #5a6268; }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Resultados do Consumo Anual</h1>
            <hr>
            <br>
            <p><strong>Nome do usuário:</strong> <%= request.getAttribute("userName")%></p>
            <p><strong>Valor total gasto no ano:</strong> <%= request.getAttribute("totalConsumption")%>W</p>
            <p><strong>Mês com Maior consumo:</strong> <%= request.getAttribute("maxMonth")%></p>
            <p><strong>Mês com Menor consumo:</strong> <%= request.getAttribute("minMonth")%></p>
            <a href="index.jsp" class="back-button">Calcular Novamente</a>
        </div>

        <footer> 
            <p> 2025 &copy; Amarildo </p>
        </footer>
    </body>
</html>
