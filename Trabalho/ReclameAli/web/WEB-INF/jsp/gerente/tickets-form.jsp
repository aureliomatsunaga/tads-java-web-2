<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="/WEB-INF/jsp/error-page.jsp" %>

<t:baseLayout>

  <%-- Cabeçalho da página --%>
  <t:header baseUrl="${baseUri}" hyperlinks="${headerLinks}" />

  <%-- Corpo da página --%>
  <main class="container">
    <h2 class="mb-4">
      Atendimento #[ID do atendimento]
    </h2>

    <%-- Dados do atendimento --%>
    <form action="atendimentos.html" method="POST">
      <a href="atendimentos.html" class="btn btn-secondary float-right w-25">
        <i class="fas fa-chevron-circle-left"></i>
        Voltar
      </a>
      <div class="form-group row">
        <label for="atendimento-id" class="col-2 col-form-label">Atendimento:</label>
        <div class="col-10">
          <input type="text" id="atendimento-id" class="form-control-plaintext" readonly value="#100123" />
        </div>
      </div>
      <div class="form-group row">
        <label for="atendimento-cliente" class="col-2 col-form-label">Cliente:</label>
        <div class="col-10">
          <input type="text" id="atendimento-cliente" class="form-control-plaintext" readonly value="#666 (Josnei)" />
        </div>
      </div>
      <div class="form-group row">
        <label for="atendimento-produto" class="col-2 col-form-label">Produto:</label>
        <div class="col-10">
          <input type="text" id="atendimento-produto" class="form-control-plaintext" readonly value="#50004 (Batom Cacatua Raivosa)" />
        </div>
      </div>
      <div class="form-group row">
        <label for="atendimento-tipo" class="col-2 col-form-label">Tipo do atendimento:</label>
        <div class="col-10">
          <input type="text" id="atendimento-tipo" class="form-control-plaintext" readonly value="Produto com defeito" />
        </div>
      </div>
      <div class="form-group row">
        <label for="atendimento-status" class="col-2 col-form-label">Status:</label>
        <div class="col-10">
          <input type="text" id="atendimento-status" class="form-control-plaintext" readonly value="Contestado" />
        </div>
      </div>
      <div class="form-group">
        <label for="atendimento-msg">Histórico de mensagens:</label>
        <div class="row">
          <div class="col-10 col-md-8">
            <div class="rounded bg-secondary c-mensagem">
              <p>Prezados,</p>
              <p>Comprei uma caixa de batons super divos, super maravilhosos. A encomenda chegou dentro do prazo e tals,
                mas  aparentemente, o lote que vocês me mandaram está vencido. Comi um e senti um sabor horrível, nada a ver com
                chocolate. Imaginei que poderia ser apenas uma unidade com algum problema, mas comi outro e o gosto estava igualmente
                nojento!</p>
              <p>Por favor, ajudem me a resolver essa situação, pois sinto que estou no prejuízo. Minhas lumbrigas estão
                passando vontade!</p>
              <p>PS: amei a nova embalagem do baton! Muito top!</p>
              <div class="text-right c-mensagem-time">
                Enviada em 31-set-2019, às 12:34
              </div>
            </div>
          </div>
          <div class="col-10 col-md-8 offset-2 offset-md-4">
            <div class="rounded bg-primary c-mensagem">
              <p>Obrigado pelo contato. Nossos colaboradores entrarão em contato em breve.</p>
              <div class="text-right c-mensagem-time">
                Enviada em 31-set-2019, às 12:35
              </div>
            </div>
          </div>
          <div class="col-10 col-md-8 offset-2 offset-md-4">
            <div class="rounded bg-primary c-mensagem">
              <p>Prezado cliente,</p>
              <p>Analisamos sua reclamação juntamente com toda nossa equipe técnica e, pelo que tudo indica,
                o senhor parece ter se enganado quanto ao produto denominado "batom". Aparentemente, o
                produto que o senhor deseja é o "Baton", um chocolate da marca Garoto, do ramo alimentíceo.</p>
              <p>A Embuste é do ramo de cosméticos (higiene e beleza) e, portanto, seus produtos, especialmente o
                tal batom que o senhor adquiriu, possui outra conotação. Por isso, sugerimos que consulte algum
                dicionário da língua portuguesa ou pesquise no Google mais informações sobre o produto, uma vez
                que esse portal trata apenas de assuntos sérios.</p>
              <p>Desde já, agrademos a compreensão.</p>
              <div class="text-right c-mensagem-time">
                Enviada em 1-out-2019, às 15:49
              </div>
            </div>
          </div>
        </div>
      </div>
    </form>
  </main>

</t:baseLayout>