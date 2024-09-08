select *,
'{{invocation_id}}' as Invocation_id
from {{source("flake1","USERS")}}
