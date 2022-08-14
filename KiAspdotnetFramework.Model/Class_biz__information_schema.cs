using Class_db__information_schema;

namespace Class_biz__information_schema
  {
  public class TClass_biz__information_schema
    {

    private readonly ITClass_db__information_schema db__information_schema = null;

    public TClass_biz__information_schema // CONSTRUCTOR
      (
      ITClass_db__information_schema db__information_schema_imp
      )
      : base()
      {
      db__information_schema = db__information_schema_imp;
      }

    public string EngineStatus()
      {
      return db__information_schema.EngineStatus();
      }

    }
  }