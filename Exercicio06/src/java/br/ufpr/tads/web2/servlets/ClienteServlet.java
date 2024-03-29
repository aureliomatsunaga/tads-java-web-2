package br.ufpr.tads.web2.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import br.ufpr.tads.web2.facades.ClienteFacade;
import br.ufpr.tads.web2.beans.Cliente;
import br.ufpr.tads.web2.beans.Endereco;
import java.text.ParseException;
import java.text.SimpleDateFormat;

@WebServlet(name = "Clientes", urlPatterns = {"/clientes/*"})
public class ClienteServlet extends HttpServlet {

    @Override
    protected void doGet(
        HttpServletRequest request,
        HttpServletResponse response
    ) throws ServletException, IOException {

        // Salvar URI's em vetor
        String[] uri = request.getRequestURI().split("/");
        
        // Se rota não possuir parâmetros, retornar lista
        if (uri.length == 3) {
            List<Cliente> clientes = ClienteFacade.buscarTodos();
            request.setAttribute("clientes", clientes);
            request.getRequestDispatcher("/jsp/clientesListar.jsp").forward(request, response);
            return;
        }
        
        // Se não, avaliar parâmetro e preparar resposta adequada
        int id;
        Cliente cliente;
        switch (uri[3]) {
            
            // Redirecionar para formulário de cadastro
            case "novo": 
                request.getRequestDispatcher("/jsp/clientesForm.jsp").forward(request, response);
                break;
            
            // Excluir registro do banco de dados
            case "excluir":
                id = Integer.parseInt(request.getParameter("id"));
                ClienteFacade.remover(id);
                response.sendRedirect(request.getContextPath() + "/clientes");
                break;
            
            // Busca o cliente para exibir em formulário de visualização
            case "visualizar":
                id = Integer.parseInt(request.getParameter("id"));
                cliente = ClienteFacade.buscar(id);
                request.setAttribute("cliente", cliente);
                request.setAttribute("readOnly", true);
                request.getRequestDispatcher("/jsp/clientesForm.jsp").forward(request, response);
                break;
           
            // Busca o cliente para exibir em formulário de visualização
            case "alterar":
                id = Integer.parseInt(request.getParameter("id"));
                cliente = ClienteFacade.buscar(id);
                request.setAttribute("cliente", cliente);
                request.getRequestDispatcher("/jsp/clientesForm.jsp").forward(request, response);
                break;
            
            // Exibir erro em qualquer outra URI
            default:
                response.sendError(404);
        }
    }
    
    @Override
    protected void doPost(
        HttpServletRequest request,
        HttpServletResponse response
    ) throws ServletException, IOException {

        // Salvar URI's em vetor
        String[] uri = request.getRequestURI().split("/");
        
        // Prosseguir apenas se houverem apenas 1 parâmetro adicional
        if (uri.length == 4) {
            
            // Definir encoding dos dados da requisição
            request.setCharacterEncoding("UTF-8");

            // Instanciar modelos e associar parâmetros
            Cliente cliente = new Cliente();
            Endereco endereco = new Endereco();
            cliente.setId(Integer.parseInt("0" + request.getParameter("id")));
            cliente.setCpf(request.getParameter("cpf"));
            cliente.setNome(request.getParameter("nome"));
            cliente.setEmail(request.getParameter("email"));
            try {
                SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                cliente.setDataNasc(formatter.parse(request.getParameter("nasc")));
            } catch (ParseException | NullPointerException e) {
                cliente.setDataNasc(null);
            }
            endereco.setCep(request.getParameter("cep"));
            endereco.setRua(request.getParameter("rua"));
            endereco.setNumero(Integer.parseInt(request.getParameter("numero")));
            endereco.setCidade(request.getParameter("cidade"));
            endereco.setUf(request.getParameter("estado"));
            cliente.setEndereco(endereco);
            
            // Em caso de novo registro, validar se CPF já está cadastrado e salvá-lo
            if (uri[3].equals("novo")) {
                if (ClienteFacade.buscar(cliente.getCpf()) != null) {
                    request.setAttribute("cliente", cliente);
                    request.setAttribute("erro", "CPF já cadastrado!");
                    this.doGet(request, response);
                } else {
                    ClienteFacade.inserir(cliente);
                    response.sendRedirect(request.getContextPath() + "/clientes");
                }
                return;
            } 
            
            // Em caso de atualização, apenas salvá-la e redirecionar
            else if (uri[3].equals("alterar")) {
                ClienteFacade.alterar(cliente);
                response.sendRedirect(request.getContextPath() + "/clientes");
                return;
            }
        }
        
        // Exibir erro em qualquer outra URI
        response.sendError(404);
    }
}
