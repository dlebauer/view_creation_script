## to be run as postgres user sudo -u postgres
cat pgsql_datetimefns.sql | psql bety
cat traitsview/traitsview_attached_to_issue_615.sql | psql bety
cat mgmtview/mgmtview.sql | psql bety
cat yieldsview/yieldsview_attached_to_issue_615.sql | psql bety
