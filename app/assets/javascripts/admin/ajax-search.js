$(document).ready(function(){
  $('.search-box').on('keyup', function(){
    var name_book = $(this).val();
    $.ajax({
      url: '/admin/books',
      type: 'get',
      dataType: 'json',
      data: {name: name_book, active_search: true},
      // success: function(data) {
      //   $('.table-book').html(data.html_search)
      // }
    })
    .done(function(data) {
      $('.table-book').html(data.html_search);
    })
  })
})
