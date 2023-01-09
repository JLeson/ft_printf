NAME		=	libftprintf.a
CC			=	gcc
CFLAGS		=	-Wall -Werror -Wextra
RM			=	rm -f

LIBFTDIR	=	./libft/
SRCDIR		=	./src/
LIBDIR		=	./lib/
OBJDIR 		= 	./bin/
INCLUDEDIR	=	./include/

LIBFTNAME	=	libft.a
SRCFILES	= 	ft_printf.c

OBJFILES	=	$(SRCFILES:.c=.o)

SRCS		=	$(addprefix $(SRCDIR), $(SRCFILES))
OBJS		=	$(addprefix $(OBJDIR), $(OBJFILES))

all:		$(NAME)

$(NAME):	$(OBJS)
				@cp $(LIBDIR)$(LIBFTNAME) ./$(NAME)
				ar rcs $(NAME) $(OBJS)

$(OBJDIR)%.o:	$(SRCDIR)%.c $(LIBDIR)$(LIBFTNAME)
				@mkdir -p $(OBJDIR)
				$(CC) $(CFLAGS) -I $(INCLUDEDIR) -c $< -o $@

$(LIBDIR)$(LIBFTNAME):
				$(MAKE) -C $(LIBFTDIR)

clean:
				$(RM) $(OBJS)

fclean:			clean
				$(RM) $(NAME)
				$(MAKE) fclean -C $(LIBFTDIR)

re:				fclean $(NAME)

.PHONY:			all clean fclean re