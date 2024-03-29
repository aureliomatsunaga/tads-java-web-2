<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="/WEB-INF/jsp/error-page.jsp" %>

<c:if test="${accessRole != null}">
  <c:set var="roleHome" value="${accessRole.toString()}" />
  <c:redirect url="${pageContext.request.contextPath}/${roleHome}" />
</c:if>

<t:baseLayout>

  <main class="container">

    <%-- Cabeçalho da página (com logotipo) --%>
    <header class="text-center">
      <h1 class="text-primary display-3 c-title">
        <img src="${pageContext.request.contextPath}/img/reclame-ali-blue.png" class="c-logo-large" alt="Logo do Sistema" />
        Reclame Ali
      </h1>
      <span class="text-secondary c-subtitle">
        Serviço de Atendimento ao Cliente da <strong>Beibe</strong><sup>&copy;</sup>
      </span>
    </header>

    <%-- Formulário de login --%>
    <form action="${pageContext.request.contextPath}/entrar?action=signin" method="POST" id="form-signin" class="card c-signin-card" novalidate>
      <h2 class="card-header">Entrar</h2>
      <img class="card-img-top" src="${pageContext.request.contextPath}/img/cover.jpg" alt="Capa">
      <div class="card-body">
        <p class="mb-3 h5 text-center">
          Forneça suas credenciais de acesso:
        </p>
        <c:choose>
          <c:when test="${authError == true}">
            <div class="alert alert-danger border-danger c-alert" role="alert">
              Credenciais inválidas. Tente novamente!
            </div>
          </c:when>
          <c:when test="${accessDenied == true}">
            <div class="alert alert-warning border-warning c-alert" role="alert">
              Área restrita! Você precisa logar como ${roleRequired}
            </div>
          </c:when>
        </c:choose>
        <div class="form-group">
          <label for="signin-login">Endereço de email:</label>
          <div class="input-group mb-3">
            <div class="input-group-prepend">
              <span class="input-group-text">
                <i class="fas fa-at"></i>
              </span>
            </div>
            <input type="text" id="signin-login" class="form-control" name="login" autofocus required />
            <div class="invalid-feedback ml-5">Campo obrigatório</div>
          </div>
        </div>
        <div class="form-group">
          <label for="signin-password">Senha de acesso:</label>
          <div class="input-group mb-3">
            <div class="input-group-prepend">
              <span class="input-group-text">
                <i class="fas fa-unlock-alt"></i>
              </span>
            </div>
            <input type="password" id="signin-password" class="form-control clsDatePicker" name="password"  required />
            <div class="invalid-feedback ml-5">Campo obrigatório</div>
          </div>
        </div>
        <div class="text-center">
          <p class="mt-3 mb-0">
            Esqueceu a senha? <a href="mailto:${emailSupport}">Contate o suporte</a>
          </p>
        </div>
      </div>
      <div class="card-footer c-sign-buttons">
        <button type="button" class="btn btn-lg btn-light" data-toggle="modal" data-target="#signup-modal">
          Cadastrar-se
        </button>
        <button type="submit" class="btn btn-lg btn-primary">
          Entrar
        </button>
      </div>
    </form>
  </main>

  <%-- Formulário de auto-cadastro --%>
  <div id="signup-modal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-lg" role="document">
      <form action="${pageContext.request.contextPath}/entrar?action=signup" method="POST" id="form-signup" class="modal-content" novalidate>
        <div class="modal-header">
          <h2 class="modal-title">Cadastro de Usuário</h2>
          <button type="button" class="close" data-dismiss="modal">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <p>
            Prezado(a) cliente,
          </p>
          <p>
            Para acessar o sistema de Serviço de Atendimento ao Cliente (SAC) da <strong>Beibe<sup>&copy;</sup></strong>,
            você precisa fornecer os seguintes dados que o identifiquem:
          </p>
          <div class="row">
            <div class="col-12 col-md-6">
              <div class="input-group mb-3">
                <input type="text" class="form-control" name="first_name" placeholder="Seu nome" autocapitalize="words" required />
                <div id="invalid-first_name" class="invalid-feedback ml-5"></div>
              </div>
            </div>
            <div class="col-12 col-md-6">
              <div class="input-group mb-3">
                <input type="text" class="form-control" name="last_name" placeholder="Seu sobrenome" autocapitalize="words" />
                <div id="invalid-last_name" class="invalid-feedback ml-5"></div>
              </div>
            </div>
            <div class="col-12 col-md-6">
              <div class="input-group mb-3">
                <div class="input-group-prepend">
                  <span class="input-group-text">
                    <i class="fab fa-slack-hash"></i>
                  </span>
                </div>
                <input type="text" class="form-control" name="cpf" placeholder="CPF (somente números)" />
                <div id="invalid-cpf" class="invalid-feedback ml-5"></div>
              </div>
            </div>
            <div class="col-12 col-md-6">
              <div class="input-group mb-3">
                <div class="input-group-prepend">
                  <span class="input-group-text">
                    <i class="far fa-calendar-alt"></i>
                  </span>
                </div>
                <input type="text" class="form-control" name="date_birth" placeholder="Data de nascimento" readonly />
                <div id="invalid-date_birth" class="invalid-feedback ml-5"></div>
              </div>
            </div>
            <div class="col-12 col-md-6">
              <div class="input-group mb-3">
                <div class="input-group-prepend">
                  <span class="input-group-text">
                    <i class="fas fa-at"></i>
                  </span>
                </div>
                <input type="text" class="form-control" name="email" placeholder="Email de acesso" />
                <div id="invalid-email" class="invalid-feedback ml-5"></div>
              </div>
            </div>
            <div class="col-12 col-md-6">
              <div class="input-group mb-3">
                <div class="input-group-prepend">
                  <span class="input-group-text">
                    <i class="fas fa-mobile-alt"></i>
                  </span>
                </div>
                <input type="text" class="form-control" name="phone" placeholder="Telefone (con DDD)" />
                <div id="invalid-phone" class="invalid-feedback ml-5"></div>
              </div>
            </div>
            <div class="col-12 col-md-6">
              <div class="input-group mb-3">
                <div class="input-group-prepend">
                  <span class="input-group-text">
                    <i class="fas fa-map-marker-alt"></i>
                  </span>
                </div>
                <input type="text" class="form-control" name="zip_code" placeholder="CEP" />
                <div class="input-group-append">
                  <button class="btn btn-outline-primary" type="button" id="find-zip_code">
                    Buscar CEP
                  </button>
                </div>
                <div id="invalid-zip_code" class="invalid-feedback ml-5"></div>
              </div>
            </div>
            <div class="col-12 col-md-6">
              <div class="input-group mb-3">
                <div class="input-group-prepend">
                  <span class="input-group-text">
                    <i class="fas fa-map"></i>
                  </span>
                </div>
                <input type="text" class="form-control" name="street" placeholder="Endereço (rua, avenida, alameda...)" />
                <div id="invalid-street" class="invalid-feedback ml-5"></div>
              </div>
            </div>
            <div class="col-12 col-md-6">
              <div class="input-group mb-3">
                <div class="input-group-prepend">
                  <span class="input-group-text">
                    <i class="fas fa-map-marked-alt"></i>
                  </span>
                </div>
                <input type="text" class="form-control" name="number" placeholder="Número" />
                <input type="text" class="form-control" name="complement" placeholder="Complemento" />
                <div id="invalid-number" class="invalid-feedback ml-5"></div>
              </div>
            </div>
            <div class="col-12 col-md-6">
              <div class="input-group mb-3">
                <div class="input-group-prepend">
                  <span class="input-group-text">
                    <i class="fas fa-globe-americas"></i>
                  </span>
                </div>
                <input type="text" class="form-control" name="city" placeholder="Cidade" />
                <select class="form-control" name="state">
                  <option>Estado</option>
                  <c:forEach var="state" items="${states}">
                    <option value="${state.id}">
                      <c:out value="${state.abrev}" /> - <c:out value="${state.name}" />
                    </option>
                  </c:forEach>
                </select>
                <div id="invalid-city" class="invalid-feedback ml-5"></div>
                <div id="invalid-state" class="invalid-feedback ml-5"></div>
              </div>
            </div>
            <div class="col-12 col-md-6">
              <div class="input-group mb-3">
                <div class="input-group-prepend">
                  <span class="input-group-text">
                    <i class="fas fa-unlock-alt"></i>
                  </span>
                </div>
                <input type="password" class="form-control" name="password1" placeholder="Senha de acesso" />
                <div id="invalid-password1" class="invalid-feedback ml-5"></div>
              </div>
            </div>
            <div class="col-12 col-md-6">
              <div class="input-group mb-4">
                <div class="input-group-prepend">
                  <span class="input-group-text">
                    <i class="fas fa-unlock-alt"></i>
                  </span>
                </div>
                <input type="password" class="form-control" name="password2" placeholder="Repetir senha" />
                <div id="invalid-password2" class="invalid-feedback ml-5"></div>
              </div>
            </div>
            <div class="col-12">
              <div class="custom-control custom-switch mb-2">
                <input type="checkbox" class="custom-control-input" id="use-terms" name="terms" />
                <label class="custom-control-label" for="use-terms">
                  Declaro que li e que aceito os <a href="#">Termos de Uso</a> da plataforma <strong>Reclame Ali<sup>&copy;</sup></strong>
                </label>
                <div id="invalid-terms" class="invalid-feedback ml-5"></div>
              </div>
            </div>
          </div>
        </div>
        <div class="modal-footer c-sign-buttons">
          <button type="button" class="btn btn-lg btn-light" data-dismiss="modal">
            Cancelar
          </button>
          <button type="submit" class="btn btn-lg btn-primary">
            Cadastrar
          </button>
        </div>
      </form>
    </div>
  </div>

</t:baseLayout>
