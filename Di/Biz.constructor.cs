using System;
using System.Security.Claims;

namespace OscarDotNet.Engine.Di
  {
  public partial class Biz
    {

    public Biz // CONSTRUCTOR
      (
      Func<ClaimsIdentity> userClaimsIdentityFn_imp,
      Os os
      )
      {
      userClaimsIdentityFn = userClaimsIdentityFn_imp;
      //
      // Compose CourseDb0 classes -- classes that have no compositional dependencies.
      //
      db__information_schema__provisioner = new(() => new());
      db_availabilities__provisioner = new(() => new());
      db_field_situations__provisioner = new(() => new());
      db_medical_aspirational_phases__provisioner = new(() => new());
      db_medical_release_levels__provisioner = new(() => new());
      db_oscalert_logs__provisioner = new(() => new());
      db_privileges__provisioner = new(() => new());
      db_radio_dispatches__provisioner = new(() => new());
      db_tiers__provisioner = new(() => new());
      db_trail__provisioner = new(() => new());
      db_user__provisioner = new(() => new());
      dbhomedb_trail__provisioner = new(() => new());
      dbkeyclick_trail__provisioner = new(() => new());
      dbkeyclick_trail__provisioner = new(() => new());
      //
      // Compose CourseDb1 classes -- classes that have a single compositional dependency from CourseDb0.
      //
      db_accounts__provisioner = new(() => new(db_trail_imp: db_trail__provisioner.Value));
      db_agencies__provisioner = new(() => new(db_trail_imp: db_trail__provisioner.Value));
      db_agency_satellite_stations__provisioner = new(() => new(db_trail_imp: db_trail__provisioner.Value));
      db_capcode_unit_maps__provisioner = new(() => new(db_trail_imp: db_trail__provisioner.Value));
      db_care_skill_ratings__provisioner = new(() => new(db_trail_imp: db_trail__provisioner.Value));
      db_care_skills__provisioner = new(() => new(db_trail_imp: db_trail__provisioner.Value));
      db_chassis_makes__provisioner = new(() => new(db_trail_imp: db_trail__provisioner.Value));
      db_chassis_models__provisioner = new(() => new(db_trail_imp: db_trail__provisioner.Value));
      db_cities__provisioner = new(() => new(dbkeyclick_trail_imp: dbkeyclick_trail__provisioner.Value));
      db_crew_shift_vehicles__provisioner = new(() => new(db_trail_imp: db_trail__provisioner.Value));
      db_custom_makes__provisioner = new(() => new(db_trail_imp: db_trail__provisioner.Value));
      db_custom_models__provisioner = new(() => new(db_trail_imp: db_trail__provisioner.Value));
      db_donations__provisioner = new(() => new(dbkeyclick_trail_imp: dbkeyclick_trail__provisioner.Value));
      db_driver_skill_ratings__provisioner = new(() => new(db_trail_imp: db_trail__provisioner.Value));
      db_driver_skills__provisioner = new(() => new(db_trail_imp: db_trail__provisioner.Value));
      db_efficipay_dockets__provisioner = new(() => new(db_trail_imp: db_trail__provisioner.Value));
      db_efficipay_tokens__provisioner = new(() => new(dbhomedb_trail_imp: dbhomedb_trail__provisioner.Value));
      db_ephemeral_dispatches__provisioner = new(() => new(db_trail_imp: db_trail__provisioner.Value));
      db_eval_statuses__provisioner = new(() => new(db_trail_imp: db_trail__provisioner.Value));
      db_evals__provisioner = new(() => new(db_trail_imp: db_trail__provisioner.Value));
      db_fuels__provisioner = new(() => new(db_trail_imp: db_trail__provisioner.Value));
      db_gripes__provisioner = new(() => new(db_trail_imp: db_trail__provisioner.Value));
      db_incident_nature_translations__provisioner = new(() => new(db_trail_imp: db_trail__provisioner.Value));
      db_incident_natures__provisioner = new(() => new(db_trail_imp: db_trail__provisioner.Value));
      db_indicator_median_length_of_service__provisioner = new(() => new(db_trail_imp: db_trail__provisioner.Value));
      db_indicator_monthly_vehicles_up_and_current__provisioner = new(() => new(db_trail_imp: db_trail__provisioner.Value));
      db_indicator_shiftwise_vehicles_up_and_current__provisioner = new(() => new(db_trail_imp: db_trail__provisioner.Value));
      db_leaves__provisioner = new(() => new(db_trail_imp: db_trail__provisioner.Value));
      db_love_letter_batches__provisioner = new(() => new(dbkeyclick_trail_imp: dbkeyclick_trail__provisioner.Value));
      db_manifest__provisioner = new(() => new(dbkeyclick_trail_imp: dbkeyclick_trail__provisioner.Value));
      db_milestones__provisioner = new(() => new(db_trail_imp: db_trail__provisioner.Value));
      db_patient_age_units__provisioner = new(() => new(db_trail_imp: db_trail__provisioner.Value));
      db_patient_encounter_levels__provisioner = new(() => new(db_trail_imp: db_trail__provisioner.Value));
      db_patient_encounters__provisioner = new(() => new(db_trail_imp: db_trail__provisioner.Value));
      db_post_cardinalities__provisioner = new(() => new(db_trail_imp: db_trail__provisioner.Value));
      db_rank_groups__provisioner = new(() => new(db_trail_imp: db_trail__provisioner.Value));
      db_ranks__provisioner = new(() => new(db_trail_imp: db_trail__provisioner.Value));
      db_residents__provisioner = new(() => new(db_agencies_imp: db_agencies__provisioner.Value));
      db_role_member_map__provisioner = new(() => new(db_trail_imp: db_trail__provisioner.Value));
      db_role_notification_map__provisioner = new(() => new(db_trail_imp: db_trail__provisioner.Value));
      db_role_privilege_map__provisioner = new(() => new(db_trail_imp: db_trail__provisioner.Value));
      db_roles__provisioner = new(() => new(db_trail_imp: db_trail__provisioner.Value));
      db_scenes_reached__provisioner = new(() => new(db_trail_imp: db_trail__provisioner.Value));
      db_schedule_assignment_logs__provisioner = new(() => new(db_trail_imp: db_trail__provisioner.Value));
      db_shifts__provisioner = new(() => new(db_trail_imp: db_trail__provisioner.Value));
      db_skill_ratings__provisioner = new(() => new(db_trail_imp: db_trail__provisioner.Value));
      db_sms_gateways__provisioner = new(() => new(db_trail_imp: db_trail__provisioner.Value));
      db_states__provisioner = new(() => new(dbkeyclick_trail_imp: dbkeyclick_trail__provisioner.Value));
      db_streets__provisioner = new(() => new(dbkeyclick_trail_imp: dbkeyclick_trail__provisioner.Value));
      db_subjoined_attributes__provisioner = new(() => new(db_trail_imp: db_trail__provisioner.Value));
      db_tapouts__provisioner = new(() => new(db_trail_imp: db_trail__provisioner.Value));
      db_trespasses__provisioner = new(() => new(dbkeyclick_trail_imp: dbkeyclick_trail__provisioner.Value));
      db_uniform_catalogs__provisioner = new(() => new(db_trail_imp: db_trail__provisioner.Value));
      db_uniform_classes__provisioner = new(() => new(db_trail_imp: db_trail__provisioner.Value));
      db_uniform_option_categories__provisioner = new(() => new(db_trail_imp: db_trail__provisioner.Value));
      db_uniform_piece_colors__provisioner = new(() => new(db_trail_imp: db_trail__provisioner.Value));
      db_uniform_piece_makes__provisioner = new(() => new(db_trail_imp: db_trail__provisioner.Value));
      db_uniform_piece_models__provisioner = new(() => new(db_trail_imp: db_trail__provisioner.Value));
      db_uniform_piece_vendors__provisioner = new(() => new(db_trail_imp: db_trail__provisioner.Value));
      db_uniform_pieces__provisioner = new(() => new(db_trail_imp: db_trail__provisioner.Value));
      db_uniform_priorities__provisioner = new(() => new(db_trail_imp: db_trail__provisioner.Value));
      db_user_member_map__provisioner = new(() => new(db_trail_imp: db_trail__provisioner.Value));
      db_users__provisioner = new(() => new(db_trail_imp: db_trail__provisioner.Value));
      db_vehicle_down_natures__provisioner = new(() => new(db_trail_imp: db_trail__provisioner.Value));
      db_vehicle_kinds__provisioner = new(() => new(db_trail_imp: db_trail__provisioner.Value));
      db_vehicle_quarters__provisioner = new(() => new(db_trail_imp: db_trail__provisioner.Value));
      db_vehicle_quarters_history__provisioner = new(() => new(db_trail_imp: db_trail__provisioner.Value));
      db_vehicle_usability_history__provisioner = new(() => new(db_trail_imp: db_trail__provisioner.Value));
      db_vehicles__provisioner = new(() => new(db_trail_imp: db_trail__provisioner.Value));
      //
      // Compose CourseDb2 classes -- classes that have multiple compositional dependencies from CourseDb0 through CourseDb1.
      //
      db_enrollment__provisioner = new
        (
        () => new
          (
          db_agencies_imp: db_agencies__provisioner.Value,
          db_trail_imp: db_trail__provisioner.Value
          )
        );
      db_members__provisioner = new
        (
        () => new
          (
          db_sms_gateways_imp: db_sms_gateways__provisioner.Value,
          db_agencies_imp: db_agencies__provisioner.Value,
          db_medical_release_levels_imp: db_medical_release_levels__provisioner.Value,
          db_medical_aspirational_phases_imp: db_medical_aspirational_phases__provisioner.Value,
          db_trail_imp: db_trail__provisioner.Value
          )
        );
      //
      // Compose CourseDb3 classes -- classes that have multiple compositional dependencies from CourseDb0 through CourseDb2.
      //
      db_data_conditions__provisioner = new
        (
        () => new
          (
          db_members_imp: db_members__provisioner.Value
          )
        );
      db_role_member_map_logs__provisioner = new
        (
        () => new
          (
          db_members_imp: db_members__provisioner.Value,
          db_trail_imp: db_trail__provisioner.Value,
          db_users_imp: db_users__provisioner.Value
          )
        );
      db_schedule_assignments__provisioner = new
        (
        () => new
          (
          db_medical_release_levels_imp: db_medical_release_levels__provisioner.Value,
          db_shifts_imp: db_shifts__provisioner.Value,
          db_trail_imp: db_trail__provisioner.Value
          )
        );
      //
      // Compose CourseDb4 classes -- classes that have multiple compositional dependencies from CourseDb0 through CourseDb3.
      //
      db_notifications__provisioner = new
        (
        () => new
          (
          db_data_conditions_imp: db_data_conditions__provisioner.Value,
          db_trail_imp: db_trail__provisioner.Value
          )
        );
      //
      // Compose CourseBiz0 classes -- classes that have no compositional dependencies.
      //
      crews__provisioner = new(() => new());
      leave__provisioner = new(() => new());
      publicity__provisioner = new(() => new());
      quick_messages__provisioner = new(() => new());
      scheduling__provisioner = new(() => new());
      sections__provisioner = new(() => new());
      //
      // Compose CourseBiz1 classes -- classes that have a single compositional dependency from CourseDb0 through CourseBiz0.
      //
      _information_schema__provisioner = new(() => new(db__information_schema_imp: db__information_schema__provisioner.Value));
      accounts__provisioner = new(() => new(db_accounts_imp: db_accounts__provisioner.Value));
      agency_satellite_stations__provisioner = new(() => new(db_agency_satellite_stations_imp: db_agency_satellite_stations__provisioner.Value));
      availabilities__provisioner = new(() => new(db_availabilities_imp: db_availabilities__provisioner.Value));
      capcode_unit_maps__provisioner = new(() => new(db_capcode_unit_maps_imp: db_capcode_unit_maps__provisioner.Value));
      care_skills__provisioner = new(() => new(db_care_skills_imp: db_care_skills__provisioner.Value));
      care_skill_ratings__provisioner = new(() => new(db_care_skill_ratings_imp: db_care_skill_ratings__provisioner.Value));
      chassis_makes__provisioner = new(() => new(db_chassis_makes_imp: db_chassis_makes__provisioner.Value));
      chassis_models__provisioner = new(() => new(db_chassis_models_imp: db_chassis_models__provisioner.Value));
      cities__provisioner = new(() => new(db_cities_imp: db_cities__provisioner.Value));
      crew_shift_vehicles__provisioner = new(() => new(db_crew_shift_vehicles_imp: db_crew_shift_vehicles__provisioner.Value));
      custom_makes__provisioner = new(() => new(db_custom_makes_imp: db_custom_makes__provisioner.Value));
      custom_models__provisioner = new(() => new(db_custom_models_imp: db_custom_models__provisioner.Value));
      radio_dispatches__provisioner = new(() => new(db_radio_dispatches_imp: db_radio_dispatches__provisioner.Value));
      driver_skills__provisioner = new(() => new(db_driver_skills_imp: db_driver_skills__provisioner.Value));
      driver_skill_ratings__provisioner = new(() => new(db_driver_skill_ratings_imp: db_driver_skill_ratings__provisioner.Value));
      efficipay_tokens__provisioner = new(() => new(db_efficipay_tokens_imp: db_efficipay_tokens__provisioner.Value));
      ephemeral_dispatches__provisioner = new(() => new(db_ephemeral_dispatches_imp: db_ephemeral_dispatches__provisioner.Value));
      eval_statuses__provisioner = new(() => new(db_eval_statuses_imp: db_eval_statuses__provisioner.Value));
      field_situations__provisioner = new(() => new(db_field_situations_imp: db_field_situations__provisioner.Value));
      fuels__provisioner = new(() => new(db_fuels_imp: db_fuels__provisioner.Value));
      fund_drives__provisioner = new(() => new(db_role_member_map_imp: db_role_member_map__provisioner.Value));
      incident_nature_translations__provisioner = new(() => new(db_incident_nature_translations_imp: db_incident_nature_translations__provisioner.Value));
      incident_natures__provisioner = new(() => new(db_incident_natures_imp: db_incident_natures__provisioner.Value));
      indicator_median_length_of_service__provisioner = new(() => new(db_indicator_median_length_of_service_imp: db_indicator_median_length_of_service__provisioner.Value));
      indicator_monthly_vehicles_up_and_current__provisioner = new(() => new(db_indicator_monthly_vehicles_up_and_current_imp: db_indicator_monthly_vehicles_up_and_current__provisioner.Value));
      indicator_shiftwise_vehicles_up_and_current__provisioner = new(() => new(db_indicator_shiftwise_vehicles_up_and_current_imp: db_indicator_shiftwise_vehicles_up_and_current__provisioner.Value));
      love_letter_batches__provisioner = new(() => new(db_love_letter_batches_imp: db_love_letter_batches__provisioner.Value));
      medical_aspirational_phases__provisioner = new(() => new(db_medical_aspirational_phases_imp: db_medical_aspirational_phases__provisioner.Value));
      milestones__provisioner = new(() => new(db_milestones_imp: db_milestones__provisioner.Value));
      oscalert_logs__provisioner = new(() => new(db_oscalert_logs_imp: db_oscalert_logs__provisioner.Value));
      patient_age_units__provisioner = new(() => new(db_patient_age_units_imp: db_patient_age_units__provisioner.Value));
      patient_encounters__provisioner = new(() => new(db_patient_encounters_imp: db_patient_encounters__provisioner.Value));
      patient_encounter_levels__provisioner = new(() => new(db_patient_encounter_levels_imp: db_patient_encounter_levels__provisioner.Value));
      post_cardinalities__provisioner = new(() => new(db_post_cardinalities_imp: db_post_cardinalities__provisioner.Value));
      privileges__provisioner = new(() => new(db_privileges_imp: db_privileges__provisioner.Value));
      ranks__provisioner = new(() => new(db_ranks_imp: db_ranks__provisioner.Value));
      rank_groups__provisioner = new(() => new(db_rank_groups_imp: db_rank_groups__provisioner.Value));
      residents__provisioner = new(() => new(db_residents_imp: db_residents__provisioner.Value));
      role_member_map_logs__provisioner = new(() => new(db_role_member_map_logs_imp: db_role_member_map_logs__provisioner.Value));
      shifts__provisioner = new(() => new(db_shifts_imp: db_shifts__provisioner.Value));
      skill_ratings__provisioner = new(() => new(db_skill_ratings_imp: db_skill_ratings__provisioner.Value));
      sms_gateways__provisioner = new(() => new(db_sms_gateways_imp: db_sms_gateways__provisioner.Value));
      states__provisioner = new(() => new(db_states_imp: db_states__provisioner.Value));
      streets__provisioner = new(() => new(db_streets_imp: db_streets__provisioner.Value));
      subjoined_attributes__provisioner = new(() => new(db_subjoined_attributes_imp: db_subjoined_attributes__provisioner.Value));
      tapouts__provisioner = new(() => new(db_tapouts_imp: db_tapouts__provisioner.Value));
      tiers__provisioner = new(() => new(db_tiers_imp: db_tiers__provisioner.Value));
      trespasses__provisioner = new(() => new(db_trespasses_imp: db_trespasses__provisioner.Value));
      uniform_catalogs__provisioner = new(() => new(db_uniform_catalogs_imp: db_uniform_catalogs__provisioner.Value));
      uniform_classes__provisioner = new(() => new(db_uniform_classes_imp: db_uniform_classes__provisioner.Value));
      uniform_option_categories__provisioner = new(() => new(db_uniform_option_categories_imp: db_uniform_option_categories__provisioner.Value));
      uniform_piece_colors__provisioner = new(() => new(db_uniform_piece_colors_imp: db_uniform_piece_colors__provisioner.Value));
      uniform_piece_makes__provisioner = new(() => new(db_uniform_piece_makes_imp: db_uniform_piece_makes__provisioner.Value));
      uniform_piece_models__provisioner = new(() => new(db_uniform_piece_models_imp: db_uniform_piece_models__provisioner.Value));
      uniform_piece_vendors__provisioner = new(() => new(db_uniform_piece_vendors_imp: db_uniform_piece_vendors__provisioner.Value));
      uniform_pieces__provisioner = new(() => new(db_uniform_pieces_imp: db_uniform_pieces__provisioner.Value));
      uniform_priorities__provisioner = new(() => new(db_uniform_priorities_imp: db_uniform_priorities__provisioner.Value));
      user_member_map__provisioner = new(() => new(db_user_member_map_imp: db_user_member_map__provisioner.Value));
      vehicle_down_natures__provisioner = new(() => new(db_vehicle_down_natures_imp: db_vehicle_down_natures__provisioner.Value));
      vehicle_kinds__provisioner = new(() => new(db_vehicle_kinds_imp: db_vehicle_kinds__provisioner.Value));
      vehicle_quarters__provisioner = new(() => new(db_vehicle_quarters_imp: db_vehicle_quarters__provisioner.Value));
      //
      // Compose CourseBiz2 classes -- classes that have multiple compositional dependencies from CourseDb0 through CourseBiz1.
      //
      agencies__provisioner = new
        (
        () => new
          (
          db_agencies_imp: db_agencies__provisioner.Value,
          db_agency_satellite_stations_imp: db_agency_satellite_stations__provisioner.Value,
          db_roles_imp: db_roles__provisioner.Value
          )
        );
      fleetman__provisioner = new
        (
        () => new
          (
          db_agencies_imp: db_agencies__provisioner.Value,
          db_notifications_imp: db_notifications__provisioner.Value
          )
        );
      medical_release_levels__provisioner = new
        (
        () => new
          (
          db_enrollment_imp: db_enrollment__provisioner.Value,
          db_medical_release_levels_imp: db_medical_release_levels__provisioner.Value,
          db_members_imp: db_members__provisioner.Value
          )
        );
      role_notification_map__provisioner = new
        (
        () => new
          (
          db_role_notification_map_imp: db_role_notification_map__provisioner.Value,
          db_roles_imp: db_roles__provisioner.Value
          )
        );
      role_privilege_map__provisioner = new
        (
        () => new
          (
          db_role_privilege_map_imp: db_role_privilege_map__provisioner.Value,
          db_roles_imp: db_roles__provisioner.Value
          )
        );
      user__provisioner = new
        (
        () => new
          (
          db_user_imp: db_user__provisioner.Value,
          db_users_imp: db_users__provisioner.Value,
          userClaimsIdentityFn_imp: userClaimsIdentityFn
          )
        );
      //
      // Compose CourseBiz3 classes -- classes that have multiple compositional dependencies from CourseDb0 through CourseBiz2.
      //
      manifest__provisioner = new
        (
        () => new
          (
          biz_user_imp: user__provisioner.Value,
          db_manifest_imp: db_manifest__provisioner.Value
          )
        );
      roles__provisioner = new
        (
        () => new
          (
          biz_user_imp: user__provisioner.Value,
          db_roles_imp: db_roles__provisioner.Value
          )
        );
      schedule_assignment_logs__provisioner = new
        (
        () => new
          (
          biz_tapouts_imp: tapouts__provisioner.Value,
          biz_user_imp: user__provisioner.Value,
          db_schedule_assignment_logs_imp: db_schedule_assignment_logs__provisioner.Value
          )
        );
      //
      // Compose CourseBiz4 classes -- classes that have multiple compositional dependencies from CourseDb0 through CourseBiz3.
      //
      notifications__provisioner = new
        (
        () => new
          (
          biz_crews_imp: crews__provisioner.Value,
          biz_medical_release_levels_imp: medical_release_levels__provisioner.Value,
          biz_scheduling_imp: scheduling__provisioner.Value,
          biz_user_imp: user__provisioner.Value,
          db_agencies_imp: db_agencies__provisioner.Value,
          db_chassis_models_imp: db_chassis_models__provisioner.Value,
          db_custom_models_imp: db_custom_models__provisioner.Value,
          db_evals_imp: db_evals__provisioner.Value,
          db_fuels_imp: db_fuels__provisioner.Value,
          db_members_imp: db_members__provisioner.Value,
          db_notifications_imp: db_notifications__provisioner.Value,
          db_role_member_map_imp: db_role_member_map__provisioner.Value,
          db_roles_imp: db_roles__provisioner.Value,
          db_schedule_assignments_imp: db_schedule_assignments__provisioner.Value,
          db_shifts_imp: db_shifts__provisioner.Value,
          db_users_imp: db_users__provisioner.Value,
          db_vehicle_down_natures_imp: db_vehicle_down_natures__provisioner.Value,
          db_vehicle_kinds_imp: db_vehicle_kinds__provisioner.Value,
          db_vehicle_quarters_imp: db_vehicle_quarters__provisioner.Value,
          db_vehicles_imp: db_vehicles__provisioner.Value
          )
        );
      //
      // Compose CourseBiz5 classes -- classes that have multiple compositional dependencies from CourseDb0 through CourseBiz4.
      //
      role_member_map__provisioner = new
        (
        () => new
          (
          biz_notifications_imp: notifications__provisioner.Value,
          biz_scheduling_imp: scheduling__provisioner.Value,
          biz_user_imp: user__provisioner.Value,
          db_members_imp: db_members__provisioner.Value,
          db_role_member_map_imp: db_role_member_map__provisioner.Value,
          db_role_member_map_logs_imp: db_role_member_map_logs__provisioner.Value
          )
        );
      //
      // Compose CourseBiz6 classes -- classes that have multiple compositional dependencies from CourseDb0 through CourseBiz5.
      //
      donations__provisioner = new
        (
        () => new
          (
          biz_notifications_imp: notifications__provisioner.Value,
          biz_user_imp: user__provisioner.Value,
          db_agencies_imp: db_agencies__provisioner.Value,
          db_members_imp: db_members__provisioner.Value,
          db_donations_imp: db_donations__provisioner.Value,
          db_streets_imp: db_streets__provisioner.Value
          )
        );
      efficipay_dockets__provisioner = new
        (
        () => new
          (
          biz_notifications_imp: notifications__provisioner.Value,
          db_efficipay_dockets_imp: db_efficipay_dockets__provisioner.Value,
          db_efficipay_tokens_imp: db_efficipay_tokens__provisioner.Value,
          db_members_imp: db_members__provisioner.Value,
          db_role_member_map_imp: db_role_member_map__provisioner.Value
          )
        );
      enrollment__provisioner = new
        (
        () => new
          (
          biz_notifications_imp: notifications__provisioner.Value,
          biz_role_member_map_imp: role_member_map__provisioner.Value,
          db_agencies_imp: db_agencies__provisioner.Value,
          db_enrollment_imp: db_enrollment__provisioner.Value,
          db_members_imp: db_members__provisioner.Value
          )
        );
      evals__provisioner = new
        (
        () => new
          (
          biz_notifications_imp: notifications__provisioner.Value,
          db_evals_imp: db_evals__provisioner.Value,
          db_members_imp: db_members__provisioner.Value
          )
        );
      //
      // Compose CourseBiz7 classes -- classes that have multiple compositional dependencies from CourseDb0 through CourseBiz6.
      //
      members__provisioner = new
        (
        () => new
          (
          biz_enrollment_imp: enrollment__provisioner.Value,
          biz_medical_release_levels_imp: medical_release_levels__provisioner.Value,
          biz_notifications_imp: notifications__provisioner.Value,
          biz_user_imp: user__provisioner.Value,
          db_agencies_imp: db_agencies__provisioner.Value,
          db_leaves_imp: db_leaves__provisioner.Value,
          db_members_imp: db_members__provisioner.Value,
          db_role_member_map_imp: db_role_member_map__provisioner.Value,
          db_roles_imp: db_roles__provisioner.Value,
          db_sms_gateways_imp: db_sms_gateways__provisioner.Value,
          db_users_imp: db_users__provisioner.Value
          )
        );
      //
      // Compose CourseBiz8 classes -- classes that have multiple compositional dependencies from CourseDb0 through CourseBiz7.
      //
      gripes__provisioner = new
        (
        () => new
          (
          biz_members_imp: members__provisioner.Value,
          biz_notifications_imp: notifications__provisioner.Value,
          db_gripes_imp: db_gripes__provisioner.Value,
          fs_imp: os.fs
          )
        );
      leaves__provisioner = new
        (
        () => new
          (
          biz_members_imp: members__provisioner.Value,
          biz_notifications_imp: notifications__provisioner.Value,
          db_enrollment_imp: db_enrollment__provisioner.Value,
          db_leaves_imp: db_leaves__provisioner.Value
          )
        );
      scenes_reached_distributor__provisioner = new
        (
        () => new
          (
          biz_notifications_imp: notifications__provisioner.Value,
          db_scenes_reached_imp: db_scenes_reached__provisioner.Value
          )
        );
      schedule_assignments__provisioner = new
        (
        () => new
          (
          biz_agencies_imp: agencies__provisioner.Value,
          biz_crews_imp: crews__provisioner.Value,
          biz_notifications_imp: notifications__provisioner.Value,
          biz_roles_imp: roles__provisioner.Value,
          biz_user_imp: user__provisioner.Value,
          db_agencies_imp: db_agencies__provisioner.Value,
          db_members_imp: db_members__provisioner.Value,
          db_privileges_imp: db_privileges__provisioner.Value,
          db_role_member_map_imp: db_role_member_map__provisioner.Value,
          db_schedule_assignment_logs_imp: db_schedule_assignment_logs__provisioner.Value,
          db_schedule_assignments_imp: db_schedule_assignments__provisioner.Value,
          db_shifts_imp: db_shifts__provisioner.Value
          )
        );
      scheduled_tasks__provisioner = new
        (
        () => new
          (
          biz_enrollment_imp: enrollment__provisioner.Value,
          biz_evals_imp: evals__provisioner.Value,
          biz_gripes_imp: gripes__provisioner.Value,
          biz_leaves_imp: leaves__provisioner.Value,
          biz_members_imp: members__provisioner.Value,
          biz_schedule_assignments_imp: schedule_assignments__provisioner.Value,
          biz_schedule_assignment_logs_imp: schedule_assignment_logs__provisioner.Value,
          db_availabilities_imp: db_availabilities__provisioner.Value,
          db_cities_imp: db_cities__provisioner.Value,
          db_residents_imp: db_residents__provisioner.Value,
          db_states_imp: db_states__provisioner.Value,
          db_streets_imp: db_streets__provisioner.Value,
          fs_imp: os.fs
          )
        );
      users__provisioner = new
        (
        () => new
          (
          biz_notifications_imp: notifications__provisioner.Value,
          biz_user_imp: user__provisioner.Value,
          db_members_imp: db_members__provisioner.Value,
          db_user_imp: db_user__provisioner.Value,
          db_users_imp: db_users__provisioner.Value
          )
        );
      vehicle_quarters_history__provisioner = new
        (
        () => new
          (
          biz_members_imp: members__provisioner.Value,
          db_vehicle_quarters_history_imp: db_vehicle_quarters_history__provisioner.Value
          )
        );
      vehicle_usability_history__provisioner = new
        (
        () => new
          (
          biz_members_imp: members__provisioner.Value,
          biz_notifications_imp: notifications__provisioner.Value,
          db_vehicle_usability_history_imp: db_vehicle_usability_history__provisioner.Value
          )
        );
      vehicles__provisioner = new
        (
        () => new
          (
          biz_members_imp: members__provisioner.Value,
          biz_gripes_imp: gripes__provisioner.Value,
          biz_notifications_imp: notifications__provisioner.Value,
          biz_user_imp: user__provisioner.Value,
          db_agencies_imp: db_agencies__provisioner.Value,
          db_roles_imp: db_roles__provisioner.Value,
          db_vehicle_kinds_imp: db_vehicle_kinds__provisioner.Value,
          db_vehicles_imp: db_vehicles__provisioner.Value
          )
        );
      }

    }
  }
