echo [compiling...]
rm client server
gcc -o server server.c
gcc -o client client.c
echo [starting server...]
./server 127.0.0.1 8000
