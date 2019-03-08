#!/usr/bin/env bash
#FIXME. both updated(pdnsd and dnscrypt-proxy-2) if one config changed.

service_name="$1"
if [[ -z $service_name ]]; then
    echo "usage: $0 service_name"
    exit 1
fi

config_name=$(docker service inspect --format '{{(index .Spec.TaskTemplate.ContainerSpec.Configs 0).ConfigName }}' $service_name)

if [[ -z "$config_name" ]]; then
    echo "get service $service_name first config failed"
    exit 1
fi
now_version=${config_name##*-}
new_version=$((now_version+1))
echo "version, now=$now_version, new=$new_version"

name=$(echo ${config_name%%-*} | tr 'a-z' 'A-Z')
eval "${name}_CONFIG_VERSION=$new_version"
export ${name}_CONFIG_VERSION
docker stack deploy -c ./dnscrypt.yml dnscrypt
if [[ $? -eq 0 ]]; then
    docker config rm $config_name
fi
