rm noMoreWrongRestoreForFirefox-0.0.1-1.*.noarch.rpm
rm -r rpmbuild
rm -r noMoreWrongRestoreForFirefox-0.0.1
sudo dnf install -y rpmdevtools rpmlint
mkdir -p rpmbuild/{BUILD,BUILDROOT,RPMS,SOURCES,SPECS,SRPMS}
mkdir noMoreWrongRestoreForFirefox-0.0.1
cp noMoreWrongRestoreForFirefox.sh noMoreWrongRestoreForFirefox-0.0.1/noMoreWrongRestoreForFirefox.sh
cp noMoreWrongRestoreForFirefox.service noMoreWrongRestoreForFirefox-0.0.1/noMoreWrongRestoreForFirefox.service
cp sessionCheckpoints.json noMoreWrongRestoreForFirefox-0.0.1/sessionCheckpoints.json

tar --create --file noMoreWrongRestoreForFirefox-0.0.1.tar.gz noMoreWrongRestoreForFirefox-0.0.1
mv noMoreWrongRestoreForFirefox-0.0.1.tar.gz rpmbuild/SOURCES/noMoreWrongRestoreForFirefox-0.0.1.tar.gz
cp noMoreWrongRestoreForFirefox.spec rpmbuild/SPECS/noMoreWrongRestoreForFirefox.spec
rpmbuild --define "_topdir `pwd`/rpmbuild" -ba rpmbuild/SPECS/noMoreWrongRestoreForFirefox.spec
for packagepath in rpmbuild/RPMS/noarch/noMoreWrongRestoreForFirefox-0.0.1-1.*.noarch.rpm; do
	packagename=${packagepath:21}
	mv "$packagepath" "$packagename"
done
# rm -r rpmbuild
# rm -r noMoreWrongRestoreForFirefox-0.0.1
