
// URL de requisições AJAX
var apiUrl = 'cadastrar-usuario'

// Monta e adiciona a linha no corpo da tabela
function adicionarLinha(dados) {
  var linha = '<tr>'
  for (var campo in dados) {
    linha += '<td>' + dados[campo] + '</td>'
  }
  linha += '</tr>'
  $('tbody').append(linha)
}

// Requisita para "http://localhost/Exercicio02/cadastrar-usuario" a lista de usuários
function requisitarListaUsuarios() {
  $.getJSON(apiUrl).then(function(response) {
    for (var usuario of response) {
      adicionarLinha(usuario)
    }
  })
}

function enviarDados(e) {
  e.preventDefault()
  $('.alert-success').hide();
  $('.alert-danger').hide();
  var dados = {
    nome: $('input[name="nome"]').val(),
    login: $('input[name="login"]').val().toUpperCase(),
    senha: $('input[name="senha"]').val()
  }
  $.post(apiUrl, dados).then(function(response){ 
    adicionarLinha(response.data)
    $('input[name="nome"]').val('')
    $('input[name="login"]').val('')
    $('input[name="senha"]').val('')
    $('input[name="nome"]').focus()
    $('.alert-success').fadeTo(2000, 500).slideUp(500, function() {
        $('.alert-success').slideUp(500)
    });
  }).catch(function(response) {
     var erros = response.responseJSON.messages
     var alert = $('.alert-danger')
     alert.html("")
     for (var er of erros) {
         alert.html(alert.html() + er + "<br/>")
     }
     alert.fadeTo(2000, 500).slideUp(500, function() {
        alert.slideUp(500)
    });
  })
}

$(document).ready(function() {
  requisitarListaUsuarios()
  $('form').submit(enviarDados)
})
