unit Class_biz_scheduled_tasks;

interface

type
  TClass_biz_scheduled_tasks = class
  private
  public
    constructor Create;
    procedure DoDailyChores;
  end;

implementation

constructor TClass_biz_scheduled_tasks.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
end;

procedure TClass_biz_scheduled_tasks.DoDailyChores;
begin
   // Call db class methods to perform chores.
end;

end.
