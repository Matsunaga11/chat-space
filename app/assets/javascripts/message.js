$(function(){
  var message_list = $(".RightContents__Bottom");
    function buildHTML(message){
            if ( message.body === null  )
        {var html = `<span class = RightContents__Bottom--word--name>
            ${ message.username }
            </span>
          <span class = RightContents__Bottom--word--time>
            ${ message.created_at }
            </span>
        <span class = RightContents__Bottom--word--pic>
              image_tag ${ message.image }, alt:"picture", height: "50", width: "50"
              </span>`
        message_list.append(html)
         };
            if (message.image.url === null )
        {var html2 = `<span class = RightContents__Bottom--word--name>
            ${ message.username }
            </span>
          <span class = RightContents__Bottom--word--time>
            ${ message.created_at }
            </span>
        <span class = RightContents__Bottom--word--text>
               ${ message.body }
               </span>`
         message_list.append(html2);
        }
    }
    function flash() {
      var html = '<div class="flash flash__notice"><span class = sentence>メッセージを送信しました</span></div>'
      $('body').append(html);
      $('.flash').fadeIn(500).fadeOut(5000);
      setTimeout(function(){
       $('.flash').remove();
      },2500);
    };
  $('#new_message').on('submit', function(e){
    e.preventDefault();
    console.log(this)
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $('.RightContents__Bottom--Mbox--Send').removeAttr('data-disable-with');
      $.ajax({
        url: url,
        type: "POST",
        data: formData,
        dataType: 'json',
        processData: false,
        contentType: false
      })
      .done(function(data){
        console.log(data);
        var html = buildHTML(data);
        $('.RightContents__Bottom--Mbox--inputword').val('');
        $('.RightContents__Bottom--Mbox--Awesome').val('');
        flash();
        var num = 0;
        $('.RightContents__Bottom--Mbox--Send').on('click', function() {
        $('.RightContents__Bottom').append('<p>' + (num++) + '</p>');
        $('.RightContents__Bottom').animate({scrollTop: $('.RightContents__Bottom')[0].scrollHeight}, 'fast');
       });
      })
     .fail(function() {
      alert('メッセージを送信できません');
   });
     return false;
  });
});
