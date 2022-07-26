function Button_submit_Click()
  {
  if (Page_ClientValidate())
    {
    $.post('api/NewUserRegistration',$('#Form_control').serialize())
      .done
        (
        function() {}
        )
      .fail
        (
        function
          (
          data,
          msg,
          detail
          )
          {
          alert(data + '\n' + msg + '\n' + detail)
          }
        )
      ;
    }
  return false;
  }
