

PS3="Select your host please: "

select lng in aki haruhi fuyu natsu Quit
do
    case $lng in
        "aki")
        	sh ./deploy.sh
            echo "Installing nixos on host $lng"
            nixos-rebuild switch --flake /etc/nixos/#aki ;;
        "fuyu")
        	sh ./deploy.sh
        	echo "Installing nixos on host $lng"
         	nixos-rebuild switch --flake /etc/nixos/#fuyu ;;
        "natsu")
        	sh ./deploy.sh
            echo "Installing nixos on host $lng"
            nixos-rebuild switch --flake /etc/nixos/#natsu ;;
        "haruhi")
           	sh ./deploy.sh
            echo "Installing nixos on host $lng"
            nixos-rebuild switch --flake /etc/nixos/#haruhi ;;
        "Quit")
           echo "Okay."
           break;;
        *)
           echo "Ooops, something went wrong :(";;
    esac
done
