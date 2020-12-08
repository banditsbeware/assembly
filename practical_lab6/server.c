// lab6: server.c
// author: david rademacher

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <sys/socket.h>
#include <arpa/inet.h>

#define MAXLENGTH 2000

int main(int argc, char* argv[]) {
 // handle inputs
 if (argc != 3) {
     printf("usage: ./server [ip] [port]\n");
     return EXIT_FAILURE;
 }
 uint32_t port = (uint32_t) atoi(argv[2]);

 int socket_desc, client_sock, client_size, msglen, msg_valid;
 struct sockaddr_in server_addr, client_addr;
 char server_message[MAXLENGTH];
 char client_message[MAXLENGTH];
 char print_buffer[MAXLENGTH];
 uint8_t client_check, client_packet[MAXLENGTH + 3];

 // clean buffers
 memset(server_message, '\0', sizeof(server_message));
 memset(client_message, '\0', sizeof(client_message));
 memset(client_packet,  '\0', sizeof(client_packet));

 // create socket
 socket_desc = socket(AF_INET, SOCK_STREAM, 0);
 if (socket_desc < 0) {
  printf("error creating socket\n");
  return EXIT_FAILURE;
 }
 printf("socket created successfully\n");

 // set up port and ip
 server_addr.sin_family = AF_INET;
 server_addr.sin_family = htons(port);
 server_addr.sin_family = inet_addr(argv[1]);

 // bind to port and ip
 if (bind(socket_desc, (struct sockaddr*)&server_addr, sizeof(server_addr)) < 0) {
  printf("unable to bind to port %d\n", port);
  return EXIT_FAILURE;
 }
 printf("bound to port %d successfully\n", port);

 // listening loop
 while (1) {
  if (listen(socket_desc, 1) < 0) {
   printf("error while listening\n");
   return EXIT_FAILURE;
  }
  printf("listening for incoming connections...\n");

  // accept incoming connections
  client_size = sizeof(client_addr);
  client_sock = accept(socket_desc, (struct sockaddr*)&client_addr, &client_size);
  if (client_sock < 0) {
   printf("unable to accept client\n");
   continue; // return EXIT_FAILURE;
  }
  printf("client connected at %s:%i\n", inet_ntoa(client_addr.sin_addr), ntohs(client_addr.sin_port));

  // receive incoming message
  if (recv(client_sock, client_packet, sizeof(client_packet), 0) < 0) {
   printf("unable to receive packet\n");
   continue; // return EXIT_FAILURE;
  }
  printf("client packet received\n");

  // check packet validity
  msg_valid = 0;
  if (client_packet[0] == 0xAA) {
   client_check = 0xAA;
   msglen = strlen((char *) client_packet);
   for (int i=1; i < msglen-1; i++) client_check ^= client_packet[i];

   if (client_packet[msglen-1] == client_check) {
    for (int i=2; i < msglen-2; i++) print_buffer[i-2] = (char) client_packet[i];
    printf("client message: %s\n", print_buffer);
    strcpy(server_message, "message received");
    msg_valid = 1;
   }
  }
  if (!msg_valid) strcpy(server_message, "message rejected: invalid packet");

  // respond to client
  if (send(client_sock, server_message, strlen(server_message), 0) < 0) printf("error responding to client\n");
 }
}
