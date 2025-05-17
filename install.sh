PS3="Select your host please: "

select lng in aki haruhi fuyu natsu Quit
do
    case $lng in
        "aki")
        	sh ./deploy.sh
            echo "Installing nixos on host $lng"
            nixos-rebuild switch --flake /etc/nixos/#aki
            break ;;
        "fuyu")
        	sh ./deploy.sh
        	echo "Installing nixos on host $lng"
         	nixos-rebuild switch --flake /etc/nixos/#fuyu
            break ;;
        "natsu")
        	sh ./deploy.sh
            echo "Installing nixos on host $lng"
            nixos-rebuild switch --flake /etc/nixos/#natsu
            break ;;
        "haruhi")
           	sh ./deploy.sh
            echo "Installing nixos on host $lng"
            nixos-rebuild switch --flake /etc/nixos/#haruhi
            break ;;
        "Quit")
           echo "Have a nice day."
           break;;
        *)
           echo "Have a nice day."
           break;;
    esac
done
