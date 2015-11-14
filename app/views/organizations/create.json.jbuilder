json.organization do
  json.id @organization.id
  json.name @organization.name
  json.owner @organization.owner

end

json.auth_token @owner.auth_token