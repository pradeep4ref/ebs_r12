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

