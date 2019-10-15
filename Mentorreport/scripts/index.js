$(document).ready(function(){
  $("#datepicker").datepicker({ 
    format: "MM yyyy",
        autoclose: true, 
        minViewMode: "months",
        todayHighlight: true
  }).datepicker('update', new Date());
 
  for (var i = 0; i < 5; i++) {
    var content = jQuery('#sample_table tr'),
    size = jQuery('#tbl_posts >tbody >tr').length + 1,
    element = null,    
    element = content.clone();
    element.attr('id', 'rec-'+size);
    element.find('.delete-record').attr('data-id', size);
    element.appendTo('#tbl_posts_body');
    element.find('.sn').html(size);
    element.find('.act').attr('name', 'activity' + size);
    element.find('.kept').attr('name', 'kept' + size);
    element.find('.dur').attr('name', 'duration' + size);
    element.find('.comm').attr('name', 'comments' + size);
    element.find('.date_picker').attr('name', 'date_picker' + size);
  }

  $(document).on('click', '#submit', (function(e) {
    let form = $('#form')[0];
    let formData = new FormData(form);
    var object = {};
    formData.forEach(function(value, key){
      object[key] = value;
    });
    var json = JSON.stringify(object);
    $.ajax({
      url: 'http://127.0.0.1:8000/postMentorReport/',
      dataType: 'text',
      type: 'post',
      contentType: 'application/x-www-form-urlencoded',
      data: json,
      success: function( data, textStatus, jQxhr ){
        console.log("Success")
      },
      error: function( jqXhr, textStatus, errorThrown ){
        console.log( errorThrown );
      }
    });
  }));
  jQuery(document).delegate('a.add-record', 'click', function(e) {
    e.preventDefault();
    var content = jQuery('#sample_table tr'),
    size = jQuery('#tbl_posts >tbody >tr').length + 1,
    element = null,    
    element = content.clone();
    element.attr('id', 'rec-'+size);
    element.find('.delete-record').attr('data-id', size);
    element.appendTo('#tbl_posts_body');
    element.find('.sn').html(size);
    element.find('.act').attr('name', 'activity' + size);
    element.find('.kept').attr('name', 'kept' + size);
    element.find('.dur').attr('name', 'duration' + size);
    element.find('.comm').attr('name', 'comments' + size);
    element.find('.date_picker').attr('name', 'date_picker' + size);
  });
  jQuery(document).delegate('a.delete-record', 'click', function(e) {
    e.preventDefault();    
    var didConfirm = confirm("Are you sure You want to delete");
    if (didConfirm == true) {
      var id = jQuery(this).attr('data-id');
      var targetDiv = jQuery(this).attr('targetDiv');
      jQuery('#rec-' + id).remove();
      $('#tbl_posts_body tr').each(function(index){
        $(this).find('span.sn').html(index+1);
      });
      return true;
    } else {
      return false;
    }
  });
});