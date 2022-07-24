function Button_submit_Click()
  {
  if (Page_ClientValidate())
    {
    $.post('NewUserRegistration',$('#Form_control').serialize())
      .success
        (
        function() {}
        )
      .error
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
