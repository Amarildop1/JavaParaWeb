package com.servletlavadora.app;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "ConsumoServlet", urlPatterns = {"/ConsumoServlet"})
public class ConsumoServlet extends HttpServlet {

    // Nomes dos meses para referência
    private final String[] MONTHS = {"Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"};

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String userName = request.getParameter("userName");
        double totalConsumption = 0;
        double maxConsumption = -1; // Inicializando com um valor baixo que será superado por qualquer consumo válido
        String maxMonth = "";
        double minConsumption = Double.MAX_VALUE; // Inicializa com um valor muito alto para ser superado pelo valor
        String minMonth = "";

        // Loop para obter e processar os 12 valores de consumo mensais
        for (int i = 0; i < MONTHS.length; i++) {
            String paramName = "month" + (i + 1); // Nome do parâmetro no formulário (ex: month1, month2)
            String monthValueStr = request.getParameter(paramName);

            // Verificando se o campo está vazio
            if (monthValueStr == null || monthValueStr.trim().isEmpty()) {
                request.setAttribute("errorMessage", "Erro: Todos os campos de consumo mensal devem ser preenchidos.");
                request.getRequestDispatcher("index.jsp").forward(request, response);
                return; // Interrompe a execução e retorna ao formulário
            }

            try {
                double consumption = Double.parseDouble(monthValueStr);
                // Verificando se o valor de consumo é negativo
                if (consumption < 0) {
                     request.setAttribute("errorMessage", "Erro: Os valores de consumo não podem ser negativos.");
                     request.getRequestDispatcher("index.jsp").forward(request, response);
                     return; // Interrompe a execução
                }
                totalConsumption += consumption;

                // Mês de maior consumo
                if (consumption > maxConsumption) {
                    maxConsumption = consumption;
                    maxMonth = MONTHS[i];
                }

                // Mês de menor consumo
                if (consumption < minConsumption) {
                    minConsumption = consumption;
                    minMonth = MONTHS[i];
                }

            } catch (NumberFormatException e) {
                // Captura erro se o valor não for um número válido
                request.setAttribute("errorMessage", "Erro: Por favor, insira valores numéricos válidos para o consumo.");
                request.getRequestDispatcher("index.jsp").forward(request, response);
                return; // Interrompe a execução
            }
        }

        // Define os atributos na requisição para que sejam acessíveis na página de resultado
        request.setAttribute("userName", userName);
        request.setAttribute("totalConsumption", String.format("%.2f", totalConsumption));
        request.setAttribute("maxMonth", maxMonth);
        request.setAttribute("minMonth", minMonth);

        // Encaminhando a requisição (com os atributos) para a página de resultados
        request.getRequestDispatcher("result.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet para calcular o consumo de energia da lavadora.";
    }
}
