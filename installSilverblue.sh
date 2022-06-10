toolbox create
toolbox run ./makeRPM.sh
for package in noMoreWrongRestoreForFirefox-0.0.1-1.*.noarch.rpm; do
	rpm-ostree install "$package"
done

echo "Please restart your system!"
echo "Please run \"sudo systemctl enable noMoreWrongRestoreForFirefox.service\" and restart once more"
