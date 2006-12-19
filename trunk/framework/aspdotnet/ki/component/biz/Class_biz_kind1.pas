unit Class_biz_kind1s;

interface

uses
  Class_db_kind1s;

type
  TClass_biz_kind1s = class
  private
    db_kind1s: TClass_db_kind1s;
  public
    constructor Create;
    function AffiliateNumOfId(id: string): string;
    procedure BindDropDownList
      (
      kind3_user_id: string;
      target: system.object;
      be_unfiltered: boolean = FALSE
      );
    procedure GetProfile
      (
      affiliate_num: string;
      out name: string;
      out be_qrs: boolean;
      out be_bls_amb: boolean;
      out be_als_amb: boolean;
      out be_als_squad: boolean;
      out be_air_amb: boolean;
      out be_rescue: boolean;
      out address_line_1: string;
      out address_line_2: string;
      out city: string;
      out zip_code: string;
      out federal_tax_id_num: string;
      out contact_person_name: string;
      out contact_person_phone_num: string;
      out be_valid_profile: boolean
      );
    function NameOf(kind1_id: string): string;
    procedure SetProfile
      (
      affiliate_num: string;
      name: string;
      be_qrs: string;
      be_bls_amb: string;
      be_als_amb: string;
      be_als_squad: string;
      be_air_amb: string;
      be_rescue: string;
      address_line_1: string;
      address_line_2: string;
      city: string;
      zip_code: string;
      federal_tax_id_num: string;
      contact_person_name: string;
      contact_person_phone_num: string
      );
  end;

implementation

constructor TClass_biz_kind1s.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
  db_kind1s := TClass_db_kind1s.Create;
end;

function TClass_biz_kind1s.AffiliateNumOfId(id: string): string;
begin
  AffiliateNumOfId := db_kind1s.AffiliateNumOfId(id);
end;

procedure TClass_biz_kind1s.BindDropDownList
  (
  kind3_user_id: string;
  target: system.object;
  be_unfiltered: boolean = FALSE
  );
begin
  db_kind1s.BindDropDownList(kind3_user_id,target,be_unfiltered);
end;

procedure TClass_biz_kind1s.GetProfile
  (
  affiliate_num: string;
  out name: string;
  out be_qrs: boolean;
  out be_bls_amb: boolean;
  out be_als_amb: boolean;
  out be_als_squad: boolean;
  out be_air_amb: boolean;
  out be_rescue: boolean;
  out address_line_1: string;
  out address_line_2: string;
  out city: string;
  out zip_code: string;
  out federal_tax_id_num: string;
  out contact_person_name: string;
  out contact_person_phone_num: string;
  out be_valid_profile: boolean
  );
begin
  db_kind1s.GetProfile
    (
    affiliate_num,
    name,
    be_qrs,
    be_bls_amb,
    be_als_amb,
    be_als_squad,
    be_air_amb,
    be_rescue,
    address_line_1,
    address_line_2,
    city,
    zip_code,
    federal_tax_id_num,
    contact_person_name,
    contact_person_phone_num,
    be_valid_profile
    );
end;

function TClass_biz_kind1s.NameOf(kind1_id: string): string;
begin
  NameOf := db_kind1s.NameOf(kind1_id);
end;

procedure TClass_biz_kind1s.SetProfile
  (
  affiliate_num: string;
  name: string;
  be_qrs: string;
  be_bls_amb: string;
  be_als_amb: string;
  be_als_squad: string;
  be_air_amb: string;
  be_rescue: string;
  address_line_1: string;
  address_line_2: string;
  city: string;
  zip_code: string;
  federal_tax_id_num: string;
  contact_person_name: string;
  contact_person_phone_num: string
  );
begin
  db_kind1s.SetProfile
    (
    affiliate_num,
    name,
    be_qrs,
    be_bls_amb,
    be_als_amb,
    be_als_squad,
    be_air_amb,
    be_rescue,
    address_line_1,
    address_line_2,
    city,
    zip_code,
    federal_tax_id_num,
    contact_person_name,
    contact_person_phone_num
    );
end;

end.
