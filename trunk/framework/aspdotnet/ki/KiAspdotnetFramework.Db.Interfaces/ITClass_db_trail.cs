namespace Class_db_trail
  {
  public interface ITClass_db_trail
    {
    void MimicTraditionalInsertOnDuplicateKeyUpdate(string target_table_name, string key_field_name, string key_field_value, string childless_field_assignments_clause);
    void MimicTraditionalInsertOnDuplicateKeyUpdate(string target_table_name, string key_field_name, string key_field_value, string childless_field_assignments_clause, string additional_match_condition);
    string Saved(string action);
    }
  }