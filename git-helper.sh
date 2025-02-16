#!/bin/bash

# Definición de colores para mejorar la presentación en la terminal
green="\e[32m"   # Color verde para títulos
blue="\e[34m"    # Color azul para comandos
yellow="\e[33m"  # Color amarillo para explicaciones
red="\e[31m"     # Color rojo para errores
reset="\e[0m"    # Reset para restablecer el color predeterminado

#clear  # Limpia la pantalla antes de iniciar

echo "${blue}\n💻 Bienvenido al Asistente Avanzado de Git 🚀${reset}"
echo  "Este script te guiará paso a paso en el uso de Git."

# ==========================
# Sintaxis de while en Bash:
# while [ condición ]; do
#     comandos
# done
# Este bucle se ejecuta hasta que la condición deje de ser verdadera.
# En este caso, el bucle es infinito porque no tiene condición de salida explícita.
# ==========================

while true; do
    echo "\n${yellow}Selecciona una opción:${reset}"
    echo "1. Inicializar un repositorio (git init)"
    echo "2. Ver el estado del repositorio (git status)"
    echo "3. Agregar archivos al área de staging (git add)"
    echo "4. Hacer un commit (git commit)"
    echo "5. Ver historial de cambios (git log)"
    echo "6. Crear y cambiar de rama (git branch / git switch)"
    echo "7. Fusionar ramas (git merge)"
    echo "8. Subir cambios a un repositorio remoto (git push)"
    echo "9. Descargar cambios remotos (git pull)"
    echo "10. Salir"
    read -rp "👉 Ingresa el número de la opción: " opcion  # Captura la entrada del usuario

    # ==========================
    # Sintaxis de case en Bash:
    # case variable in
    #     patrón1) comandos ;;
    #     patrón2) comandos ;;
    #     *) comandos ;;  # Captura cualquier otro caso no definido
    # esac
    #
    # El doble `;;` se usa para separar cada bloque dentro del case.
    # ==========================
    
    case $opcion in
        1)
            echo "\n${green}Inicializando un nuevo repositorio...${reset}"
            echo "\n${yellow}Este comando crea un nuevo repositorio Git en el directorio actual.${reset}"
            echo "\n${blue}Comando: git init${reset}"
            git init
            ;;
        2)
            echo "\n${green}Verificando el estado del repositorio...${reset}"
            echo "\n${yellow}Este comando muestra los cambios en el repositorio, incluyendo archivos modificados y sin seguimiento.${reset}"
            echo "\n${blue}Comando: git status${reset}"
            git status
            ;;
        3)
            echo "\n${green}Agregando archivos al área de staging...${reset}"
            echo "\n${yellow}Este comando añade archivos al área de staging para prepararlos antes de hacer un commit.${reset}"
            echo "\n${blue}Comando: git add <archivo>${reset}"
            read -rp "Ingresa el archivo o usa '.' para todos: " archivo
            git add "$archivo"
            ;;
        4)
            echo "\n${green}Haciendo un commit...${reset}"
            echo "\n${yellow}Este comando guarda los cambios en el historial del repositorio con un mensaje descriptivo.${reset}"
            echo "\n${blue}Comando: git commit -m \"mensaje\"${reset}"
            read -rp "Escribe un mensaje para el commit: " mensaje
            git commit -m "$mensaje"
            ;;
        5)
            echo "\n${green}Mostrando historial de commits...${reset}"
            echo "\n${yellow}Este comando muestra el historial de commits en el repositorio.${reset}"
            echo "\n${blue}Comando: git log --oneline --graph --decorate${reset}"
            git log --oneline --graph --decorate
            ;;
        6)
            echo "\n${green}Gestionando ramas...${reset}"
            echo "\n${yellow}Este comando permite ver, crear o cambiar entre ramas en Git.${reset}"
            echo "\n${blue}Comando: git branch / git switch -c <nombre_rama>${reset}"
            read -rp "Ingresa el nombre de la nueva rama o deja en blanco para ver las existentes: " rama
            if [ -z "$rama" ]; then
                git branch
            else
                git switch -c "$rama"
            fi
            ;;
        7)
            echo "\n${green}Fusionando ramas...${reset}"
            echo "\n${yellow}Este comando combina cambios de una rama con la rama actual.${reset}"
            echo "\n${blue}Comando: git merge <nombre_rama>${reset}"
            read -rp "Ingresa la rama a fusionar en la actual: " rama
            git merge "$rama"
            ;;
        8)
            echo "\n${green}Subiendo cambios al repositorio remoto...${reset}"
            echo "\n${yellow}Este comando sube los commits locales a un repositorio remoto.${reset}"
            echo "\n${blue}Comando: git push origin main${reset}"
            git push origin main
            ;;
        9)
            echo "\n${green}Descargando cambios remotos...${reset}"
            echo "\n${yellow}Este comando obtiene y fusiona cambios del repositorio remoto.${reset}"
            echo "\n${blue}Comando: git pull origin main${reset}"
            git pull origin main
            ;;
        10)
            echo "\n${red}Saliendo del asistente de Git...${reset}"
            break  # Rompe el bucle y termina el script
            ;;
        *)
            echo "\n${red}❌ Opción no válida, intenta de nuevo.${reset}"
            ;;
    esac
    
    echo "\nPresiona Enter para continuar..."
    read input
    
    # ==========================
    # Explicación de `if [ -z "$input" ]; then`
    #
    # `-z` verifica si la variable está vacía. Si el usuario solo presiona Enter,
    # la variable `$input` estará vacía y se ejecutará `clear` para limpiar la pantalla.
    #
    # `if [ condición ]; then` es la sintaxis básica de un condicional en Bash.
    #
    # Diferencia entre `[ ... ]` y `[[ ... ]]`:
    # - `[ ... ]` es la sintaxis POSIX tradicional.
    # - `[[ ... ]]` es una extensión de Bash que permite operadores avanzados
    #   como `&&`, `||` y expresiones regulares.
    # =========================
cat << EOF
    if [ -z "$input" ]; then  # Comprueba si el usuario solo presionó Enter
        clear
    fi
EOF
done
