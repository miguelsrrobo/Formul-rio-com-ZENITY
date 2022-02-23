#/usr/bin/env bash

#Menu do formulário
dados=$(zenity --forms 					\
	--title='Formulario' 				\
	--text='Formulario para criação de usuario'	\
	--add-entry='Nome' 				\
	--add-entry='Sobre-nome' 			\
	--add-password='Senha'				\
	--separator=','					\
	--ok-label='Enviar'
)

if [ "$?" -eq '1' ]; then
	exit 0
fi

nome_sobrenome=$(cut -d ',' -f 1 ,2 <<< "$dados" | sed 's/,/ /g')
senha=$(cut -d ',' -f 3 <<< "$dados")

if [ -z "$senha" ]; then
	zenity --error --text="O campo senha esta NULO."
fi

zenity --info --title="Campos de informação." --text="O seu nome é: $nome_sobrenome\nA sua senha é: $senha"
