build container: `docker build -t <container-name> -f <dockerfile> .`  
-t is the name of the container, -f is the dockerfile to use.  
run container: `docker run -v $HOME/code:$HOME/code -it -p 8080:8080 <container-name>`  
This mounts the $HOME/code directory to the container's $HOME/code directory and maps port 8080 on the host to port 8080 in the container.  
start container: `docker start -ai <container-name>`  
-ai is for interactive mode, -a is for attaching to the container's output.  
