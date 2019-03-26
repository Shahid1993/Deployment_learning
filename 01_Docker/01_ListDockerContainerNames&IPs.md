# List Docker Container Names and IPs 
```shell
function drips(){
    docker ps -q | xargs -n 1 docker inspect --format '{{ .NetworkSettings.IPAddress }} {{ .Name }}' | sed 's/ \// /'
}
```



and if you are (fortunate enough to be?) on Windows:
```shell
(docker ps -q | ForEach-Object { docker inspect $_ --format '{{ .NetworkSettings.IPAddress }} {{ .Name }}' }).replace('/','')
```



To Show all ips and name in the new docker :
```shell
docker ps -q | xargs -n 1 docker inspect --format '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}} {{ .Name }}' | sed 's/ \// /'
```




  I wanted to get the container's port as well, so I added the following to my .bashrc:
```shell
function dip() {
        if [ -z $1 ]; then
                docker ps -a --format "{{.ID}}" | while read -r line ; do
                        echo $line $(docker inspect --format "{{ .Name }} {{ .NetworkSettings.Networks.bridge.IPAddress }}" $line | sed 's/\///'):$(docker port "$line" | grep -o "0.0.0.0:.*" | cut -f2 -d:)
                done
        else
                echo $(docker inspect --format "{{.ID }} {{ .Name }} {{ .NetworkSettings.Networks.bridge.IPAddress }}" $1 | sed 's/\///'):$(docker port "$1" | grep -o "0.0.0.0:.*" | cut -f2 -d:)
        fi
}
```
Running `dip` in the command line prints out all container's ID, name, IP, and port, and running `dip [id]` prints out just that container's ID, name, IP, and port.
