include_recipe "monit"

template node["monit"]["main_config_path"] do
  owner  "root"
  group  "root"
  mode   "0700"
  source "monitrc.erb"
end

# build default monitrc files
node["monit"]["configs"].each do |conf|
  monit_monitrc conf do
  	template_cookbook "monit-ops"
    variables(:category => "system")
  end
end

