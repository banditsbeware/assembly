// lab6: client.c
// author: david rademacher
// modified from

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <sys/socket.h>
#include <arpa/inet.h>

#define STRLENGTH 2000

int main(int argc, char* argv[]) {

    // handle inputs
    if (argc != 3) {
        printf("usage: ./client [ip] [port]\n");
        return EXIT_FAILURE;
    }
    uint32_t port = (uint32_t) atoi(argv[2]);

    int socket_desc;
    struct sockaddr_in server_addr;
    char server_message[STRLENGTH];
    char client_message[STRLENGTH];

    // clean buffers
    memset(server_message, '\0', sizeof(server_message));
    memset(client_message, '\0', sizeof(client_message));

    // create socket
    socket_desc = socket(AF_INET, SOCK_STREAM, 0);
    if (socket_desc < 0) {
        printf("error creating socket\n");
        return EXIT_FAILURE;
    }
    printf("socket created successfully\n");

    // set up port and IP
    server_addr.sin_family = AF_INET;
    server_addr.sin_port = htons(port);
    server_addr.sin_addr.s_addr = inet_addr(argv[1]);

    // request connection to server
    if (connect(socket_desc, (struct sockaddr*)&server_addr, sizeof(server_addr)) < 0) {
        printf("unable to connect to server\n");
        // return EXIT_FAILURE;
    }
    printf("connected to server successfully\n");

    // communication loop with server
    int input_length, packet_length;
    uint8_t check, byte;
    while (1) {
        // get user message
        input_length = 0;
        printf("message: ");
        fgets(client_message, sizeof(client_message), stdin);
        input_length = strlen(client_message)-1;
        client_message[input_length] = '\0';

        // create packet
        packet_length = input_length + 3;
        uint8_t packet[packet_length];
        packet[0] = 0xAA;
        packet[1] = packet_length;
        check = packet[0] ^ packet[1];

        // fill packet
        for (int i=0; i<input_length; i++) {
            byte = (uint8_t) client_message[i];
            packet[i+2] = byte;
            check ^= byte;
        }
        packet[packet_length - 1] = check;

        // print packet to client
        printf("outgoing packet: ");
        for (int i=0; i<packet_length; i++) printf("%02hhX ", packet[i]);
        printf("\n");

        // send to server
        if (send(socket_desc, packet, strlen((char *)packet), 0) < 0) {
         printf("unable to send message\n");
         return EXIT_FAILURE;
        }

        // receive response from server
        if (recv(socket_desc, server_message, sizeof(server_message), 0) < 0) {
         printf("error receiving response from server\n");
         return EXIT_FAILURE;
        }

        printf("server's response: %s\n", server_message);

    }

    //close(socket_desc);

    return EXIT_SUCCESS;
}
