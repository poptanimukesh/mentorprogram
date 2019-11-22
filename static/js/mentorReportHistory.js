$(document).ready(function(){
  $(document).on('click', '#submit', (function(e) {
    var mentor_id = $('#inputState').find('option:selected').attr('id');
    var start_range = $('#start_range').val();
    var end_range = $('#end_range').val();
 		var object = {
      'mentor_id': mentor_id,
      'start_range': start_range,
      'end_range': end_range
    };
 		
    $.ajax({
      url: '/polls/viewSubmittedMentorReport/',
      dataType: 'text',
      type: 'post',
      contentType: 'application/x-www-form-urlencoded',
      data: object,
      success: function( data, textStatus, jQxhr ){
        
        data = JSON.parse(data);
        var recordLength = Object.keys(data).length;
        if(recordLength > 0) {
          var mentor_history = '<div class="accordion" id="mentorHistoryAccordion">';

          $.each(data,function(index,value){  //report_history
            mentor_history +='<div class="card">';
            mentor_history += '<div class="card-header" id = ' + value['activity_summary']['report_id'] + '><h2 class="mb-0">';
            mentor_history += '<button class="btn btn-link custom-btn" type="button" data-toggle="collapse" data-target=' + value['collapse_mentor'] + ' aria-expanded="true" aria-controls='+ value['aria_mentor'] + '>' + value['month'] + ' - ' + value['year'] + '</button></h2></div>';
            mentor_history += '<div id= '  + value['aria_mentor'] + ' class="collapse" aria-labelledby= ' +  value['activity_summary']['report_id'] + ' data-parent="#mentorHistoryAccordion">';
            mentor_history += '<div class="card-body"> <h5>Monthly call attended: '+ value['activity_summary']['callattended'] + ' </h5>';
            mentor_history += '<table class="table table-sm table-striped"><thead><tr><th scope="col">#</th>';
            mentor_history += '<th scope="col">Meeting/Activity Scheduled</th><th scope="col">Attended</th>';
            mentor_history += '<th scope="col">Date</th><th scope="col">Hours/Minutes</th>';
            mentor_history += '<th scope="col">Comments (Include goals set, accomplishments, issues)</th></tr></thead><tbody>';
            var id = 1;
            $.each(value['activities'], function (idx, val) {
              mentor_history += '<tr><th scope="row">' + id + '</th>';
              mentor_history += '<td> '+ val['activity_type'] + '</td>';
              mentor_history += '<td> ' + val['iskept'] + '</td>';
              mentor_history += '<td> ' + val['date'] + '</td>';
              mentor_history += '<td> ' + val['duration'] + '</td>';
              mentor_history+= '<td> ' + val['comments'] + '</td></tr>';
            });
            mentor_history += '</tbody></table></div></div></div>';
          });
          mentor_history += '</div>';

          $('#demo').html(mentor_history);
        }

      },
      error: function( jqXhr, textStatus, errorThrown ){
        console.log( errorThrown );
      }
    });
  }));
});