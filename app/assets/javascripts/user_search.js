$(function() {
  function buildHTML(user){
    var user_name = `<div class="chat-group-user clearfix">
    <p class="chat-group-user__name"> ${ user.username } </p>
    <a class="user-search-add chat-group-user__btn chat-group-user__btn--add", data-user-id= ${ user.id }, data-user-name= ${user.username}>追加</a>
    </div>`
    $("#user-search-result").append(user_name);
  };

  function GroupMember(user, id){
    var user_list = `<div class='chat-group-user clearfix js-chat-member' id='chat-group-user-8'>
    <input name='group[user_ids][]' type='hidden' value= ${id} >
    <p class='chat-group-user__name'> ${user} </p>
    <a class='user-search-remove chat-group-user__btn chat-group-user__btn--remove js-remove-btn, data-user-id= ${ user.id }, data-user-name= ${user.username}'>削除</a>
    </div>`
    $(".chat-group-useradded").append(user_list);
  };

  $(document).on("click", ".user-search-add", function() {
      console.log(this);
      $(this).parent().remove();
      var add_user = $(this).attr("data-user-name");
      var add_id = $(this).attr("data-user-id");
      GroupMember(add_user, add_id);
  });

  $(document).on("click", ".user-search-remove", function() {
      $(this).parent().remove();
  });

  $(document).ready( function( ){
  element = document.getElementsByClassName('name')
  $(function() {
  for (var i=0; i<element.length; i++) {
    user0 = (element[i])
    user0_value=(user0["value"]).split('|')
    user_name = (user0_value[0]); //userのname
    user_id = (user0_value[1]); //userのid
    var added_user_list = `<div class='chat-group-user clearfix js-chat-member' id='chat-group-user-8'>
    <input name='group[user_ids][]' type='hidden' value= ${user_id}  >
    <p class='chat-group-user__name'> ${user_name} </p>
    <a class='user-search-remove chat-group-user__btn chat-group-user__btn--remove js-remove-btn, data-user-id= ${user_id}, data-user-name= ${user_name}'>削除</a>
    </div>`
    $(".chat-group-useradded").append(added_user_list);
  }
});

  $('#user-search-field').on('keyup', function(e){
    e.preventDefault();
    console.log(this);
    var input = $("#user-search-field").val();
    if(input == ('')){
      $('#user-search-result').find('div').remove();
    }else{
      $.ajax({
        url: '/users',
        type: "GET",
        data: ('keyword=' + input),
        dataType: 'json',
        processData: false,
        contentType: false
      })
      .done(function(data){
        console.log(this);
        $('#user-search-result').find('div').remove();
        $(data).each(function(i, user){
          buildHTML(user)
        });
      })
      .fail(function() {
        alert('ユーザー検索に失敗しました');
      });
    }
  });
});
});
