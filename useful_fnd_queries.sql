-- User active assignments
SELECT fu.user_name
     , fr.responsibility_id
     , fr.responsibility_name
     , furg.start_date       asgn_start_date
     , furg.end_date         asgn_end_date
     , furg.creation_date    asgn_creation_date
     , furg.last_update_date asgn_last_update_date
  FROM apps.fnd_user fu
     , apps.fnd_responsibility_vl fr
     , apps.fnd_user_resp_groups_direct furg
 WHERE SYSDATE BETWEEN NVL(fu.start_date, SYSDATE - 1)
                   AND NVL(fu.end_date, SYSDATE + 1)
   AND fu.user_name = 'PMOGANTI'
   AND furg.user_id = fu.user_id
   AND SYSDATE BETWEEN NVL(fr.start_date, SYSDATE - 1)
                   AND NVL(fr.end_date, SYSDATE + 1)
   AND furg.responsibility_application_id = fr.application_id
   AND furg.responsibility_id = fr.responsibility_id
   AND SYSDATE BETWEEN NVL(furg.start_date, SYSDATE - 1)
                   AND NVL(furg.end_date, SYSDATE + 1)
 ORDER BY fu.user_name, furg.creation_date DESC;

-- Request Group Assignment
SELECT fr.responsibility_name
      ,frg.request_group_name
      ,fap.application_name
      ,frgu.request_unit_type
      ,frgu.request_unit_id
      ,fcpt.user_concurrent_program_name
  FROM fnd_responsibility_vl fr
      ,fnd_application_vl fap
      ,fnd_request_groups frg
      ,fnd_request_group_units frgu
      ,fnd_concurrent_programs_vl fcpt
 WHERE frg.request_group_id = fr.request_group_id
   AND frg.application_id = fap.application_id
   AND frgu.request_group_id = frg.request_group_id
   AND fcpt.concurrent_program_id = frgu.request_unit_id
   AND fcpt.user_concurrent_program_name = 'GL SubLedger Period Status Report'
ORDER BY 1,2,3,4;
