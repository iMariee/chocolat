##
## EPITECH PROJECT, 2023
## Makefile
## File description:
## makefile
##

SRC	=	./main.c	\

OBJ	=	$(SRC:.c=.o)

REM	=	*.gcno	\
		*.gcda

CC	=	gcc

CFLAGS	=	-Wall -Wextra

CPPFLAGS	=	-I./include

NAME	=	test

all:	$(NAME)

$(NAME):	$(OBJ)
	$(CC) -o $(NAME) $(OBJ) $(CFLAGS) $(CPPFLAGS)

clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(NAME)

re: fclean all clean

.PHONY: fclean all clean re
