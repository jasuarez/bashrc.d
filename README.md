These are the configurations I use in my own .bashrc file.

To use them:

```
git clone https://github.com/jasuarez/bashrc.d.git ~/.bashrc.d

cat <<EOF >> ~/.bashrc
# Run per-file configuration
if [ -d ~/.bashrc.d ]; then
	for b in ~/.bashrc.d/*.sh ; do
		source \$b
	done
fi
EOF
