
// Configurar máscaras de campos de formulário
$('input[name="cpf"]').mask('000.000.000-00', { reverse: true });
$('input[name="nome"]').mask('S'.repeat(100), { translation: { S: { pattern: /[A-Za-zÁáÃãÂâÇçÉéÊêÍíÓóÔôÕõÚú ]/ } } });
$('input[name="nasc"]').mask('00/00/0000');
$('input[name="cep"]').mask('00000-000');
$('input[name="rua"]').mask('S'.repeat(100), { translation: { S: { pattern: /[A-Za-zÁáÃãÂâÇçÉéÊêÍíÓóÔôÕõÚú ]/ } } });
$('input[name="numero"]').mask('999990', { reverse: true });

// Configurar DatePicker para campo de data
if (!$('input[name="nasc"]').attr("readonly")) {
  $('input[name="nasc"]').datepicker({
    dateFormat: 'dd/mm/yy',
    dayNames: ['Domingo','Segunda','Terça','Quarta','Quinta','Sexta','Sábado','Domingo'],
    dayNamesShort: ['Dom','Seg','Ter','Qua','Qui','Sex','Sáb','Dom'],
    dayNamesMin: ['D','S','T','Q','Q','S','S','D'],
    monthNames: ['Janeiro','Fevereiro','Março','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'],
    monthNamesShort: ['Jan','Fev','Mar','Abr','Mai','Jun','Jul','Ago','Set','Out','Nov','Dez'],
    maxDate: '-18Y',
    changeMonth: true,
    changeYear: true
  });
}

// Configurar evento de requisição de cidades para o estado selecionado
$('select[name="estado"]').change(function() {
  $.ajax({
    method: 'GET',
    url: `../api/cidades?estado=${$(this).val()}`,
    success(response) {
      const comboCidade = $('select[name="cidade"]');
      comboCidade.empty();
      comboCidade.append('<option>Cidade...</option>');
      response.forEach(cidade => {
        comboCidade.append(`<option value="${cidade.id}">${cidade.nome}</option>`);
      });
    }
  });
});
