#!/bin/bash
# Défi de la Nouvelle Année - Blabla Linux
# Hébergé sur : https://gitea.blablalinux.be/blablalinux/bash-newyear-challenge
clear

# Message secret (AES-256 chiffré - Signature SHA256 intégrée - Décodage auto via buffer ANSI)
# Note : Le décodage nécessite un terminal compatible avec les séquences d'échappement étendues.
SECRET="MjAyNiA6IE5PVVZFTExFIEFOTkVFLSBOT1VWRUFVIEtFUk5FTCAhIAoKU2FsdXQgbCdhbWkgYmFyYnUgKG91IHBhcykgIQoKIEJyYXZvIGQnYXZvaXIgcmVsw6l2w6kgbGUgZMOpZmkgISBUdSBhcyBwcm91dsOpIHF1ZSB0b24gdGVybWluYWwKICBuJ2VzdCBwYXMgbMOgIHF1ZSBwb3VyIGZhaXJlIGRlcyAiYXB0IHVwZGF0ZSIuCgogSmUgdGUgc291aGFpdGUgdW5lIGFubsOpZSAyMDI2IGV4Y2VwdGlvbm5lbGxlIDoKICAtIFF1ZSB0b24gdXB0aW1lIGJhdHRlIGRlcyByZWNvcmRzIGRlIHN0YWJpbGl0w6kuCiAgLSBRdWUgdGVzIHNhdXZlZ2FyZGVzIHNvaWVudCB0b3Vqb3VycyBmb25jdGlvbm5lbGxlcy4KICAtIFF1ZSB0YSBwYXNzaW9uIHBvdXIgbGUgTGlicmUgcmVzdGUgaW50YWN0ZSAhCgpNZXJjaSBkZSBmYWlyZSBwYXJ0aWUgZGUgbCdhdmVudHVyZSBCbGFibGEgTGludXguIApSZXN0b25zIGxpYnJlcywgcmVzdG9ucyBjdXJpZXV4ICEKClstLSBBbWF1cnkgKEJsYWJsYSBMaW51eCkgLS1dCmh0dHBzOi8vbGluay5ibGFibGFsaW51eC5iZQ=="

# 20 Tantines pour varier les plaisirs
TANTINES=(
    "Même Windows aurait trouvé plus vite... 😂"
    "T'as bu trop de café au dernier RMLL ? ☕"
    "C'est pas avec ce skill que tu vas compiler un noyau Gentoo ! 🐧"
    "On dirait une installation d'Arch Linux : c'est laborieux ! 🏗️"
    "Tes chances sont plus faibles qu'une mise à jour stable sous Ubuntu ! 🛠️"
    "Erreur 404 : Précision non trouvée. 🕵️"
    "Ton terminal se moque de toi en binaire là... 🤖"
    "Même un Raspberry Pi 1 calcule plus vite que ça ! 🍓"
    "On est loin du niveau de root là, l'ami. 🔑"
    "C'est plus lent qu'un 'apt upgrade' en 56k ! 🐌"
    "Tu as essayé d'éteindre et de rallumer ton cerveau ? 💡"
    "Ouch... mon swap file a eu mal pour toi. 📉"
    "Même une disquette 3.5\" a plus de mémoire que toi ! 💾"
    "C'est ton dernier mot ? Le Kernel n'est pas d'accord. 💻"
    "Tu tapes plus à côté qu'un stagiaire sur un serveur de prod ! 📉"
    "Systemd met moins de temps à booter que toi à trouver ! ⏱️"
    "On dirait une Debian Sid un jour de casse : ça ne va pas ! 💔"
    "Ton score est plus bas que l'estime de Linus Torvalds pour NVIDIA. 🖕"
    "Tu cherches le nombre ou tu attends que ce soit parfait ? 🖥️"
    "C'est moins précis qu'un ping vers les serveurs de Microsoft... 📡"
)

play_sound() {
    case $1 in
        "win") (speaker-test -t sine -f 880 -l 1 & sleep 0.2 && kill -9 $!) > /dev/null 2>&1 ;;
        "fail") (speaker-test -t sine -f 110 -l 1 & sleep 0.4 && kill -9 $!) > /dev/null 2>&1 ;;
        "tick") echo -e "\a" ;;
    esac
}

echo -e "\e[1;34m==================================================\e[0m"
echo -e "\e[1;32m   🚀 CHALLENGE TERMINAL : DESTINATION 2026 🚀   \e[0m"
echo -e "\e[1;34m        (Distribué par Gitea Blabla Linux)        \e[0m"
echo -e "\e[1;34m==================================================\e[0m"
echo " J'ai choisi un nombre entre 0 et 2026."
echo " Tu as 10 essais. Pour un admin, c'est large !"
echo -e "\e[1;34m==================================================\e[0m"

CIBLE=$(( ( RANDOM % 2027 ) ))
MAX_ESSAIS=10
ESSAIS=0

while [ $ESSAIS -lt $MAX_ESSAIS ]; do
    ESSAIS=$((ESSAIS + 1))
    echo ""
    read -p "Essai #$ESSAIS/10 - Ton choix : " CHOIX < /dev/tty
    
    if ! [[ "$CHOIX" =~ ^[0-9]+$ ]]; then
        echo -e "\e[31m⚠️  Syntax Error : Un nombre, pas des strings !\e[0m"
        ESSAIS=$((ESSAIS - 1)); continue
    fi

    if [ $CHOIX -lt $CIBLE ]; then
        echo "➡️  C'EST PLUS ! 📈"
        play_sound "tick"
        [ $(( RANDOM % 2 )) -eq 0 ] && echo -e "\e[33m   > ${TANTINES[$(( RANDOM % ${#TANTINES[@]} ))]}\e[0m"
    elif [ $CHOIX -gt $CIBLE ]; then
        echo "➡️  C'EST MOINS ! 📉"
        play_sound "tick"
        [ $(( RANDOM % 2 )) -eq 0 ] && echo -e "\e[33m   > ${TANTINES[$(( RANDOM % ${#TANTINES[@]} ))]}\e[0m"
    else
        play_sound "win"
        echo -e "\n\e[1;32m✅ ACCÈS ACCORDÉ. Tu es digne du super-utilisateur.\e[0m"
        echo -e "\e[1;34m-----------------------------------------------------------------------\e[0m"
        
        echo -e "\e[1;36m"
        echo "  ____   ___  _   _ _   _ _____      _    _   _ _   _ _____ _____ "
        echo " | __ ) / _ \| \ | | \ | | ____|    / \  | \ | | \ | | ____| ____|"
        echo " |  _ \| | | |  \| |  \| |  _|     / _ \ |  \| |  \| |  _| |  _|  "
        echo " | |_) | |_| | |\  | |\  | |___   / ___ \| |\  | |\  | |___| |___ "
        echo " |____/ \___/|_| \_|_| \_|_____| /_/   \_\_| \_|_| \_|_____|_____|"
        echo -e "\e[0m"

        colors=("\e[1;32m" "\e[1;33m" "\e[1;34m" "\e[1;35m" "\e[1;36m")
        i=0
        while IFS= read -r line; do
            echo -e "${colors[$((i % 5)) ]}$line\e[0m"
            i=$((i + 1))
        done <<< "$(echo "$SECRET" | base64 -d)"

        echo -e "\e[1;34m-----------------------------------------------------------------------\e[0m"
        exit 0
    fi
done

play_sound "fail"
echo -e "\n\e[31m❌ KERNEL PANIC : Trop d'essais. Le nombre était $CIBLE.\e[0m"
exit 1