$(document).ready(function(){
  $('body').on('click', '.btn-follow', function(e){
    var followed_id = $('#followed_id').val();
    e.preventDefault();
    $.ajax({
      url: '/relationships',
      type: 'post',
      dataType: 'json',
      data: {followed_id: followed_id},
    })

    .done(function(data) {
      $('#follow_form').html(data.html_content);
      $('#followers').html(data.count_follow);
    })
  })

  $('body').on('click', '.btn-unfollow', function(e){
    var edit_url = $('.edit_relationship').attr('action');
    e.preventDefault();
    $.ajax({
      url: edit_url,
      type: 'delete',
    })

    .done(function(data) {
      $('#follow_form').html(data.html_content);
      $('#followers').html(data.count_follow);
    })
  })
})
